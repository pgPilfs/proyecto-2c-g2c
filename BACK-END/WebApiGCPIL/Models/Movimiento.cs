using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiGCPIL.Models
{
    public class Movimiento
    {
        private int? id;
        private int id_TipoMovimiento;
        private int id_Origen;
        private int id_Destino;
        private double monto;
        private DateTime fecha_hora;
        private string motivo;

        public Movimiento( int id_TipoMovimiento, int id_Origen, int id_Destino, double monto, DateTime fecha_hora, string motivo, int? id)
        {
            Id = id;
            idTipoMovimiento = id_TipoMovimiento;
            idOrigen = id_Origen;
            idDestino = id_Destino;
            Monto = monto;
            fechaHora = fecha_hora;
            Motivo = motivo;
        }
        public int? Id { get => id; set => id = value; }
        public int idTipoMovimiento { get => id_TipoMovimiento; set => id_TipoMovimiento = value; }
        public int idOrigen { get => id_Origen; set => id_Origen = value; }
        public int idDestino { get => id_Destino; set => id_Destino = value; }
        public double Monto { get => monto; set => monto = value; }
        public DateTime fechaHora { get => fecha_hora; set => fecha_hora = value; }
        public string Motivo { get => motivo; set => motivo = value; }
    }
}