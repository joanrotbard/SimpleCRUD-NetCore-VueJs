using Intelutions.Challenge.DAL.Abstract;
using Intelutions.Challenge.Domain;

namespace Intelutions.Challenge.DAL.Concrete
{
    public class PermissionTypeRepository : EFRepository<PermissionType>, IPermissionTypeRepository
    {
        public PermissionTypeRepository(ModelContext context)
            : base(context)
        {
        }
    }
}
