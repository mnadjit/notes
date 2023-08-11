using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;

using System;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

using Serilog;

namespace worker
{
    public class Worker : BackgroundService
    {
        private readonly IConfiguration _configuration;
        private readonly IDistributedCache _cache;
        private readonly HttpClient _httpClient;
        private readonly IWorkerTaskRunner _workTaskRunner;

        public Worker   (  IConfiguration configuration,
                            IDistributedCache cache,
                            IHttpClientFactory httpClientFactory,
                            IWorkerTaskRunner workTaskRunner
                        )
        {
            _configuration = configuration;
            _cache = cache;
            _httpClient = httpClientFactory.CreateClient("UseCredentials");
            _httpClient.BaseAddress = GetBaseAddress();
            _workTaskRunner = workTaskRunner;
        }

        private Uri GetBaseAddress()
        {
            var server = _configuration.GetValue<string>("Rhapsody:Server");
            var port = _configuration.GetValue<string>("Rhapsody:Port");
                        
            return new Uri($"{server}:{port}");
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                Log.Information("Worker running at: {time}", DateTime.Now);

                var interval = _configuration.GetValue<int>("RunningIntervalSec") * 1000;
       
                await _workTaskRunner.RunAll(_httpClient);

                await Task.Delay(interval, stoppingToken);
            }
        }
    }
}