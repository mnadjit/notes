using System;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Serilog;
using RhapmonShared.Models;
using worker.Services;

namespace worker
{
    public class WorkerTaskRunner : IWorkerTaskRunner
    {
        private readonly IConfiguration _cfg;
        private readonly ICacheService _cacheService;
        private readonly INotificationManager _notificationManager;

        public WorkerTaskRunner(IConfiguration cfg, ICacheService cacheService, INotificationManager notificationManager)
        {
            _cfg = cfg;
            _cacheService = cacheService;
            _cacheService.Init(cfg);
            _notificationManager = notificationManager;
        }

        public async Task RunAll(HttpClient httpClient)
        {
            if (_cfg.GetValue<bool>("Monitors:Throughput"))
                await GetCommpointsData_WriteToCache(httpClient);

            if (_cfg.GetValue<bool>("Monitors:Alerts"))
                await GetAlerts_WriteToCache(httpClient);
            
            await _notificationManager.Run();
        }

        private async Task GetCommpointsData_WriteToCache(HttpClient httpClient)
        {
            var components = _cfg.GetSection("ThroughputMonitor").Get<RhapComponentModel[]>();

            foreach (var comp in components.Where(c => c.Type.ToUpper() == "CP"))
            {
                var commpointApiPath = _cfg.GetValue<string>("Rhapsody:CommpointApiPath");

                var rhapData = await HttpService.GetCommpointFromRapsodyApi(httpClient, comp, commpointApiPath);

                if (rhapData is null)
                {
                    Log.Error("Failed to retrieve data for the following commpoint"
                                + ((string.IsNullOrEmpty(comp.FolderPath) || string.IsNullOrEmpty(comp.Name)) ? "" : 
                                    $"[{comp.FolderPath}/{comp.Name}]")
                                + $"id: [{comp.Id}]");
                    continue;
                }

                await _cacheService.AppendCommpointDataToCache(rhapData, _cfg, comp);
            }
        }

        private async Task GetAlerts_WriteToCache(HttpClient httpClient)
        {
            var alertsApiPath = _cfg.GetValue<string>("Rhapsody:AlertsApiPath");

            var alerts = await HttpService.GetAlertsFromRapsodyApi(httpClient, alertsApiPath);

            await _cacheService.WriteAlertsToCache(alerts);
        }
    }
}