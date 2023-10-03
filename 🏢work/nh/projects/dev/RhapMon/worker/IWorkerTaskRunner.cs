using System.Net.Http;
using System.Threading.Tasks;

namespace worker
{
    public interface IWorkerTaskRunner
    {
        Task RunAll(HttpClient _httpClient);
    }
}