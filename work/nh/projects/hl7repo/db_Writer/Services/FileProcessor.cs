using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Serilog;
using Shared.Encryption;
using Shared.Models;
using Shared.Repository;

namespace db_Writer.Services
{
    public class FileProcessor
    {
        private readonly Encryptor _encryptor;
        private readonly string _direction;
        private readonly int _maxMessageBatchSize;
        private readonly int _maxFileSizeMB;

        public FileProcessor(Encryptor encryptor, IConfiguration cfg)
        {
            Buffer = new List<MessageModel>();
            encryptor.SetEncryptionKey(cfg.GetValue<string>("encryption:key"));
            _encryptor = encryptor;
            _direction = cfg.GetValue<string>("fileProcessor:messageDirection");
            _maxMessageBatchSize = cfg.GetValue<int>("worker:maxMessageBatchSize");
            _maxFileSizeMB = cfg.GetValue<int>("fileProcessor:maxFileSizeMB");
        }
        public string FolderPath { get; set; }
        public string[] FileExtensions { get; set; }
        public bool IsProcessing { get; internal set; }
        private List<MessageModel> Buffer { get; set; }

        /// <summary>
        /// Get first file in folder that matches the extension
        /// </summary>
        /// <returns>full file path</returns>
        public IEnumerable<string> GetFiles(){
            try
            {
                var allFiles = Directory.GetFiles(FolderPath, "*.*", SearchOption.TopDirectoryOnly);
                if (FileExtensions.Any()) allFiles = allFiles.Where(f => FileExtensions.Any(e => f.EndsWith(e))).ToArray();
                return allFiles.OrderBy(x => File.GetCreationTime(x)).ToList();    
            }
            catch (System.Exception ex)
            {
                Log.Error(ex, $"Error getting files from folder: {FolderPath}");
                return null;
            }
        }

        public int GetFileCount(){
            return Directory.GetFiles(FolderPath, "*.*", SearchOption.TopDirectoryOnly)
                    .Where(f => FileExtensions.Any(e => f.EndsWith(e)))
                    .Count();
        }

        /// <summary>
        /// Moves the file to an Archive folder residing in the same folder as the file
        /// </summary>
        /// <param name="filePath">Full path to the file</param>
        /// <returns>true: if sucess; false: if failure</returns>
        public bool MoveFiletoProcessedFolder(string filePath){
            try
            {
                string processedFolder = Path.Combine(FolderPath, "Processed");
                if (!Directory.Exists(processedFolder)){
                    Directory.CreateDirectory(processedFolder);
                }
                string archiveFilePath = Path.Combine(processedFolder, Path.GetFileName(filePath));
                if (File.Exists(filePath)){
                    if (File.Exists(archiveFilePath)) 
                        archiveFilePath = 
                            $"{archiveFilePath.Replace(Path.GetExtension(archiveFilePath),"")}_{DateTime.Now:yyyyMMddHHmmss}.{Path.GetExtension(archiveFilePath)}";
                    Log.Information($"Moving file {filePath} to {archiveFilePath}");
                    File.Move(filePath, archiveFilePath);  
                }
            }
            catch (System.Exception)
            {
                return false;                
            }
            return true;
        }

