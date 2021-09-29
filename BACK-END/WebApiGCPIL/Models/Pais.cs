using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiGCPIL.Models
{
    public class Pais
    {
        private int id;
        private string nombre;

        public Pais (int id, string nombre)
        {
            Id = id;
            Nombre = nombre;
        }
        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
    }
}