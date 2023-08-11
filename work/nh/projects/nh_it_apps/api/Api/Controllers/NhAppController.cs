using System.Linq;

using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

using api.Models.DataModels;
using api.Models.Entities;
using api.Models.ViewModels;

using AutoMapper;

namespace api.Api.Controllers
{
    [Route("/api/[Controller]")]
    [ApiController]
    [Produces("application/json")]
    public class NhAppController : ControllerBase
    {
        private INhAppsRepository _repo;
        private readonly IMapper _mapper;
        private readonly ILogger<NhAppController> _logger;
        private readonly string _db_unavailable_msg = "Database not available!";
        public NhAppController(ILogger<NhAppController> logger, INhAppsRepository repo, IMapper mapper)
        {
            _repo = repo;
            _mapper = mapper;
            _logger = logger;
        }
        [HttpGet]
        public IActionResult GetAll()
        {
            
            if (!_repo.DatabaseIsAvailable()) return NotFound(_db_unavailable_msg);
            try
            {
                //TODO improve this
                var nhApps = _repo.GetAll();
                if (nhApps == null) return NotFound("Nothing was found!");
                return Ok(_repo.GetAll().Select(x => _mapper.Map<NhAppViewModel>(x)));
            }
            catch (System.Exception ex)
            {
                return Problem($"Failed to return data: {ex}");
            }
        }
        [HttpGet("{id:int}")]
        public IActionResult Get(int id)
        {
            if (!_repo.DatabaseIsAvailable()) return NotFound(_db_unavailable_msg);
            try
            {
                var nhApp = _repo.GetById(id);
                if (nhApp == null) return NotFound("Nothing was found!");
                return Ok(_mapper.Map<NhAppViewModel>(nhApp));
            }
            catch (System.Exception ex)
            {
                return Problem($"Failed to return data: {ex}");
            }
        }

        [HttpPost]
        public IActionResult AddNew([FromBody]NhAppViewModel model)
        {
            if (!_repo.DatabaseIsAvailable()) return NotFound(_db_unavailable_msg);
            try
            {
                var nhApp = _mapper.Map<NhApp>(model);
                _repo.AddEntity(nhApp);
                if (_repo.SaveAll() > 0)
                    return Created($"/api/myobject/{nhApp.Id}", nhApp);
                else return Problem("Unable to add data to the database!");
            }
            catch (System.Exception ex)
            {
                return Problem($"Failed to store data in the database: {ex.Message}");
            }
        }
    }
}
