using System.Collections.Generic;

namespace RhapmonShared.Models
{
    public class RhapsodyComponentStatusModel
    {

        public int Id { get; set; }
        public string Name { get; set; }
        public IEnumerable<ChildFolder> ChildFolders { get; set; }
        public IEnumerable<ChildComponent> ChildComponents { get; set; }

        public class ChildComponent
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public string State { get; set; }
            public string Type { get; set; }
            public int InboundQueueSize { get; set; }
            public int OutboundQueueSize { get; set; }
        }

        public class ChildFolder
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public IEnumerable<ChildFolder> ChildFolders { get; set; }
            public IEnumerable<ChildComponent> ChildComponents { get; set; }
        }
    }
}