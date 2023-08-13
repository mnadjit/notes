using System;

namespace RhapmonShared.Models
{
    public class RhapsodyRouteModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string FolderPath { get; set; }
        public string State { get; set; }
        public string IdleTime { get; set; }
        public int ProcessedCount { get; set; }
        public int ProcessingQueueSize { get; set; }
        public int WaitingQueueSize { get; set; }
        public string Uuid { get; set; }
        public DateTime Date { get; set; }
    }
}