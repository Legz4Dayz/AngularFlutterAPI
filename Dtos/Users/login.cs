
using System.ComponentModel.DataAnnotations;

namespace Commander.Dtos.Users
{
    public class Login
    {   
        [Required]
        [MaxLength(250)]
        public string Username { get; set; }
        [Required]
        public string Password { get; set; }
    }
}