using System.Collections.Generic;

namespace RhapmonShared.Models
{
    public class RhapsodyAlertModel
    {
        public int AlertCount { get; set; }

        public string HighestSeverity { get; set; }

        public List<Alert> Alerts { get; set; }

        public class Alert
        {
            public int Id { get; set; }

            public string AlertName { get; set; }

            public string AlertMnemonic { get; set; }

            public string AlertDescription { get; set; }

            public string Timestamp { get; set; }

            public string State { get; set; }

            public string Severity { get; set; }

            public ComponentInfo ComponentInfo { get; set; }

            public IEnumerable<Parameter> Parameters { get; set; }

            public object Assignee { get; set; }
        }

        public class ComponentInfo
        {
            public int Id { get; set; }

            public string Name { get; set; }

            public string FolderPath { get; set; }
        }

        public class Parameter
        {
            public int Id { get; set; }

            public string DisplayName { get; set; }

            public string Value { get; set; }
        }
    }
}