        /// <summary>
        /// Get files from folder path in configuration and process each (Entry point of this class) 
        /// </summary>
        /// <param name="cfg">Configuration</param>
        /// <param name="repo">Message Repository (connection to database)</param>
        /// <returns>An awaitable Task</returns>
        public async Task ProcessFiles(IConfiguration cfg, IMessageRepo_Repository repo)
        {
            IsProcessing = true;
            // Set Folder Path
            FolderPath = cfg.GetValue<string>("fileProcessor:folderPath");
            Log.Information($"Looking for files to process in folder: {FolderPath}");
            if (string.IsNullOrEmpty(FolderPath)) throw new System.ArgumentNullException("FolderPath");
            // Set Extensions
            FileExtensions = cfg.GetValue<string>("fileProcessor:fileExtensions").Split(new[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
            if (GetFileCount() == 0) {
                IsProcessing = false; 
                return; 
            } 

            // Read messages from files and write message batches to the database
            var filepaths = GetFiles();
            foreach (var filepath in filepaths) {
                Log.Information($"Processing file: {filepath}");
                var fileSizeMB = new FileInfo(filepath).Length / (1024 * 1024);
                if (fileSizeMB > _maxFileSizeMB) {
                    IsProcessing = false;
                    throw new System.ArgumentOutOfRangeException($"Skipping file as size [{fileSizeMB}] exceeeds max allowed size of {_maxFileSizeMB} Megabytes.");
                }
                try
                {
                    Buffer.AddRange(GetHl7Messages(filepath));
                }
                catch (System.Exception ex)
                {
                    IsProcessing = false;
                    throw new Exception($"Failed to read messages from file:{Environment.NewLine}[{filepath}]", ex);
                }
                
                // If Buffer is already full, write to database until empty
                if (Buffer.Count() > _maxMessageBatchSize) {
                    await ProcessBufferedMessages(repo);

                    MoveFiletoProcessedFolder(filepath);
                }
            }
            // If Buffer is not empty, write to database
            await ProcessBufferedMessages(repo);
            
            // Move any file that has not already been moved to the processed folder
            foreach (var file in filepaths) MoveFiletoProcessedFolder(file);

            IsProcessing = false;
        }

        private async Task ProcessBufferedMessages(IMessageRepo_Repository repo)
        {
            while(Buffer.Count() > 0) {
                var messages = Buffer.Take(_maxMessageBatchSize);
                var affectedRow = await repo.AddBatch(messages);
                if (affectedRow != messages.Count()) throw new Exception("Failed to write the message or all messages in a batch into the database");
                Buffer.RemoveRange(0, affectedRow);
            }
        }

        /// <summary>
        /// Get message(s) from file and return as a list of HL7Message objects
        /// If message is not in HL7 format, only MessageContent property will be populated
        /// </summary>
        /// <param name="filepath"></param>
        /// <returns>List of HL7Message objects - only MessageContent for non-HL7 messages</returns>
        private IEnumerable<MessageModel> GetHl7Messages(string filepath)
        {
            try
            {
                var fileContent = File.ReadAllText(filepath);
                var isHL7 = fileContent.StartsWith("MSH|") || fileContent.StartsWith("FHS|");
                var isBatch = fileContent.StartsWith("FHS|");

                if (!isHL7) return new List<MessageModel>(){ 
                    EnrichMessage(new MessageModel(fileContent))
                };
                else if (isBatch) return GetBatchHL7Messages(fileContent);
                else return new List<MessageModel>(){ 
                    EnrichMessage(new MessageModel(new HL7Message(fileContent)))
                };
            }
            catch (System.Exception)
            {
                Log.Error($"Failed to read messages from file with following path:{Environment.NewLine}[{filepath}]");
                return null;
            }
        }

        /// <summary>
        /// Read a batch of HL7 messages from a file and return as a list of HL7Message objects
        /// </summary>
        /// <param name="fileContent"></param>
        /// <returns>List of HL7Message objects</returns>
        private IEnumerable<MessageModel> GetBatchHL7Messages(string fileContent)
        {
            // Remove batch header FHS|^~\&|\x0DBHS|^~\&|
            var messageContent = fileContent.Substring(19, fileContent.Length - 19);

            // Split on \x0DMSH| and add MSH|
            var messages = messageContent.Split(new[] { "\x0DMSH|" }, StringSplitOptions.RemoveEmptyEntries).Select(m => $"MSH|{m}");

            var hl7messages = messages
                                .Select(m => 
                                    EnrichMessage(
                                        new MessageModel(
                                            new HL7Message(m)
                                        )
                                    )
                                ).ToList();

            return hl7messages;
        }

        /// <summary>
        /// Encrypts the message content
        /// </summary>
        /// <param name="message"></param>
        /// <returns>an instance of MessageModel with encrypted MessageContent</returns>
        private MessageModel EnrichMessage(MessageModel message)
        {
            message.Direction = _direction;
            message.InsertDateTime = DateTime.Now;
            message.MessageContent = _encryptor.Encrypt(message.MessageContent);
            return message;
        }
 }
}