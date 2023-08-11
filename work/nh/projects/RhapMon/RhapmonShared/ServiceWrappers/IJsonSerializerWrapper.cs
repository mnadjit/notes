namespace RhapmonShared.ServiceWrappers
{
    public interface IJsonSerializerWrapper
    {
        T Deserialize<T>(string jsonString);
    }
}