using System.ComponentModel.DataAnnotations;

namespace api.Models.ViewModels
{
    public class IPViewModel : BaseEntityViewModel
    {
        public int NetworkInterfaceId { get; set; }

        [MaxLength(250)]
        public string IPAddress { get; set; }

        [MaxLength(20)]
        public string Subnet { get; set; }
        
        [MaxLength(250)]
        public string Gateway { get; set; }
        
        public bool DHCP { get; set; }
        public bool DHCPReserved { get; set; }
        public int Port { get; set; }
    }
}
