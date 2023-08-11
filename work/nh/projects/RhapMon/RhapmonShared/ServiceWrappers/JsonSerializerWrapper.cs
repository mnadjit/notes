using System.Text.Json;

namespace RhapmonShared.ServiceWrappers
{
    /// <summary>
    /// This is a wrapper class for the JsonSerializer class to fascilitate mocking during unit testing for the static method JsonSerializer.Deserialize
    /// </summary>
    public class JsonSerializerWrapper : IJsonSerializerWrapper
    {
        public T Deserialize<T>(string jsonString) 
        {
            return JsonSerializer.Deserialize<T>(jsonString);
        }
    }
}