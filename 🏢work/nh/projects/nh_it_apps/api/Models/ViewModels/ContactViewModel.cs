using System.ComponentModel.DataAnnotations.Schema;

namespace api.Models.ViewModels
{
    public class ContactViewModel : BaseEntityViewModel
    {
        public int NhAppId { get; set; }
        
        [Column(TypeName="nvarchar(250)")]
        public string FullName { get; set; }

        [Column(TypeName="varchar(20)")]
        public string Type { get; set; }
        [Column(TypeName="nvarchar(250)")]
        public string Email { get; set; }
        
        [Column(TypeName="varchar(250)")]
        public string Phone { get; set; }

        [Column(TypeName="nvarchar(500)")]
        public string Url { get; set; }
        
        [Column(TypeName="nvarchar(500)")]
        public string Address { get; set; }
    }
}
