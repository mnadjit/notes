using System.Collections.Generic;
using System.Threading.Tasks;
using RhapmonShared.Models;

namespace worker.Services
{
    public interface INotificationManager
    {
        Task Run();
        Task FindDroppedThroughputIssuesAndUpdateCache(List<ComponentIssueModel> componentIssuesToMonitor);
        Task HandleDroppedThroughputIssuesInCache(List<ComponentIssueModel> issues);
        Task SendNotification(ComponentIssueModel issue);
    }
}