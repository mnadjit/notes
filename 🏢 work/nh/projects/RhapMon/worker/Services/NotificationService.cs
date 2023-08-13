using System;
using System.Net.Mail;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;

namespace worker.Services
{
    public class NotificationService : INotificationService
    {
        private readonly IConfiguration _cfg;
        private readonly string _smtpServer;
        private readonly string _senderEmail;

        public NotificationService(IConfiguration cfg)
        {
            _cfg = cfg;
            _smtpServer = cfg.GetValue<string>("Notifications:SmtpServer");
            _senderEmail = cfg.GetValue<string>("Notifications:SenderEmail");
        }
        
        public async Task<bool> SendNotification(string emailSubject, string emailBody, string recipientsEmails)
        {
            var message = new MailMessage()
            {
                From = new MailAddress(_senderEmail),
                Subject = emailSubject,
                Body = emailBody,
                BodyEncoding = System.Text.Encoding.UTF8
            };

            foreach (var recipient in recipientsEmails.Split(';', StringSplitOptions.RemoveEmptyEntries))
                message.To.Add(recipient);
            
            try
            {
                var client = new SmtpClient(_smtpServer);
                await client.SendMailAsync(message);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return false;
            }
            message.Dispose();
            return true;
        }
    }
}