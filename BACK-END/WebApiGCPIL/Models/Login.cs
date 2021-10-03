using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiGCPIL.Models
{
    public class Login
    {
        private string email;
        private string password;
        private string token;

        public string Email { get => email; set => email = value; }
        public string Password { get => password; set => password = value; }
        public string Token { get => token; set => token = value; }
    }
}