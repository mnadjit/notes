using System;

namespace RhapmonShared.Models
{
    public class RhapsodyCommpointDataModel
    {
        public int id { get; set; } = 0;
        public string Name { get; set; } = string.Empty;
        public string folderPath { get; set; } = string.Empty;
        public string mode { get; set; } = string.Empty;
        public string state { get; set; } = string.Empty;
        public string commPointType { get; set; } = string.Empty;
        public int inQueueSize { get; set; } = 0;
        public string inputIdleTime { get; set; } = string.Empty;
        public int outQueueSize { get; set; } = 0;
        public string outputIdleTime { get; set; } = string.Empty;
        public string uptime { get; set; } = string.Empty;
        public int connectionCount { get; set; } = 0;
        public int receivedCount { get; set; } = 0;
        public int sentCount { get; set; } = 0;
        public DateTime Date { get; set; } = DateTime.Now;
    }
}