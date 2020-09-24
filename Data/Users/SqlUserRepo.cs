// using System;
// using System.Collections.Generic;
// using System.Linq;
// using Commander.Dtos.Users;
// using Commander.Models;

// namespace Commander.Data.Users
// {
//     public class SqlUserRepo : IUserRepo
//     {
//         private readonly UserContext _context;

//         public SqlUserRepo(UserContext context)
//         {
//             _context = context;
//         }

//         public bool SaveChanges()
//         {
//             return (_context.SaveChanges() >= 0);
//         }

//         public void ValidateUsers(Login login)
//         {

//         }
//     }
// }