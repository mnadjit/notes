// Rob Holme (rob@holme.com.au)
// 03/06/2015 - Intital version
// 01/09/2016 - Changed behaviour to always send ACKS (unless -NoACK is set). No longer honouring the ACK mode from MSH-15, this caused issues for senders epecting ACKS but not setting MSH-15.
// 2021-07-07 - Mehdi N Tehrani (m.nadji.t@gmail.com) - Customised to handle non-HL7 messages - and use Serilog for logging

namespace HL7server.Services
{
    using System;
    using System.Collections.Concurrent;
    using System.Linq;
    using System.Net;
    using System.Net.Sockets;
    using System.Text;
    using System.Threading;

    using Serilog;

    using Shared.Models;

    class HL7TCPListener
    {
        const int TCP_TIMEOUT = 300000; // timeout value for receiving TCP data in millseconds
        private TcpListener tcpListener;
        private Thread tcpListenerThread;
        private Thread passthruThread;
        private Thread passthruAckThread;
        private int listernerPort;
        private string archivePath = null;
        private bool sendACK = true;
        private string passthruHost = null;
        private int passthruPort;
        private NetworkStream PassthruClientStream;
        private TcpClient passthruClient; //= new TcpClient();
        private IPEndPoint remoteEndpoint;// = new IPEndPoint(IPAddress.Parse(this.PassthruHost), this.passthruPort);
        private ConcurrentQueue<string> messageQueue = new ConcurrentQueue<string>();
        private bool runThread = true;
        private readonly CacheService cache;
        private readonly int? expiryMinutes;
        private readonly string[] allowedHosts;

        /// <summary>
        /// Constructor
        /// </summary>
        public HL7TCPListener(int port)
        {
            this.listernerPort = port;
        }

        public HL7TCPListener(int port, string[] allowedHosts, CacheService cache, int? expiryMinutes)
        {
            this.listernerPort = port;
            this.cache = cache;
            this.expiryMinutes = expiryMinutes;
            this.allowedHosts = allowedHosts;
        }

        /// <summary>
        /// Start the TCP listener. Log the options set.
        /// </summary>
        public bool Start()
        {
            // start a new thread to listen for new TCP conmections
            this.tcpListener = new TcpListener(IPAddress.Any, this.listernerPort);
            this.tcpListenerThread = new Thread(new ThreadStart(StartListener));
            this.tcpListenerThread.Start();
            this.LogInformation("# Starting HL7 listener on port " + this.listernerPort);
            // log information to the console about the options provided by the user
            if (this.archivePath != null)
            {
                this.LogInformation("# Archiving received messages to: " + this.archivePath);
            }
            if (!sendACK)
            {
                this.LogInformation("# Acknowledgements (ACKs) will not be sent");
            }
            // if  a passthru host has been specified, create a new thread to send messages to the PassThru host
            if (this.passthruHost != null)
            {
                // create a connection to the Passthru host if the -PassThru option was specified.
                try
                {
                    passthruClient = new TcpClient();
                    remoteEndpoint = new IPEndPoint(IPAddress.Parse(this.PassthruHost), this.passthruPort);
                    passthruClient.Connect(remoteEndpoint);
                    PassthruClientStream = passthruClient.GetStream();
                    PassthruClientStream.ReadTimeout = TCP_TIMEOUT;
                    PassthruClientStream.WriteTimeout = TCP_TIMEOUT;
                    this.LogInformation("# Passing messages onto " + this.passthruHost + ":" + this.passthruPort);
                }
                catch (Exception e)
                {
                    LogWarning("Unable to create connection to PassThru host " + passthruHost + ":" + passthruPort);
                    LogWarning(e.Message);
                    this.RequestStop();
                    return false;
                }
                // create a thread to send messages to the Passsthru host 
                this.passthruThread = new Thread(new ThreadStart(SendData));
                passthruThread.Start();
                // create a thread to recieve the ACKs from the passthru host
                this.passthruAckThread = new Thread(new ThreadStart(ReceieveACK));
                passthruAckThread.Start();
                LogInformation("Connected to PassThru host");
            }
            return true;
        }


        /// <summary>
        /// Stop the all threads
        /// </summary>
        public void RequestStop()
        {
            this.runThread = false;
        }

