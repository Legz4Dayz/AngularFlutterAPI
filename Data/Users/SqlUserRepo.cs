using System;
using System.Collections.Generic;
using System.Linq;
using Commander.Dtos.Users;
using Commander.Models;

namespace Commander.Data.Users
{
    public class SqlUserRepo : IUserRepo
    {
        private readonly CommanderContext _context;

        public SqlUserRepo(CommanderContext context)
        {
            _context = context;
        }

        public bool SaveChanges()
        {
            return (_context.SaveChanges() >= 0);
        }

        public bool ValidateUsers(Login login)
        {
            var result = _context.Users.FirstOrDefault(x => x.Username == login.Username);
            if(result != null)
                return true;
            else
                return false;
        }
    }
}