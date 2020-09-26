using System.Collections.Generic;
using Commander.Dtos.Users;

namespace Commander.Data.Users
{
    public interface IUserRepo
    {
        bool SaveChanges();

        bool ValidateUsers(Login login );

        void CreateUser(Login login);
    }

}