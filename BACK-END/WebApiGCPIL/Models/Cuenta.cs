using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiGCPIL.Models
{
    public class Cuenta
    {
        private int id;
        private int id_tipoCuenta;
        private int id_cliente;
        private string cvu;
        private double saldo;
        private string estado;
        private string giro_descubierto;
        private string calificacion_crediticia;
        private double comision;
        private double cotizacion;
        public Cuenta(int id, int id_tipoCuenta, int id_cliente, string cvu, double saldo, string estado, string giro_descubierto, string calificacion_crediticia, double comision, double cotizacion)
        {
            Id = id;
            Id_TipoCuenta = id_tipoCuenta;
            Id_Cliente = id_cliente;
            CVU = cvu;
            Saldo = saldo;
            Estado = estado;
            Giro_Descubierto = giro_descubierto;
            Calificacion_Crediticia = calificacion_crediticia;
            Comision = comision;
            Cotizacion = cotizacion;
        }
        public int Id { get => id; set => id = value; }
        public int Id_TipoCuenta { get => id_tipoCuenta; set => id_tipoCuenta = value; }
        public int Id_Cliente { get => id_cliente; set => id_cliente = value; }
        public string CVU { get => cvu; set => cvu = value; }
        public double Saldo { get => saldo; set => saldo = value; }
        public string Estado { get => estado; set => estado = value;  }
        public string Giro_Descubierto { get => giro_descubierto; set => giro_descubierto = value;  }
        public string Calificacion_Crediticia { get => calificacion_crediticia; set => calificacion_crediticia = value;  }
        public double Comision { get => comision; set => comision = value;  }
        public double Cotizacion { get => cotizacion; set => cotizacion = value;  }
    }
}