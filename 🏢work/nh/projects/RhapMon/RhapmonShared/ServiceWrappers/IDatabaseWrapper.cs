using System.Threading.Tasks;
using StackExchange.Redis;

namespace RhapmonShared.ServiceWrappers
{
    public interface IDatabaseWrapper
    {
        Task<RedisKey[]> GetKeysAsync(IDatabase redisDb, string keyPrefix);
        Task<RedisValue> HashGetAsync(IDatabase redisDb, RedisKey redisKey, string hashKey);
    }
}