using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace api.Models.Entities
{
    public class Server : BaseEntity
    {
        public int AppServiceId { get; set; }

        [Column(TypeName="varchar(250)")]
        public string Hostname { get; set; }

        [Column(TypeName="varchar(250)")]
        public string OS { get; set; }

        [Column(TypeName="varchar(250)")]
        public string OSVersion { get; set; }

        [Column(TypeName="varchar(20)")]
        public string Type { get; set; }

        public int HostId { get; set; }

        [Column(TypeName="nvarchar(250)")]
        public string Location { get; set; }

        [Column(TypeName="nvarchar(250)")]
        public string Processor { get; set; }

        [Column(TypeName="nvarchar(250)")]
        public string Memory { get; set; }
        public IEnumerable<Storage> Storages { get; set; }
        public IEnumerable<NetworkInterface> NetworkInterfaces { get; set; }
    }
}
