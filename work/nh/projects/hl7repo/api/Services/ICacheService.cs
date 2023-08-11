using System.Collections.Generic;
using System.Threading.Tasks;
using Shared.Models;

namespace api.Services
{
    public interface ICacheService
    {
        string ConnectionString { get; }
        bool CacheServerIsAvailable();
        Task<IEnumerable<MessageModel>> GetMessages(int count);
    }
}