using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace api.Models.Entities
{
    public class AppService : BaseEntity
    {
        [Required]
        public int NhAppId { get; set; }
        
        [Column(TypeName="varchar(50)")]
        public string Name { get; set; }
        
        [Column(TypeName="varchar(20)")]
        public string Type { get; set; }
        
        public IEnumerable<Server> Servers { get; set; }
    }
}