using System.Threading.Tasks;

namespace worker.Services
{
    public interface INotificationService
    {
        Task<bool> SendNotification(string emailSubject, string emailBody, string recipientsEmails);


    }
}