using System.Threading.Tasks;

using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

using api.Services;

using Serilog;

namespace api.Controllers
{
    //[Authorize]
    [ApiController]
    [Route("api/[controller]/{id}")]
    public class CommpointDataController : ControllerBase
    {
        private readonly ILogger<CommpointDataController> _logger;
        private readonly CacheReader _cache;
        private readonly IConfiguration _cfg;
        private readonly string _commPointDataPrefix;

        public CommpointDataController(ILogger<CommpointDataController> logger, CacheReader cache, IConfiguration cfg)
        {
            _logger = logger;
            _cache = cache;
            _cfg = cfg;
            _commPointDataPrefix = _cfg.GetValue<string>("cpDataPrefix");
        }

        [HttpGet]
        public async Task<IActionResult> GetAsync(string id)
        {
            try
            {
                var commpointData = await _cache.GetCommpointDataAsync(id);
                return Ok(commpointData);
            }
            catch (System.Exception ex)
            {
                Log.Error(ex.Message, ex);
                return Problem("Error occured while reading data from Redis cache");
            }

        }
    }
}
