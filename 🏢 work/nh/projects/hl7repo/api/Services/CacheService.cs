using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Redis.Net;
using Serilog;
using Shared.Encryption;
using Shared.Models;
using StackExchange.Redis;

namespace api.Services
{
    public class CacheService : ICacheService
    {
        private readonly ConnectionMultiplexer _redis;
        //private readonly int _maxKeysToReadFromCache;
        private readonly string _messageDirection;
        private readonly string _instanceName;
        private readonly IConfiguration _cfg;
        private readonly Encryptor _encryptor;
        public string ConnectionString
        {
            get { return GetConnectionString(); }
        }
        public CacheService(IConfiguration cfg, Encryptor encryptor)
        {
            var redisHost = cfg.GetValue<string>("redis:host");
            var redisPort = cfg.GetValue<string>("redis:port");
            var redisPassword = cfg.GetValue<string>("redis:password");

            _instanceName = cfg.GetValue<string>("redis:instanceName");
            //_maxKeysToReadFromCache = cfg.GetValue<int>("worker:maxKeysToReadFromCache");
            _redis = ConnectionMultiplexer.Connect($"{redisHost}:{redisPort},password={redisPassword}");
            _messageDirection = cfg.GetValue<string>("messageDirection");
            _cfg = cfg;
            encryptor.SetEncryptionKey(cfg.GetValue<string>("encryption:key"));
            _encryptor = encryptor;
        }

        public async Task<IEnumerable<MessageModel>> GetMessages(int count)
        {
            var keys = await GetAllKeysFromCacheAsync(count);
            return await GetMessageBatchFromRedis(keys);
        }

        private async Task<ICollection<string>> GetAllKeysFromCacheAsync(int count)
        {
            var keys = await _redis.GetDatabase().GetKeysAsync(_instanceName);
            return keys
                        .Select(k => k.ToString())
                        .Take(count)
                        .OrderBy(x => x)
                        //.Take(_maxKeysToReadFromCache)
                        .ToArray();
        }

        /// <summary>
        /// Get all messages for a given set of keys from the cache
        /// Decrypt message content to populate the HL7 message model
        /// Overwrite the message content with the encrypted content
        /// </summary>
        /// <param name="batchKeys"></param>
        /// <returns>Messages from cache with encrypted content</returns>
        private async Task<IEnumerable<MessageModel>> GetMessageBatchFromRedis(IEnumerable<string> batchKeys)
        {
            var messages = new List<MessageModel>();

            foreach (var key in batchKeys)
            {
                try
                {
                    var redisValue = await _redis.GetDatabase().HashGetAsync(key, "data");

                    var messageContentJson = redisValue.ToString();

                    var messageContentEncrytpted = JsonSerializer.Deserialize<string>(messageContentJson);
                    var messageContent = _encryptor.Decrypt(messageContentEncrytpted);

                    // Use decrypted message content to populate HL7 message, 
                    var hl7message = new HL7Message(messageContent);

                    var message = new MessageModel(hl7message);
                    message.Direction = _messageDirection;
                    messages.Add(message);
                }
                catch (Exception ex)
                {
                    Log.Error(ex.Message);
                }
            }

            return messages;
        }

        public bool CacheServerIsAvailable()
        {
            try
            {
                using (var redis = ConnectionMultiplexer.Connect($"{this.ConnectionString}"))
                {
                    return redis.IsConnected;
                }
            }
            catch
            {
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