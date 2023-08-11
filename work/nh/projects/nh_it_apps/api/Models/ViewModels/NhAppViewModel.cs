using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace api.Models.ViewModels
{
    public class NhAppViewModel : BaseEntityViewModel
    {
        [MaxLength(250)]
        public string Name { get; set; }

        [MaxLength(20)]
        public string Environment { get; set; }

        public string Description { get; set; }

        [MaxLength(50)]
        public string MainDepartment { get; set; }

        [MaxLength(250)]
        public string Vendor { get; set; }
        
        public IEnumerable<ContactViewModel> Contacts { get; set; }
        public IEnumerable<AppServiceViewModel> AppServices { get; set; }
    }
}