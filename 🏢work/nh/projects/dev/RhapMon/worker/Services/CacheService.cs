using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using RhapmonShared.Models;
using RhapmonShared.ServiceWrappers;
using Shared.Extensions;
using StackExchange.Redis;

namespace worker.Services
{
    public class CacheService : ICacheService
    {
        private string _commpointDataPrefix;
        private string _commpointIssuePrefix;
        private string _alertsPrefix;
        private readonly IDistributedCache _cache;
        private readonly IConnectionMultiplexer _multiplexer;
        private int _expiryLength;
        private string _redisInstanceName;
        private string _redisConnectionString;
        private readonly IDatabaseWrapper _redisDbWrapper;
        private readonly IJsonSerializerWrapper _jsonSerializer;

        public CacheService(IDistributedCache cache, IConnectionMultiplexer multiplexer, IDatabaseWrapper dbWrapper,
                            IJsonSerializerWrapper jsonSerializerWrapper)
        {
            _cache = cache;
            _multiplexer = multiplexer;
            _redisDbWrapper = dbWrapper;
            _jsonSerializer = jsonSerializerWrapper;
        }

        public void Init(IConfiguration cfg)
        {
            _redisConnectionString = cfg.GetValue<string>("Redis:ConnectionString", "");
            _redisInstanceName = cfg.GetValue<string>("Redis:InstanceName", "");
            _commpointDataPrefix = cfg.GetValue<string>("Redis:cpDataPrefix", "");
            _commpointIssuePrefix = cfg.GetValue<string>("Redis:cpIssuePrefix", "");
            _alertsPrefix = cfg.GetValue<string>("Redis:alertsKeyName", "");
            _expiryLength = cfg.GetValue<int>("Redis:ExpiryDurationMins");
        }

        public async Task AppendCommpointDataToCache (RhapsodyCommpointDataModel rhapData, IConfiguration cfg, RhapComponentModel componentModel)
        {
            await _cache.SetRecordAsync<RhapsodyCommpointDataModel>(
                $"{_commpointDataPrefix}{rhapData.id.ToString()}_{DateTime.Now:yyyyMMddHHmmss}", 
                                                                    rhapData, 
                                                                    TimeSpan.FromMinutes(_expiryLength
                                                                ));
        }

        public async Task WriteAlertsToCache (RhapsodyAlertModel alertsModel)
        {
            await _cache.SetRecordAsync<RhapsodyAlertModel>(_alertsPrefix, alertsModel, TimeSpan.FromMinutes(_expiryLength));
        }

        public async Task<IEnumerable<RhapsodyCommpointDataModel>> GetRecentCommpointData(string commpointId, int count)
        {
            var keyString = $"{_redisInstanceName}{_commpointDataPrefix}{commpointId}";

            var cacheDb = EnsureRedisConnected();
            var allKeys = await (_redisDbWrapper.GetKeysAsync(cacheDb, keyString));
            if (allKeys == null) return null;

            var keys = allKeys.OrderByDescending(x => x.ToString()).Take(count).ToList();
            
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

        public async Task AddOrUpdateIssueInCache(ComponentIssueModel componentIssue)
        {
            await _cache.SetRecordAsync(
                $"{_commpointIssuePrefix}{componentIssue.IssueTypeRedisPrefix}{componentIssue.ComponentId}", componentIssue);
        }

        public Task<ComponentIssueModel> GetIssueFromCache(ComponentIssueModel componentIssue)
        {
            return _cache.GetRecordAsync<ComponentIssueModel>(
                $"{_commpointIssuePrefix}{componentIssue.IssueTypeRedisPrefix}{componentIssue.ComponentId}");
        }

        public async Task RemoveIssueFromCache(ComponentIssueModel componentIssue)
        {
            await _cache.SetRecordAsync(
                $"{_commpointIssuePrefix}{componentIssue.IssueTypeRedisPrefix}{componentIssue.ComponentId}", 
                new {}, 
                TimeSpan.FromMilliseconds(1), TimeSpan.FromMilliseconds(1));
        }

        public async Task MarkIssueAsNotifiedInCache(ComponentIssueModel subscription)
        {
            var issue = await GetIssueFromCache(subscription);
            issue.NotificationSent = true;
            await AddOrUpdateIssueInCache(issue);
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
    }
}
