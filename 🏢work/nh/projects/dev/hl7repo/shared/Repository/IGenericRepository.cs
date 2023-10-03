using System.Collections.Generic;
using System.Threading.Tasks;

namespace Shared.Repository
{
    public interface IGenericRepository<T> where T : class
    {
        Task<T> Get (long id);
        Task<IEnumerable<T>> GetAll();
        Task<IEnumerable<T>> GetByDateRange(System.DateTime From, System.DateTime To, int maxCount = 1000);
        
        Task<IEnumerable<T>> GetMostRecent(int count);
        Task<IEnumerable<T>> GetByMRN(string mrn, int maxCount = 1000);
        
        Task<bool> Add (T entity);
        Task<int> AddBatch (IEnumerable<T> entities);
        Task<bool> Delete (int id);
        Task<bool> Update (T entity);
    }
}