        /// <summary>
        /// Start listening for new connections
        /// </summary>
        private void StartListener()
        {
            try
            {
                this.tcpListener.Start();
                // run the thread unless a request to stop is received
                while (this.runThread)
                {
                    // waits for a client connection to the listener
                    TcpClient client = this.tcpListener.AcceptTcpClient();

                    //var client = this.tcpListener.AcceptSocket();
                    if (RemoteHostIsAllowed(client.Client.RemoteEndPoint, this.allowedHosts))
                    {
                        this.LogInformation("New client connection accepted from " + client.Client.RemoteEndPoint);
                        // create a new thread. This will handle communication with a client once connected
                        Thread clientThread = new Thread(new ParameterizedThreadStart(ReceiveData));
                        clientThread.Start(client);
                    }
                    else
                    {
                        this.LogWarning("Remote host not allowed - Connection dropped from " + client.Client.RemoteEndPoint);
                        client.GetStream().Close();
                        client.Close();
                    }
                }
            }
            catch (Exception e)
            {
                LogWarning("An error occurred while attempting to start the listener on port " + this.listernerPort);
                LogWarning(e.Message);
                LogWarning("HL7Listener exiting.");
            }
        }

        /// <summary>
        /// Receive data from a client connection, look for MLLP HL7 message.
        /// </summary>
        /// <param name="client"></param>
        private void ReceiveData(object client)
        {
            // generate a random sequence number to use for the file names
            Random random = new Random(Guid.NewGuid().GetHashCode());
            int filenameSequenceStart = random.Next(0, 1000000);

            TcpClient tcpClient = (TcpClient)client;
            NetworkStream clientStream = tcpClient.GetStream();
            clientStream.ReadTimeout = TCP_TIMEOUT;
            clientStream.WriteTimeout = TCP_TIMEOUT;

            byte[] messageBuffer = new byte[4096];
            int bytesRead;
            String messageData = "";
            int messageCount = 0;

            while (true)
            {
                bytesRead = 0;
                try
                {
                    // Wait until a client application submits a message
                    bytesRead = clientStream.Read(messageBuffer, 0, 4096);
                }
                catch
                {
                    // A network error has occurred
                    LogInformation("Connection from " + tcpClient.Client.RemoteEndPoint + " has ended");
                    break;
                }
                if (bytesRead == 0)
                {
                    // The client has disconected
                    LogInformation("The client " + tcpClient.Client.RemoteEndPoint + " has disconnected");
                    break;
                }
                // Message buffer received successfully
                messageData += Encoding.UTF8.GetString(messageBuffer, 0, bytesRead);
                // Find a VT character, this is the beginning of the MLLP frame
                int start = messageData.IndexOf((char)0x0B);
                if (start >= 0)
                {
                    // Search for the end of the MLLP frame (a FS character)
                    int end = messageData.IndexOf((char)0x1C);
                    if (end > start)
                    {
                        messageCount++;
                        try
                        {
                            // queue the message to sent to the passthru host if the -PassThru option has been set
                            if (passthruHost != null)
                            {
                                messageQueue.Enqueue(messageData.Substring(start + 1, end - (start + 1)));
                            }

                            var messageContent = messageData.Substring(start + 1, end - (start + 1));
                            var isHL7 = messageContent.StartsWith("MSH");

                            HL7Message message;
                            string messageControlID = string.Empty;

                            if (isHL7)
                            {
                                // create a HL7message object from the message recieved. Use this to access elements needed to populate the ACK message and file name of the archived message
                                message = new HL7Message(messageContent);
                                messageData = ""; // reset the message data string for the next message
                                string messageTrigger = message.GetMessageTrigger();
                                messageControlID = message.GetHL7Item("MSH-10")[0];
                                //string acceptAckType = message.GetHL7Item("MSH-15")[0];
                                string dateStamp = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString().PadLeft(2, '0') + DateTime.Now.Day.ToString().PadLeft(2, '0') + DateTime.Now.Hour.ToString().PadLeft(2, '0') + DateTime.Now.Minute.ToString().PadLeft(2, '0');
                                string filename = dateStamp + "_" + (filenameSequenceStart + messageCount).ToString("D6") + "_" + messageTrigger + ".hl7"; //  increment sequence number for each filename

                                // Write the HL7 message to file.
                                //WriteMessagetoFile(message.ToString(), this.archivePath + filename);
                            }

                            // Write message into Redis cache
                            WriteToCacheAsync(messageContent);

                            // send ACK message is MSH-15 is set to AL and ACKs not disbaled by -NOACK command line switch
                            //if ((this.sendACK) && (acceptAckType.ToUpper() == "AL"))
                            if (this.sendACK)
                            {
                                if (isHL7) LogInformation("Sending ACK (Message Control ID: " + messageControlID + ")");
                                // generate ACK Message and send in response to the message received
                                string response = isHL7 ? GenerateACK(messageContent) : GenerateACKnonHL7(messageContent);  // TO DO: send ACKS if set in message header, or specified on command line
                                byte[] encodedResponse = Encoding.UTF8.GetBytes(response);
                                // Send response
                                try
                                {
                                    clientStream.Write(encodedResponse, 0, encodedResponse.Length);
                                    clientStream.Flush();
                                }
                                catch (Exception e)
                                {
                                    // A network error has occurred
                                    LogInformation("An error has occurred while sending an ACK to the client " + tcpClient.Client.RemoteEndPoint);
                                    LogInformation(e.Message);
                                    break;
                                }
                            }
                        }
                        catch (Exception e)
                        {
                            messageData = ""; // reset the message data string for the next message
                            LogWarning("An exception occurred while parsing the message");
                            LogWarning(e.Message);
                            break;
                        }
                    }
                }
            }
            LogInformation("Total messages received:" + messageCount);
            clientStream.Close();
            clientStream.Dispose();
            tcpClient.Close();
        }



