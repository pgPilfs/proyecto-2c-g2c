using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApiGCPIL.Models
{
    public class GestorProvincia
    {
        // GET
        public List<Provincia> MostrarProvincias()
        {
            List<Provincia> lista = new List<Provincia>();
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "mostrar_provincias";
                comm.CommandType = CommandType.StoredProcedure;

                SqlDataReader dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    int id = dr.GetInt32(0);
                    string nombre = dr.GetString(1).Trim();
                    int id_Pais = dr.GetInt32(2);

                    Provincia provincia = new Provincia(id, id_Pais, nombre);
                    lista.Add(provincia);
                }
                dr.Close();
            }
            return lista;
        }
        // GET/id
        public Provincia MostrarProvincia(int id)
        {
            Provincia provincia = null;
            string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "mostrar_provincia";
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id", id));

                SqlDataReader dr = comm.ExecuteReader();

                if (dr.Read())
                {
                    int id_Pais = dr.GetInt32(2);
                    string nombre = dr.GetString(1).Trim();

                    provincia = new Provincia(id, id_Pais, nombre);
                }
                dr.Close();
            }
            return provincia;
        }

        // POST
        //public void InsertarProvincia(Provincia provincia)
        //{
        //    string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(connection))
        //    {
        //        conn.Open();

        //        SqlCommand comm = conn.CreateCommand();
        //        comm.CommandText = "insertar_provincia";
        //        comm.CommandType = CommandType.StoredProcedure;
        //        comm.Parameters.Add(new SqlParameter("@id_Pais", provincia.idPais));
        //        comm.Parameters.Add(new SqlParameter("@nombre", provincia.Nombre));
        //        comm.ExecuteNonQuery();
        //    }
        //}

        // PUT/id
        //public void ActualizarProvincia(int id, Provincia provincia)
        //{
        //    string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(connection))
        //    {
        //        conn.Open();

        //        SqlCommand comm = conn.CreateCommand();
        //        comm.CommandText = "actualizar_provincia";
        //        comm.CommandType = CommandType.StoredProcedure;
        //        comm.Parameters.Add(new SqlParameter("@id", provincia.Id));
        //        comm.Parameters.Add(new SqlParameter("@id_Pais", provincia.idPais));
        //        comm.Parameters.Add(new SqlParameter("@nombre", provincia.Nombre));
        //        comm.ExecuteNonQuery();
        //    }
        //}


        // DELETE/id
        //public void EliminarProvincia(int id)
        //{
        //    string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(StrConn))
        //    {
        //        conn.Open();

        //        SqlCommand comm = new SqlCommand("eliminar_provincia", conn);
        //        comm.CommandType = System.Data.CommandType.StoredProcedure;
        //        comm.Parameters.Add(new SqlParameter("@id", id));

        //        comm.ExecuteNonQuery();
        //    }
        //}
    }
}