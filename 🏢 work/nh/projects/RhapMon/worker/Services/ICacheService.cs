using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using RhapmonShared.Models;

namespace worker.Services
{
    public interface ICacheService
    {
        void Init(IConfiguration cfg);
        Task AppendCommpointDataToCache (RhapsodyCommpointDataModel rhapData, IConfiguration cfg, RhapComponentModel componentModel);
        Task WriteAlertsToCache (RhapsodyAlertModel alertsModel);
        Task<IEnumerable<RhapsodyCommpointDataModel>> GetRecentCommpointData(string commpointId, int count);
        Task AddOrUpdateIssueInCache(ComponentIssueModel componentIssue);
        Task<ComponentIssueModel> GetIssueFromCache(ComponentIssueModel componentIssue);
        Task RemoveIssueFromCache(ComponentIssueModel componentIssue);
        Task MarkIssueAsNotifiedInCache(ComponentIssueModel subscription);
    }
}
