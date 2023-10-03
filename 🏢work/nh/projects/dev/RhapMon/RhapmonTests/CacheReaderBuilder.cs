using System.Collections.Generic;
using System.Threading.Tasks;

using Microsoft.Extensions.Configuration;

using api.Services;

using Autofac.Extras.Moq;

using Moq;

using RhapmonShared.Models;
using RhapmonShared.ServiceWrappers;
using StackExchange.Redis;

namespace tests
{
    internal class CacheReaderBuilder
    {
        public AutoMock Mock;

        public CacheReaderBuilder()
        {
            Mock = AutoMock.GetLoose();
        }

        public ICacheReader Build()
        {
            var cacheReaderMock = Mock.Create<CacheReader>();

            return cacheReaderMock;
        }

        public CacheReaderBuilder WithConfiguration()
        {
            var configMock = Mock.Mock<IConfiguration>();

            var configSectionStringMock = Mock.Mock<IConfigurationSection>();
            configSectionStringMock.Setup(x => x.Value).Returns("dummy");

            var configSectionIntMock = Mock.Mock<IConfigurationSection>();
            configSectionIntMock.Setup(x => x.Value).Returns("10");

            configMock.Setup(x => x.GetSection(It.IsAny<string>())).Returns(configSectionStringMock.Object);

            configMock.Setup(x => x.GetSection("Redis:MaxKeysToRead")).Returns(configSectionIntMock.Object);

            return this;
        }

        public CacheReaderBuilder WithRedisConnection(int keyCount)
        {
            var redisKeys = new RedisKey[keyCount];
            for (var i = 0; i < keyCount; i++) redisKeys[i] = new RedisKey("dummyKey" + i);

            Mock.Mock<IDatabaseWrapper>()
                .Setup(x => x.GetKeysAsync(It.IsAny<IDatabase>(), It.IsAny<string>()))
                .Returns(Task.FromResult<RedisKey[]>(redisKeys));

            var redisValue = new RedisValue("dummyValue");
            Mock.Mock<IDatabaseWrapper>()
                .Setup(x => x.HashGetAsync(It.IsAny<IDatabase>(), It.IsAny<RedisKey>(), "data"))
                .Returns(Task.FromResult<RedisValue>(redisValue));

            Mock.Mock<IConnectionMultiplexer>()
                .Setup(x => x.IsConnected)
                .Returns(true);

            var mockDb = Mock.Mock<IDatabase>();
            Mock.Mock<IConnectionMultiplexer>()
                .Setup(x => x.GetDatabase(It.IsAny<int>(), It.IsAny<object>()))
                .Returns(mockDb.Object);
            
            return this;
        }

        public CacheReaderBuilder WithRedisConnection()
        {
            return WithRedisConnection(1);
        }

        public CacheReaderBuilder WithoutRedisConnection()
        {
            return this;
        }

        public CacheReaderBuilder WithCPdataJsonSerializer(int id, string name)
        {
            Mock.Mock<IJsonSerializerWrapper>()
                .Setup(x => x.Deserialize<RhapsodyCommpointDataModel>(It.IsAny<string>()))
                .Returns(new RhapsodyCommpointDataModel(){ id = id, Name = name });
            
            return this;
        }

        public CacheReaderBuilder WithAlertJsonSerializer(int alertCount, int id, string name)
        {
            var alert = new RhapsodyAlertModel() { AlertCount = alertCount, Alerts = new List<RhapsodyAlertModel.Alert>() };
            for (int i = 0; i < alertCount; i++)
                alert.Alerts.Add(new RhapsodyAlertModel.Alert() { Id = id, AlertName = name });

            Mock.Mock<IJsonSerializerWrapper>()
                .Setup(x => x.Deserialize<RhapsodyAlertModel>(It.IsAny<string>()))
                .Returns(alert);
            
            return this;
        }
    }
}