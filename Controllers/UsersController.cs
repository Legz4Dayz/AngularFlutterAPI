using AutoMapper;
using Commander.Data.Users;
using Commander.Dtos.Users;
using Microsoft.AspNetCore.Mvc;

namespace Commander.Controllers
{
    [Route("api/users")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IUserRepo _userRepo;
        private readonly IMapper _mapper;

        public UsersController(IUserRepo repo, IMapper mapper)
        {
            _userRepo = repo;
            _mapper = mapper;
        }

        [HttpPost]
        public ActionResult <bool> ValidateUser(Login login) 
        {
            // _userRepo.ValidateUsers
            return true;
        }
    }

}