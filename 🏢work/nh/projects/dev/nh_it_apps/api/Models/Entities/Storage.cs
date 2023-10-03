using System.ComponentModel.DataAnnotations.Schema;

namespace api.Models.Entities
{
    public class Storage : BaseEntity
    {
        public int ServerId { get; set; }

        [Column(TypeName="varchar(20)")]
        public string Type { get; set; }

        [Column(TypeName="varchar(250)")]
        public string Path { get; set; }
        public int TotalCapacityGB { get; set; }
    }
}
