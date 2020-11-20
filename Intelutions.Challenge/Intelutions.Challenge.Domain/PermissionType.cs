using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Intelutions.Challenge.Domain
{
    [Table("PermissionType")]
    public class PermissionType : BaseEntity
    {
        public int Id { get; set; }
        public string Description { get; set; }
    }
}
