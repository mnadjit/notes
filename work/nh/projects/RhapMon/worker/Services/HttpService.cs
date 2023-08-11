using System;
using System.Net.Http;
using System.Threading.Tasks;
using Shared.Extensions;
using RhapmonShared.Models;
using Serilog;

namespace worker.Services
{
    public static class HttpService
    {
        internal static async Task<RhapsodyCommpointDataModel> GetCommpointFromRapsodyApi(HttpClient httpClient, RhapComponentModel componentModel, string commpointApiPath)
        {
            try
            {
                var rhapCpData = await httpClient.GetRhapCommpointData(commpointApiPath, componentModel.Id);

                return rhapCpData;    
            }
            catch (HttpRequestException ex)
            {
                Log.Error($"Http Request Error Message: {ex.Message}");
                Log.Error($"Status Code: {ex.StatusCode}");
                Log.Error($"Exception Data: {ex.Data}");
                Log.Error($"Exception Source: {ex.Source}");
                Log.Error($"Inner Exception: {ex.InnerException}");
                
                Environment.Exit(400);
                return null;
            }
        }

        internal static async Task<RhapsodyAlertModel> GetAlertsFromRapsodyApi(HttpClient httpClient, string alertsApiPath)
        {
            try
            {
                var alerts = await httpClient.GetAlerts(alertsApiPath);

                return alerts;    
            }
            catch (HttpRequestException ex)
            {
                Log.Error($"Failed to access http server using URL: {httpClient.BaseAddress}{alertsApiPath}");
                Log.Error($"Http Request Error Message: {ex.Message}");
                return null;
            }
        }
    }
}

