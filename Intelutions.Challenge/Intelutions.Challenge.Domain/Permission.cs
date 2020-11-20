using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Intelutions.Challenge.Domain
{
    [Table("Permission")]
    public class Permission :BaseEntity
    {
        public int Id { get; set; }
        public string EmployeeFN { get; set; }
        public string EmployeeLN { get; set; }
        public int PermissionTypeNum { get; set; }
        public DateTime PermissionDate { get; set; }
    }
}
