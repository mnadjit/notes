using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace api.Models.ViewModels
{
    public class BaseEntityViewModel
    {
        public int Id { get; set; }
        public string Comments { get; set; }
        
        [Column(TypeName="varchar(50)")]
        public string LastUpdatedBy { get; set; }
        public DateTime LastUpdated { get; set; }
    }
}
