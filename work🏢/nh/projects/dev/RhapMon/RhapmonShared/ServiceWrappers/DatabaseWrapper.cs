using System.Threading.Tasks;
using Redis.Net;
using StackExchange.Redis;

namespace RhapmonShared.ServiceWrappers
{
    /// <summary>
    /// This is a simple wrapper around the Redis database to facilitate mocking during unit testing.
    /// </summary>
    public class DatabaseWrapper : IDatabaseWrapper
    {
        public async Task<RedisKey[]> GetKeysAsync(IDatabase redisDb, string keyPrefix)
        {
            return await redisDb.GetKeysAsync(keyPrefix);
        }

        public async Task<RedisValue> HashGetAsync(IDatabase redisDb, RedisKey redisKey, string hashKey)
        {
            return await redisDb.HashGetAsync(redisKey, hashKey);
        }
    }
}