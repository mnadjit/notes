using System.Linq;
using System.Threading.Tasks;
using RhapmonShared.Models;
using StackExchange.Redis;
using Xunit;

namespace tests.api
{
    public class CacheReaderTests
    {
        [Theory]
        [InlineData(0, 1, "dummyCPName")]
        [InlineData(1, 1, "dummyCPName")]
        [InlineData(5, 10, "dummyCPName")]        
        public async Task GetCommpointDataAsync_ShouldReturnDataFromRedis(int numberOfkeys, int dummyCPid, string dummyCpName)
        {
            // Arrange
            var sut = new CacheReaderBuilder()
                                .WithConfiguration()
                                .WithRedisConnection(numberOfkeys)
                                .WithCPdataJsonSerializer(dummyCPid, dummyCpName)
                                .Build();

            // Act
            var commpointsData = await sut.GetCommpointDataAsync("dummyCommPointId");
        
            // Assert
            var expectedNumberofRetrievedObjects = numberOfkeys;
            var rhapsodyCommpointModels = commpointsData as RhapsodyCommpointDataModel[] ?? commpointsData.ToArray();
            Assert.Equal(expectedNumberofRetrievedObjects, rhapsodyCommpointModels.Length);

            if (rhapsodyCommpointModels.Length == numberOfkeys)
                Assert.True(rhapsodyCommpointModels.All(x => x.Name == dummyCpName && x.id == dummyCPid));
        }
        
        [Theory]
        [InlineData(0, 1, "dummyCPName")]
        [InlineData(1, 1, "dummyCPName")]
        [InlineData(5, 10, "dummyCPName")]        
        public async Task GetAlerts_ShouldGetAlertsFromRedis(int alertCount, int dummyAlertId, string dummyAlertName)
        {
            // Arrange
            var sut = new CacheReaderBuilder()
                                .WithConfiguration()
                                .WithRedisConnection()
                                .WithAlertJsonSerializer(alertCount, dummyAlertId, dummyAlertName)
                                .Build();

            // Act
            var alert = await sut.GetAlerts();
        
            // Assert
            var expectedNumberofRetrievedObjects = alertCount;
            Assert.Equal(expectedNumberofRetrievedObjects, alert.AlertCount);

            Assert.Equal(expectedNumberofRetrievedObjects, alert.Alerts.Count);

            if (alert.AlertCount == alertCount)
                Assert.True(alert.Alerts.All(x => x.AlertName == dummyAlertName && x.Id == dummyAlertId));
        }

        [Fact]
        public async Task GetAlerts_ShouldThrowExceptionAsNoRedisConnection()
        {
            // Arrange
            var sut = new CacheReaderBuilder()
                                .WithConfiguration()
                                .WithoutRedisConnection()
                                .WithAlertJsonSerializer(0, 0, "")
                                .Build();

            // Act
            Task Func() => sut.GetAlerts();

            // Assert
            var caughtException = await Assert.ThrowsAnyAsync<RedisException>(Func);
            Assert.StartsWith("Failed to connect to Redis instance via connection string", caughtException.Message);
        }
    }
}