using Microsoft.Extensions.Caching.Distributed;
using Shared.Extensions;
using System;
using System.Threading.Tasks;
using StackExchange.Redis;
using Microsoft.Extensions.Configuration;
using Shared.Encryption;

namespace HL7server.Services
{
    public class CacheService
    {
        private readonly IDistributedCache _cache;
        private readonly IConfiguration _cfg;
        private readonly Encryptor _encryptor;
        private readonly string _messagePrefix = "MSG_";

        public string ConnectionString
        {
            get { return GetConnectionString(); }
        }

        public CacheService(IDistributedCache cache, IConfiguration cfg, Encryptor encryptor)
        {
            _cache = cache;
            _cfg = cfg;
            encryptor.SetEncryptionKey(_cfg.GetValue<string>("encryption:key"));
            _encryptor = encryptor;
        }

        public async Task AddMessageToCacheAsync(string message, int? expiryMinutes)
        {
            var recordId = $"{_messagePrefix}{DateTime.Now:yyyyMMdd_HHmmss_ffff}";
            
            var encryptedMessage = _encryptor.Encrypt(message);

            // Write encrtypted message to the cache
            await _cache.SetRecordAsync<string>(recordId, encryptedMessage, expiryMinutes is null ? null : TimeSpan.FromMinutes((double)expiryMinutes));
        }

        public bool CacheServerIsAvailable()
        {
            try {
                using (var redis = ConnectionMultiplexer.Connect($"{this.ConnectionString}"))
                {
                    return redis.IsConnected;
                }
            } catch {
                return false;
            }
        }

        private string GetConnectionString()
        {
            var redisHost = _cfg.GetValue<string>("redis:host");
            var redisPort = _cfg.GetValue<string>("redis:port");
            var redisPassword = _cfg.GetValue<string>("redis:password");
            return $"{redisHost}:{redisPort},password={redisPassword}";
        }
    }
}
