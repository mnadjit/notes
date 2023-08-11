using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using api.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Shared.Encryption;
using Shared.Models;
using Shared.Repository;

namespace api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MessageController : ControllerBase
    {
        private readonly IMessageRepo_Repository _repo;
        private readonly IConfiguration _cfg;
        private readonly ICacheService _cache;

        public MessageController(IMessageRepo_Repository repo, IConfiguration cfg, Encryptor encryptor, ICacheService cache)
        {
            _cfg = cfg;
            encryptor.SetEncryptionKey(_cfg.GetValue<string>("encryption:key"));
            _repo = repo.SetConnectionString(_cfg.GetValue<string>("database:ConnectionString"));
            _repo.SetEncryptor(encryptor);
            _cache = cache;
        }

        [HttpGet]
        public async Task<IEnumerable<MessageModel>> GetAll()
        {
            return await _repo.GetAll();
        }

        [HttpGet]
        [Route("from/{from}/to/{to}")]
        public async Task<IEnumerable<MessageModel>> GetMessages(string from, string to)
        {
            var dateFormat = "yyyyMMddmmss";
            var fromDate = DateTime.ParseExact(from, dateFormat, CultureInfo.InvariantCulture);
            var toDate = DateTime.ParseExact(to, dateFormat, CultureInfo.InvariantCulture);
            return await _repo.GetByDateRange(fromDate, toDate);
        }

        [HttpGet]
        [Route("recent/{count?}")]
        public async Task<IEnumerable<MessageModel>> GetRecentMessages(int count = 1000)
        {
            var messages = (await _cache.GetMessages(count)).Take(count).ToList();
            var repoMessages = new List<MessageModel>();
            if (count > messages.Count())
                repoMessages = (await _repo.GetMostRecent(count - messages.Count())).ToList();
            messages.AddRange(repoMessages);
            return messages.Take(count).OrderByDescending(m => m.MessageDateTime).ToList();
        }

        [HttpGet]
        [Route("search")]
        public async Task<IEnumerable<MessageModel>> GetMessagesByMRNDateEvent (string mrn, string from, string to, 
                                                                                string triggerEvents, int maxCount = 1000)
        {
            return await _repo.GetByMrnDateEventTrigger(mrn, from, to, triggerEvents?.Split(','), maxCount);
        }

        [HttpGet]
        [Route("mrn/{mrn}")]
        public async Task<IEnumerable<MessageModel>> GetMessagesByMRN(string mrn, int count = 1000)
        {
            return await _repo.GetByMRN(mrn, count);
        }

        [HttpGet]
        [Route("mrn/{mrn}/id/{id}")]
        public async Task<MessageModel> GetMessagesByMRNandId(string mrn, string id)
        {
            return await _repo.GetByMRNandId(mrn, long.Parse(id));
        }

        [HttpGet]
        [Route("id/{id}")]
        public async Task<MessageModel> GetMessagesById(long id)
        {
            return await _repo.Get(id);
        }
    }
}