using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace api.Models.Entities
{
    public class IP : BaseEntity
    {
        public int NetworkInterfaceId { get; set; }

        [Column(TypeName="varchar(250)")]
        public string IPAddress { get; set; }

        [Column(TypeName="varchar(20)")]
        public string Subnet { get; set; }
        
        [Column(TypeName="varchar(250)")]
        public string Gateway { get; set; }
        
        public bool Dhcp { get; set; }
        public bool DhcpReserved { get; set; }
        public int Port { get; set; }

    }
}
