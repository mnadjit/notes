using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace api.Models.ViewModels
{
    public class AppServiceViewModel : BaseEntityViewModel
    {
        [Required]
        public int NhAppId { get; set; }
        
        [MaxLength(50)]
        public string Name { get; set; }
        
        [MaxLength(20)]
        public string Type { get; set; }
        
        public IEnumerable<ServerViewModel> Servers { get; set; }
    }
}