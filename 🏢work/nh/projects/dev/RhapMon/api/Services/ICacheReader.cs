using System.Collections.Generic;
using System.Threading.Tasks;

using RhapmonShared.Models;

namespace api.Services
{
    public interface ICacheReader
    {
        Task<IEnumerable<RhapsodyCommpointDataModel>> GetCommpointDataAsync(string commpointId);

        Task<RhapsodyAlertModel> GetAlerts();
    }
}
