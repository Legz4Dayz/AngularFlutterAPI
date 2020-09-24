using System.Collections.Generic;
using Commander.Dtos.Users;

namespace Commander.Data.Users
{
    public interface IUserRepo
    {
        bool SaveChanges();

        void ValidateUsers(Login login );

    }

}