using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApiGCPIL.Models
{
    public class GestorCuenta
    {
        // GET
        //public List<Cuenta> MostrarCuentas()
        //{
        //    List<Cuenta> lista = new List<Cuenta>();
        //    string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(StrConn))
        //    {
        //        conn.Open();

        //        SqlCommand comm = conn.CreateCommand();
        //        comm.CommandText = "mostrar_cuentas";
        //        comm.CommandType = CommandType.StoredProcedure;

        //        SqlDataReader dr = comm.ExecuteReader();
        //        while (dr.Read())
        //        {
        //            int id = dr.GetInt32(0);
        //            int id_tipoCuenta = dr.GetInt32(1);
        //            int id_cliente = dr.GetInt32(2);
        //            string cvu = dr.GetString(3).Trim();
        //            double saldo = dr.GetDouble(4);
        //            string estado = dr.GetString(5).Trim();
        //            string giro_descubierto = dr.GetString(6).Trim();
        //            string calificacion_crediticia = dr.GetString(7).Trim();
        //            double comision = dr.GetDouble(8);
        //            double cotizacion = dr.GetDouble(9);

        //            Cuenta cuenta = new Cuenta(id, id_tipoCuenta, id_cliente, cvu, saldo, estado, giro_descubierto, calificacion_crediticia, comision, cotizacion);
        //            lista.Add(cuenta);
        //        }
        //        dr.Close();
        //    }
        //    return lista;
        //}


        // GET/id
        public Cuenta MostrarCuenta(int id)
        {
            Cuenta cuenta = null;
            string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "mostrar_cuenta";
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id", id));

                SqlDataReader dr = comm.ExecuteReader();

                if (dr.Read())
                {
                    double saldo = dr.GetDouble(1);
                    string cvu = dr.GetString(2).Trim();
                    double comision = dr.GetDouble(3);
                    double cotizacion = dr.GetDouble(4);
                    string calificacion_crediticia = dr.GetString(5).Trim();
                    string giro_descubierto = dr.GetString(6).Trim();
                    string estado = dr.GetString(7).Trim();
                    int id_tipoCuenta = dr.GetInt32(8);
                    int id_cliente = dr.GetInt32(9);

                    cuenta = new Cuenta(id, id_tipoCuenta, id_cliente, cvu, saldo, estado, giro_descubierto, calificacion_crediticia, comision, cotizacion);
                }
                dr.Close();
            }
            return cuenta;
        }
        // POST
        //public void InsertarCuenta(Cuenta cuenta)
        //{
        //    string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(connection))
        //    {
        //        conn.Open();
                
        //        SqlCommand comm = conn.CreateCommand();
        //        comm.CommandText = "insertar_cuenta";
        //        comm.CommandType = CommandType.StoredProcedure;
        //        comm.Parameters.Add(new SqlParameter("@id_tipoCuenta", cuenta.Id_TipoCuenta ));
        //        comm.Parameters.Add(new SqlParameter("@id_cliente", cuenta.Id_Cliente));
        //        comm.Parameters.Add(new SqlParameter("@cvu", cuenta.CVU));
        //        comm.Parameters.Add(new SqlParameter("@saldo", cuenta.Saldo));
        //        comm.Parameters.Add(new SqlParameter("@estado", cuenta.Estado));
        //        comm.Parameters.Add(new SqlParameter("@giro_descubierto", cuenta.Giro_Descubierto));
        //        comm.Parameters.Add(new SqlParameter("@calificacion_crediticia", cuenta.Calificacion_Crediticia));
        //        comm.Parameters.Add(new SqlParameter("@comision", cuenta.Comision));
        //        comm.Parameters.Add(new SqlParameter("@cotizacion", cuenta.Cotizacion));
        //        comm.ExecuteNonQuery();
        //    }
        //}

        // PUT/id
        //public void ActualizarCuenta(int id, Cuenta cuenta)
        //{
        //    string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(connection))
        //    {
        //        conn.Open();

        //        SqlCommand comm = conn.CreateCommand();
        //        comm.CommandText = "actualizar_cuenta";
        //        comm.CommandType = CommandType.StoredProcedure;
        //        comm.Parameters.Add(new SqlParameter("@id", cuenta.Id));
        //        comm.Parameters.Add(new SqlParameter("@id_tipoCuenta", cuenta.Id_TipoCuenta));
        //        comm.Parameters.Add(new SqlParameter("@id_cliente", cuenta.Id_Cliente));
        //        comm.Parameters.Add(new SqlParameter("@cvu", cuenta.CVU));
        //        comm.Parameters.Add(new SqlParameter("@saldo", cuenta.Saldo));
        //        comm.Parameters.Add(new SqlParameter("@estado", cuenta.Estado));
        //        comm.Parameters.Add(new SqlParameter("@giro_descubierto", cuenta.Giro_Descubierto));
        //        comm.Parameters.Add(new SqlParameter("@calificacion_crediticia", cuenta.Calificacion_Crediticia));
        //        comm.Parameters.Add(new SqlParameter("@comision", cuenta.Comision));
        //        comm.Parameters.Add(new SqlParameter("@cotizacion", cuenta.Cotizacion));
        //        comm.ExecuteNonQuery();
        //    }
        //}

        // DELETE/id
        //public void EliminarCuenta(int id)
        //{
        //    string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(StrConn))
        //    {
        //        conn.Open();

        //        SqlCommand comm = new SqlCommand("eliminar_cuenta", conn);
        //        comm.CommandType = System.Data.CommandType.StoredProcedure;
        //        comm.Parameters.Add(new SqlParameter("@id", id));

        //        comm.ExecuteNonQuery();
        //    }
        //}
    }
}