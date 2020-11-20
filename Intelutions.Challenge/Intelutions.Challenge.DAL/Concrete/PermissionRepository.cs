using Intelutions.Challenge.DAL.Abstract;
using Intelutions.Challenge.Domain;

namespace Intelutions.Challenge.DAL.Concrete
{
    public class PermissionRepository : EFRepository<Permission>, IPermissionRepository
    {
        public PermissionRepository(ModelContext context)
            : base(context)
        {
        }
    }
}
