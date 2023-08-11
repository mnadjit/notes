using System.Collections.Generic;
using System.Threading.Tasks;
using Shared.Encryption;
using Shared.Models;

namespace Shared.Repository
{
    public interface IMessageRepo_Repository : IGenericRepository<MessageModel>
    {
        MessageRepo_Repository SetConnectionString(string connectionString);
        string GetConnectionString();
        void SetEncryptor(Encryptor encryptor);
        Task<MessageModel> GetByMRNandId(string mrn, long id);
        Task<IEnumerable<MessageModel>> GetByMrnDateEventTrigger(string mrn, string from, string to, string[] triggerEvents, int maxCount = 1000);
    }
}