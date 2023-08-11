using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace api.Models.Entities
{
    public class NhApp : BaseEntity
    {
        [Column(TypeName="nvarchar(250)")]
        public string Name { get; set; }

        [Column(TypeName="varchar(20)")]
        public string Environment { get; set; }

        public string Description { get; set; }

        [Column(TypeName="nvarchar(50)")]
        public string MainDepartment { get; set; }

        [Column(TypeName="nvarchar(250)")]
        public string Vendor { get; set; }
        
        public IEnumerable<Contact> Contacts { get; set; }
        public IEnumerable<AppService> AppServices { get; set; }
    }
}