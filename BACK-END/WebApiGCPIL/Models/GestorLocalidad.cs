using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApiGCPIL.Models
{
    public class GestorLocalidad
    {
        // GET
        public List<Localidad> MostrarLocalidades()
        {
            List<Localidad> lista = new List<Localidad>();
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "mostrar_localidades";
                comm.CommandType = CommandType.StoredProcedure;

                SqlDataReader dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    int id = dr.GetInt32(0);
                    string nombre = dr.GetString(1).Trim();
                    int cp = dr.GetInt16(2);
                    int id_Provincia = dr.GetInt32(3);

                    Localidad localidad = new Localidad(id, id_Provincia, nombre, cp);
                    lista.Add(localidad);
                }
                dr.Close();
            }
            return lista;
        }
        // GET/id
        public Localidad MostrarLocalidad(int id)
        {
            Localidad localidad = null;
            string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "mostrar_localidad";
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id", id));

                SqlDataReader dr = comm.ExecuteReader();

                if (dr.Read())
                {
                    string nombre = dr.GetString(1).Trim();
                    int cp = dr.GetInt16(2);
                    int id_Provincia = dr.GetInt32(3);
                  
                    localidad = new Localidad(id, id_Provincia, nombre, cp);
                }
                dr.Close();
            }
            return localidad;
        }

        // POST
        //public void InsertarLocalidad(Localidad localidad)
        //{
        //    string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(connection))
        //    {
        //        conn.Open();

        //        SqlCommand comm = conn.CreateCommand();
        //        comm.CommandText = "insertar_localidad";
        //        comm.CommandType = CommandType.StoredProcedure;
        //        comm.Parameters.Add(new SqlParameter("@id_Provincia", localidad.idProvincia));
        //        comm.Parameters.Add(new SqlParameter("@nombre", localidad.Nombre));
        //        comm.Parameters.Add(new SqlParameter("@codigo_postal", localidad.codigoPostal));
        //        comm.ExecuteNonQuery();
        //    }
        //}

        // PUT/id
        //public void ActualizarLocalidad(int id, Localidad localidad)
        //{
        //    string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(connection))
        //    {
        //        conn.Open();

        //        SqlCommand comm = conn.CreateCommand();
        //        comm.CommandText = "actualizar_localidad";
        //        comm.CommandType = CommandType.StoredProcedure;
        //        comm.Parameters.Add(new SqlParameter("@id", localidad.Id));
        //        comm.Parameters.Add(new SqlParameter("@id_Provincia", localidad.idProvincia));
        //        comm.Parameters.Add(new SqlParameter("@nombre", localidad.Nombre));
        //        comm.Parameters.Add(new SqlParameter("@codigo_postal", localidad.codigoPostal));
        //        comm.ExecuteNonQuery();
        //    }
        //}

        // DELETE/id
        //public void EliminarLocalidad(int id)
        //{
        //    string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(StrConn))
        //    {
        //        conn.Open();

        //        SqlCommand comm = new SqlCommand("eliminar_localidad", conn);
        //        comm.CommandType = System.Data.CommandType.StoredProcedure;
        //        comm.Parameters.Add(new SqlParameter("@id", id));

        //        comm.ExecuteNonQuery();
        //    }
        //}
    }
}