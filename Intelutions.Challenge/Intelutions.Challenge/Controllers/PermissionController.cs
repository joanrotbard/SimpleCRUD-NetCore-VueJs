using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Intelutions.Challenge.DAL.Abstract;
using Intelutions.Challenge.Domain;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace Intelutions.Challenge.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PermissionController : ControllerBase
    {

        private readonly IPermissionRepository _permissionRepository;
        private readonly IPermissionTypeRepository _permissionTypeRepository;

        private readonly ILogger<PermissionController> _logger;

        public PermissionController(IPermissionRepository permissionRepository, IPermissionTypeRepository permissionTypeRepository)
        {
            _permissionRepository = permissionRepository;
            _permissionTypeRepository = permissionTypeRepository;
        }
        [HttpGet("/api/permissions")]
        public IEnumerable<Permission> Get()
        {
            return _permissionRepository.GetAll();
        }

        [HttpPost("/api/permissions")]
        public ActionResult<Permission> Add(Permission permission)
        {
            _permissionRepository.Add(permission);
            _permissionRepository.Commit();
            return permission;
        }

        [HttpPut("/api/permissions/{id}")]
        public ActionResult<Permission> Update(Permission permission)
        {
            _permissionRepository.Update(permission);
            _permissionRepository.Commit();
            return permission;
        }

        [HttpDelete("/api/permissions/{id}")]
        public ActionResult<int> Delete(int Id)
        {
            var permission = _permissionRepository.GetSingle(Id);
            _permissionRepository.Delete(permission);
            _permissionRepository.Commit();
            return Id;
        }
    }
}