        /// <summary> 
        /// Send the HL7 messsage to the remote host in a MLLP frame
        /// </summary>
        /// <param name="ClientStream"></param>
        /// <param name="MessageData"></param>
        private void SendData()
        {
            byte[] receiveBuffer = new byte[4096];
            //         int bytesRead;
            //         string ackData = "";
            string tempMessage;

            while (this.runThread)
            {
                while (messageQueue.TryDequeue(out tempMessage))
                {
                    // generate a MLLP framed messsage
                    StringBuilder messageString = new StringBuilder();
                    messageString.Append((char)0x0B);
                    messageString.Append(tempMessage);
                    messageString.Append((char)0x1C);
                    messageString.Append((char)0x0D);

                    try
                    {
                        // encode and send the message
                        UTF8Encoding encoder = new UTF8Encoding();
                        byte[] buffer = encoder.GetBytes(messageString.ToString());
                        // if the client connection has timed out, or the remote host has disconected, reconnect.
                        if (!this.PassthruClientStream.CanWrite)
                        {
                            LogInformation("Connection to passthru host has closed. Reconecting to " + this.passthruHost + ":" + this.passthruPort);
                            this.passthruClient.Close();
                            this.passthruClient = new TcpClient();
                            this.remoteEndpoint = new IPEndPoint(IPAddress.Parse(this.PassthruHost), this.passthruPort);
                            this.passthruClient.Connect(remoteEndpoint);
                            this.PassthruClientStream = passthruClient.GetStream();
                            this.PassthruClientStream.ReadTimeout = TCP_TIMEOUT;
                            this.PassthruClientStream.WriteTimeout = TCP_TIMEOUT;
                        }
                        LogInformation("Sending message to PassThru host " + this.passthruHost + ":" + this.passthruPort);
                        this.PassthruClientStream.Write(buffer, 0, buffer.Length);
                        this.PassthruClientStream.Flush();
                    }
                    catch (Exception e)
                    {
                        LogWarning("Unable to send messsage to -Passsthru host (" + this.PassthruHost + ":" + this.passthruPort + ")");
                        LogWarning(e.Message);
                    }
                }
                Thread.Sleep(2000);
            }
        }

        /// <summary>
        /// /// <summary>
        /// Write the HL7 message recieved to file. Optionally provide the file path, otherwise use the working directory.     
        /// </summary>
        /// <param name="message"></param>
        /// <param name="filePath"></param>
        private void WriteMessagetoFile(string message, string filename)
        {
            // write the HL7 message to file
            try
            {
                LogInformation("Received message. Saving to file " + filename);
                System.IO.StreamWriter file = new System.IO.StreamWriter(filename);
                file.Write(message);
                file.Close();
            }
            catch (Exception e)
            {
                LogWarning("Failed to write file " + filename);
                LogWarning(e.Message);
            }
        }

        /// <summary>
        /// Generate a string containing the ACK message in response to the original message. Supply a string containing the original message (or at least the MSH segment).
        /// </summary>
        /// <returns></returns>
        string GenerateACK(string originalMessage)
        {
            // create a HL7Message object using the original message as the source to obtain details to reflect back in the ACK message
            HL7Message tmpMsg = new HL7Message(originalMessage);
            string trigger = tmpMsg.GetHL7Item("MSH-9.2")[0];
            string originatingApp = tmpMsg.GetHL7Item("MSH-3")[0];
            string originatingSite = tmpMsg.GetHL7Item("MSH-4")[0];
            string messageID = tmpMsg.GetHL7Item("MSH-10")[0];
            string processingID = tmpMsg.GetHL7Item("MSH-11")[0];
            string hl7Version = tmpMsg.GetHL7Item("MSH-12")[0];
            string ackTimestamp = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString();

            StringBuilder ACKString = new StringBuilder();
            ACKString.Append((char)0x0B);
            ACKString.Append("MSH|^~\\&|MessageRepository|1280|" + originatingSite + "|" + originatingApp + "|" + ackTimestamp + "||ACK^" + trigger + "|" + messageID + "|" + processingID + "|" + hl7Version);
            ACKString.Append((char)0x0D);
            ACKString.Append("MSA|CA|" + messageID);
            ACKString.Append((char)0x1C);
            ACKString.Append((char)0x0D);
            return ACKString.ToString();
        }

