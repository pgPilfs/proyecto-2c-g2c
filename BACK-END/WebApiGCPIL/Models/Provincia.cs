using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiGCPIL.Models
{
    public class Provincia
    {
        private int id;
        private int id_Pais;
        private string nombre;

        public Provincia(int id, int id_Pais, string nombre)
        {
            Id = id;
            idPais = id_Pais;
            Nombre = nombre;
        }
        public int Id { get => id; set => id = value; }
        public int idPais { get => id_Pais; set => id_Pais = value; }
        public string Nombre { get => nombre; set => nombre = value; }
    }
}