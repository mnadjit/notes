using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace api.Models.ViewModels
{
    public class NetworkInterfaceViewModel : BaseEntityViewModel
    {
        public int ServerId { get; set; }

        [MaxLength(20)]
        public string Type { get; set; }

        [MaxLength(20)]
        public string MacAddress { get; set; }
        
        public IEnumerable<IPViewModel> IPs { get; set; }
    }
}
