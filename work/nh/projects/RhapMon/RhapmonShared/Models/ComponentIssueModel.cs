using System.Collections.Generic;

namespace RhapmonShared.Models
{
    public class ComponentIssueModel
    {
        public string ComponentId { get; set; }
        public string ComponentName { get; set; }
        public string ComponentFriendlyName { get; set; }
        public string ComponentFolderPath { get; set; }
        public string ComponentType { get; set; }
        public string IssueType { get; set; }
        public string IssueTypeRedisPrefix { get; set; }
        public int Threshold { get; set; }
        public string TimeFrame { get; set; }
        public string ExcludedDates { get; set; }
        public string RecipientEmails { get; set; }
        public bool NotificationSent { get; set; }
        public List<int> DetectedRates { get; set; }
        public System.DateTime DetectionDateTime { get; set; }
    }
}