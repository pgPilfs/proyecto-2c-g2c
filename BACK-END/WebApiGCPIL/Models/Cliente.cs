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
        private string domicilio;
        private int idLocalidad;
        private int dni;
        private System.DateTime fechaNacimiento;
        private int idCuenta;
        private string cuil;
        private string genero;
        private string nacionalidad;
        private string contrasena;
        private byte fotoDniFrente;
        private byte fotoDniDorso;

        public Cliente()
        {

        }


        public Cliente(int id, string nombre, string apellido, string email, string domicilio, int idLocalidad, int dni, System.DateTime fechaNacimiento,int idCuenta , string cuil, string genero, string nacionalidad,string contrasena= null,  byte fotoDniFrente = 0, byte fotoDniDorso = 0)
        {
            Id = id;
            Nombre = nombre;
            Apellido = apellido;
            Email = email;
            Domicilio = domicilio;
            IdLocalidad = idLocalidad;
            Dni = dni;
            IdCuenta = idCuenta;
            FechaNacimiento = fechaNacimiento;
            Cuil = cuil;
            Genero = genero;
            Nacionalidad = nacionalidad;
            Contrasena = contrasena;
            FotoDniFrente = fotoDniFrente;
            FotoDniDorso = fotoDniDorso;
            
        }

        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido { get => apellido; set => apellido = value; }
        public string Email { get => email; set => email = value; }
        public string Domicilio { get => domicilio; set => domicilio = value; }
        public int IdLocalidad { get => idLocalidad; set => idLocalidad = value; }
        public int Dni { get => dni; set => dni = value; }
        public System.DateTime FechaNacimiento { get => fechaNacimiento; set => fechaNacimiento = value; }
        public int IdCuenta { get => idCuenta; set => idCuenta = value; }
        public string Cuil { get => cuil; set => cuil = value; }
        public string Genero { get => genero; set => genero = value; }
        public string Nacionalidad { get => nacionalidad; set => nacionalidad = value; }
        public string Contrasena { get => contrasena; set => contrasena = value; }
        public byte FotoDniFrente { get => fotoDniFrente; set => fotoDniFrente = value; }
        public byte FotoDniDorso { get => fotoDniDorso; set => fotoDniDorso = value; }
        
    }

    //public class Login
    //{
    //    private string email;
    //    private string contrasena;

    //    public Login()
    //    {

    //    }

    //    public Login( string email, string contrasena)
    //    {
    //        Email = email;
    //        Contrasena = contrasena;

    //    }

    //    public string Email { get => email; set => email = value; }
    //    public string Contrasena { get => contrasena; set => contrasena = value; }
    //}
}