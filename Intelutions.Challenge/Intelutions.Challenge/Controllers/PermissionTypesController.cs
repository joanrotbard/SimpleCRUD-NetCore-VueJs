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
    public class PermissionTypesController : ControllerBase
    {

        private readonly IPermissionTypeRepository _permissionTypeRepository;

        private readonly ILogger<PermissionController> _logger;

        public PermissionTypesController(IPermissionRepository permissionRepository, IPermissionTypeRepository permissionTypeRepository)
        {
            _permissionTypeRepository = permissionTypeRepository;
        }
        [HttpGet("/api/permissiontypes")]
        public IEnumerable<PermissionType> Get()
        {
            return _permissionTypeRepository.GetAll();
        }

    }
}
