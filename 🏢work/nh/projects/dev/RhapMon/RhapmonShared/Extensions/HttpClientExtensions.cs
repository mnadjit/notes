using System;
using System.IO;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using RhapmonShared.Models;

namespace Shared.Extensions
{
    public static class HttpClientExtensions
    {
        public static async Task<RhapsodyCommpointDataModel> GetRhapCommpointData(this HttpClient httpClient, string apiPath, string cpId)
        {
            if (httpClient is null || string.IsNullOrEmpty(apiPath) || string.IsNullOrEmpty(cpId)) return null;

            var response = await httpClient.GetAsync($"{apiPath}/{cpId}");

            if (!response.IsSuccessStatusCode) throw new HttpRequestException(
                @$"{response.ReasonPhrase}{Environment.NewLine}
                    Uri:{response.RequestMessage?.RequestUri}
                   {Environment.NewLine}Response Content:{Environment.NewLine}{response.Content}"
            );
            
            var data = await response.Content.ReadAsStringAsync();

            var json = JsonConvert.DeserializeObject<dynamic>(data);
            if (json == null) return null;
            var jsonString = JsonConvert.SerializeObject(json.data);
            RhapsodyCommpointDataModel commpointDataData = JsonConvert.DeserializeObject<RhapsodyCommpointDataModel>(jsonString);
            commpointDataData.Date = DateTime.Now;

            return commpointDataData;
        }

        public static async Task<RhapsodyAlertModel> GetAlerts(this HttpClient httpClient, string alertsApiPath)
        {
            if (httpClient is null || string.IsNullOrEmpty(alertsApiPath)) throw new NullReferenceException();

            httpClient.DefaultRequestHeaders.Add("Accept","application/json");
            var response = await httpClient.GetAsync(alertsApiPath);

            if (!response.IsSuccessStatusCode) throw new HttpRequestException(response.ReasonPhrase);     
            
            var data = await response.Content.ReadAsStringAsync();

            dynamic json = JsonConvert.DeserializeObject<dynamic>(data);
            var jsonString = JsonConvert.SerializeObject(json.data);
            RhapsodyAlertModel alertModel = JsonConvert.DeserializeObject<RhapsodyAlertModel>(jsonString);
            return alertModel;
        }

        public static async Task<string> GetRhapComponentsStatus(this HttpClient httpClient, string baseUrl)
        {
            if (httpClient is null || string.IsNullOrEmpty(baseUrl)) return null;

            var data = await File.ReadAllTextAsync(Path.Combine(Directory.GetCurrentDirectory(), "Data/ComponentsStatus.json"));

            return data;
        }
    }
}