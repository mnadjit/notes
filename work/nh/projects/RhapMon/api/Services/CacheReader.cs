using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;

using Microsoft.Extensions.Configuration;

using RhapmonShared.Models;
using RhapmonShared.ServiceWrappers;
using StackExchange.Redis;

namespace api.Services
{
    public class CacheReader : ICacheReader
    {
        private readonly IConfiguration _cfg;
        private readonly string _redisInstanceName;
        private readonly string _cpDataPrefix;
        private readonly string _alertsPrefix;
        private readonly string _redisConnectionString;
        private readonly int _maxKeysToRead;
        private readonly IDatabaseWrapper _redisDbWrapper;
        private readonly IJsonSerializerWrapper _jsonSerializer;
        private readonly IConnectionMultiplexer _multiplexer;
        
        public CacheReader(IConnectionMultiplexer multiplexer, IConfiguration cfg, IDatabaseWrapper dbWrapper, 
                            IJsonSerializerWrapper jsonSerializerWrapper)
        {
            _cfg = cfg;
            _multiplexer = multiplexer;
            _redisInstanceName = _cfg.GetValue<string>("Redis:InstanceName", "");
            if (string.IsNullOrEmpty(_redisInstanceName)) 
                throw new ArgumentNullException("Failed to retrieve Redis Instance Name from app configuration.");
            _cpDataPrefix = _cfg.GetValue<string>("Redis:cpDataPrefix", "");
            if (string.IsNullOrEmpty(_cpDataPrefix)) 
                throw new ArgumentNullException("Failed to retrieve cpDataPrefix from app configuration.");
            _alertsPrefix = _cfg.GetValue<string>("Redis:alertsPrefix", "");
            if (string.IsNullOrEmpty(_alertsPrefix)) 
                throw new ArgumentNullException("Failed to retrieve alertsPrefix from app configuration.");
            _redisConnectionString = cfg.GetValue<string>("Redis:ConnectionString", "");
            if (string.IsNullOrEmpty(_redisConnectionString)) 
                throw new ArgumentNullException("Failed to retrieve Redis Connection String from app configuration.");
            _maxKeysToRead = cfg.GetValue<int>("Redis:MaxKeysToRead", 500);
            _redisDbWrapper = dbWrapper;
            _jsonSerializer = jsonSerializerWrapper;
        }
        public async Task<IEnumerable<RhapsodyCommpointDataModel>> GetCommpointDataAsync(string commpointId)
        {
            if (commpointId is null | commpointId == string.Empty) throw new Exception("Failed to get Rhapsody commpoint data from cache as Redis key is null or empty.");

            var cacheDb = EnsureRedisConnected();
            var keyString = $"{_redisInstanceName}{_cpDataPrefix}{commpointId}";

            var allKeys = await (_redisDbWrapper.GetKeysAsync(cacheDb, keyString));
            if (allKeys == null) return null;

            var keys = allKeys.Take(_maxKeysToRead).ToList();

            var data = new List<RhapsodyCommpointDataModel>();
            foreach (var key in keys) {
                var value = await _redisDbWrapper.HashGetAsync(cacheDb, key, "data");
                try
                {
                    var valueObj = Deserialize<RhapsodyCommpointDataModel>(value.ToString());
                    data.Add(valueObj);
                }
                catch (System.Exception ex)
                {
                    throw new JsonException($"Failed to deserialize value for key [{key.ToString()}]", ex);
                }
            }
            return data;
        }

        public async Task<RhapsodyAlertModel> GetAlerts()
        {
            var cacheDb = EnsureRedisConnected();
            var keyString = $"{_redisInstanceName}{_alertsPrefix}";
            
            // Use Redis Database Wrapper to enable mocking during unit testing.
            var keys = await (_redisDbWrapper.GetKeysAsync(cacheDb, keyString));

            if (!keys.Any()) throw new Exception("Failed to get Rhapsody alerts from cache as Redis key is null or empty.");
            if (keys.Length > 1) throw new Exception($"Only one key should exist in Redis for Rhapsody alerts but {keys.Length} keys where retrieved.");
            var key = keys.First();
            
            RedisValue value;
            try
            {
                value = await _redisDbWrapper.HashGetAsync(cacheDb, key, "data");
            }
            catch (System.Exception ex)
            {
                throw new RedisException($"Failed to retrieve value for key [{key.ToString()}]", ex); 
            }
            if (string.IsNullOrEmpty(value.ToString())) throw new Exception($"No data was retrieved for key [{key.ToString()}]");
            
            var alert = Deserialize<RhapsodyAlertModel>(value);
            return alert;
        }

        private T Deserialize<T>(string jsonString){
            T result;
            try
            {
                result = _jsonSerializer.Deserialize<T>(jsonString);
            }
            catch (System.Exception ex)
            {
                throw new JsonException($"Failed to desrialize object of type [{typeof(T)}]", ex);
            }
            return result;
        }

        // call the cache and connect to redis if not already connected
        private IDatabase EnsureRedisConnected() {
            try {
                if (!_multiplexer.IsConnected) throw new RedisException($"Failed to connect to Redis instance via connection string [{_redisConnectionString}]");
                return _multiplexer.GetDatabase();
            } catch { 
                _multiplexer.Dispose();
                throw new RedisException($"Failed to connect to Redis instance via connection string [{_redisConnectionString}]");
            }
        }
    }
}
