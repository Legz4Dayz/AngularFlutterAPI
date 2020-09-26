using AutoMapper;
using Commander.Data.Users;
using Commander.Dtos.Users;
using Microsoft.AspNetCore.Mvc;

namespace Commander.Controllers
{
    [Route("api/admin")]
    [ApiController]
    public class AdminController : ControllerBase
    {
        private readonly IUserRepo _userRepo;
        private readonly IMapper _mapper;

        public AdminController(IUserRepo repo, IMapper mapper)
        {
            _userRepo = repo;
            _mapper = mapper;
        }

        [HttpPost]
        public ActionResult <bool> CreateUser(Login login) 
        {
            bool response = _userRepo.CreateUser(login);

            _userRepo.SaveChanges();
            return response;
        }
    }

}