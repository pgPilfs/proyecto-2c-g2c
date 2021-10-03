using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiGCPIL.Models.Response
{
    public class TokenResponse
    {
        private int id;
        private string nombre;
        private string email;
        private string token;

        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Email { get => email; set => email = value; }
        public string Token { get => token; set => token = value; }
    }
}