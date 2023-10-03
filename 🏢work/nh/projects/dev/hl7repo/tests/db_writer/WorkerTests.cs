using Moq;
using Xunit;

namespace tests.db_writer
{
    
    public class WorkerTests
    {
        [Fact]
        [InlineData("11")]
        public void ExpireRedisRecords_ShouldCallExpireOnAllKeys(string data)
        {
            //Given
            var sut = new Mock<db_Writer.Worker>().Setup(x => x.testing("")).Returns("");
            
            //When
            
            //Then
        }
    }
}