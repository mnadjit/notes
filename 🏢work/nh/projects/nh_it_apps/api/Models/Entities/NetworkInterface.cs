using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace api.Models.Entities
{
    public class NetworkInterface : BaseEntity
    {
        public int ServerId { get; set; }

        [Column(TypeName="varchar(20)")]
        public string Type { get; set; }

        [Column(TypeName="varchar(20)")]
        public string MacAddress { get; set; }
        
        public IEnumerable<IP> IPs { get; set; }
    }
}
