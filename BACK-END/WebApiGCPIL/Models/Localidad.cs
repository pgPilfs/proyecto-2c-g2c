using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiGCPIL.Models
{
    public class Localidad
    {
        private int id;
        private int id_Provincia;
        private string nombre;
        private int cp;

        public Localidad(int id, int id_Provincia, string nombre, int cp)
        {
            Id = id;
            idProvincia = id_Provincia;
            Nombre = nombre;
            codigoPostal = cp;
        }
        public int Id { get => id; set => id = value; }
        public int idProvincia { get => id_Provincia; set => id_Provincia = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public int codigoPostal { get => cp; set => cp = value; }
    }
}