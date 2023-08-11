using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace api.Models.ViewModels
{
    public class ServerViewModel : BaseEntityViewModel
    {
        public int AppServiceId { get; set; }

        [MaxLength(250)]
        public string Hostname { get; set; }

        [MaxLength(250)]
        public string OS { get; set; }

        [MaxLength(250)]
        public string OSVersion { get; set; }

        [MaxLength(20)]
        public string Type { get; set; }

        public int HostId { get; set; }

        [MaxLength(250)]
        public string Location { get; set; }

        [MaxLength(250)]
        public string Processor { get; set; }

        [MaxLength(250)]
        public string Memory { get; set; }
        public IEnumerable<StorageViewModel> Storages { get; set; }
        public IEnumerable<NetworkInterfaceViewModel> NetworkInterfaces { get; set; }
    }
}
