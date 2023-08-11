using System.Threading.Tasks;

using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

using api.Services;

using RhapmonShared.Models;

namespace api.Controllers
{
    //[Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class AlertsController : ControllerBase
    {
        private readonly ILogger<CommpointDataController> _logger;
        private readonly ICacheReader _cache;
        private readonly IConfiguration _cfg;
        private readonly string _alertsPrefix;
        public AlertsController(ILogger<CommpointDataController> logger, IConfiguration cfg, ICacheReader cache)
        {
            _logger = logger;
            _cache = cache;
            _cfg = cfg;
            _alertsPrefix = _cfg.GetValue<string>("alertsKeyName");
        }

        [HttpGet]
        public async Task<RhapsodyAlertModel> Get()
        {
            var redisInstanceName = _cfg.GetValue<string>("Redis:InstanceName");

            var recordId = $"{redisInstanceName}${_alertsPrefix}";

            var alerts = await _cache.GetAlerts();

            return alerts;
        }
    }
}
