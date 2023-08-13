using System.ComponentModel.DataAnnotations;

namespace api.Models.ViewModels
{
    public class StorageViewModel : BaseEntityViewModel
    {
        public int ServerId { get; set; }

        [MaxLength(20)]
        public string Type { get; set; }

        [MaxLength(250)]
        public string Path { get; set; }

        public int TotalCapacityGB { get; set; }
    }
}