        private string GenerateACKnonHL7(string messageContent)
        {
            string ackTimestamp = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString();
            return $"{(char)0x0B}MSH|^~\\&|MessageRepository|1208|||{ackTimestamp}||ACK^|NoMsgID||{(char)0x0D}MSA|CA||{(char)0x1C}{(char)0x0D}";
        }

        /// <summary>
        /// Recieve ACKs from the PassThru host.
        /// Run this in a thread as this will block execution waiting for a response.
        /// </summary>
        private void ReceieveACK()
        {
            int bytesRead;
            string ackData = "";
            byte[] receiveBuffer = new byte[4096];

            // wait for the ACK to be returned, or a timeout occurrs. Do nothing with the ACK recived (discard).
            LogInformation("Recieve ACK thread started");
            while (this.runThread)
            {
                try
                {
                    bytesRead = this.PassthruClientStream.Read(receiveBuffer, 0, 4096);
                    // Message buffer received successfully
                    ackData += Encoding.UTF8.GetString(receiveBuffer, 0, bytesRead);
                    // Find a VT character, this is the beginning of the MLLP frame
                    int start = ackData.IndexOf((char)0x0B);
                    if (start >= 0)
                    {
                        // Search for the end of the MLLP frame (a FS character)
                        int end = ackData.IndexOf((char)0x1C);
                        if (end > start)
                        {
                            LogInformation("ACK received from -PassThru host");
                            ackData = "";
                        }
                    }
                }
                catch (Exception)
                {
                    LogWarning("Connecion timed out or ended while waiting for ACK from PassThru host.");
                    break;
                }
            }
        }

        /// <summary>
        /// Set and get the values of the SendACK option. This can be used to overide sending of ACK messages. 
        /// </summary>
        public bool SendACK
        {
            get { return this.sendACK; }
            set { this.sendACK = value; }
        }


        /// <summary>
        /// The PassthruHost property identifies the host to pass the messages through to
        /// </summary>
        public string PassthruHost
        {
            set { this.passthruHost = value; }
            get { return this.passthruHost; }
        }


        /// <summary>
        /// The PassthruPort property identies the remote port to pass the messages thought to.
        /// </summary>
        public int PassthruPort
        {
            set { this.passthruPort = value; }
            get { return this.passthruPort; }
        }


        /// <summary>
        /// The FilePath property contains the path to archive the received messages to
        /// </summary>
        public string FilePath
        {
            set { this.archivePath = value; }
            get { return this.archivePath; }
        }

        /// <summary>
        /// Write informational event to the console.
        /// </summary>
        /// <param name="message"></param>
        private void LogInformation(string message)
        {
            Log.Information(message);
            //Console.WriteLine(DateTime.Now + ": " + message);
        }


        /// <summary>
        /// Write a warning message to the console
        /// </summary>
        /// <param name="message"></param>
        private void LogWarning(string message)
        {
            Log.Warning(message);
            //Console.ForegroundColor = ConsoleColor.Yellow;
            //Console.WriteLine("WARNING: " + message);
            //Console.ResetColor();
        }

        /// <summary>
        /// Writes received message to Redis cache. If expiryMinutes is null, data will be preserved indefinitely.
        /// </summary>
        /// <param name="message"></param>
        /// <returns></returns>
        public async void WriteToCacheAsync(string message)
        {
            await this.cache.AddMessageToCacheAsync(message, this.expiryMinutes);
        }

        /// <summary>
        /// Checks whether remote host trying to establish TCP connection is listed among Allowed Hosts or not.
        /// </summary>
        /// <param name="remoteEndPoint"></param>
        /// <param name="allowedHosts"></param>
        /// <returns>true: If host is allowed; false: if host not allowed</returns>
        private bool RemoteHostIsAllowed(EndPoint remoteEndPoint, string[] allowedHosts)
        {
            if (allowedHosts.Any(x => x == "*")) return true;
            var ip = remoteEndPoint.ToString().Split(":")[0];
            return Array.IndexOf(allowedHosts, ip) > -1;
        }
    }
}