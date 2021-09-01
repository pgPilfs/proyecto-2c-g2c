using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiGCPIL.Models
{
    public class Cliente
    {
        private int id;
        private string nombre;
        private string apellido;
        private string email;
        private string contrasena;
        private string domicilio;
        private int idLocalidad;
        private int dni;
        private byte[] fotoDniFrente;
        private byte[] fotoDniDorso;
        private int idCuenta;

        public Cliente(int id, string nombre, string apellido, string email, string contrasena, string domicilio, int idLocalidad, int dni, int idCuenta, byte[] fotoDniFrente = null, byte[] fotoDniDorso = null)
        {
            Id = id;
            Nombre = nombre;
            Apellido = apellido;
            Email = email;
            Contrasena = contrasena;
            Domicilio = domicilio;
            IdLocalidad = idLocalidad;
            Dni = dni;
            FotoDniFrente = fotoDniFrente;
            FotoDniDorso = fotoDniDorso;
            IdCuenta = idCuenta;
        }

        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido { get => apellido; set => apellido = value; }
        public string Email { get => email; set => email = value; }
        public string Contrasena { get => contrasena; set => contrasena = value; }
        public string Domicilio { get => domicilio; set => domicilio = value; }
        public int IdLocalidad { get => idLocalidad; set => idLocalidad = value; }
        public int Dni { get => dni; set => dni = value; }
        public byte[] FotoDniFrente { get => fotoDniFrente; set => fotoDniFrente = value; }
        public byte[] FotoDniDorso { get => fotoDniDorso; set => fotoDniDorso = value; }
        public int IdCuenta { get => idCuenta; set => idCuenta = value; }
    }
}