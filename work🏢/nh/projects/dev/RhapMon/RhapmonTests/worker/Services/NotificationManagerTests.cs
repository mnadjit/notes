using Microsoft.Extensions.Configuration;
using Xunit;

namespace tests.worker.Services
{
    public class NotificationManagerTests
    {
        private readonly IConfiguration _cfg;

        public NotificationManagerTests(IConfiguration cfg)
        {
            _cfg = cfg;
            
        }
        [Fact]
        public void GetCommpointIdsFromNotifSubscriptions_ShouldGetOneCPId()
        {
            
            
            Assert.True(false);
        }
    }
}