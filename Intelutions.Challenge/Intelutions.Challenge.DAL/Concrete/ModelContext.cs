using Intelutions.Challenge.Domain;
using Microsoft.EntityFrameworkCore;

namespace Intelutions.Challenge.DAL.Concrete
{
    public class ModelContext : DbContext
    {
        public ModelContext(DbContextOptions options) : base(options) { }

        public DbSet<Permission> Permissions { get; set; }
        public DbSet<PermissionType> PermissionTypes { get; set; }
    }
}
