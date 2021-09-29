using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApiGCPIL.Models
{
    public class GestorPais
    {
        // GET
        public List<Pais> MostrarPaises()
        {
            List<Pais> lista = new List<Pais>();
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "mostrar_paises";
                comm.CommandType = CommandType.StoredProcedure;

                SqlDataReader dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    int id = dr.GetInt32(0);
                    string nombre = dr.GetString(1).Trim();

                    Pais pais = new Pais(id, nombre);
                    lista.Add(pais);
                }
                dr.Close();
            }
            return lista;
        }
        // GET/id
        public Pais MostrarPais(int id)
        {
            Pais pais = null;
            string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "mostrar_pais";
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id", id));

                SqlDataReader dr = comm.ExecuteReader();

                if (dr.Read())
                {
                    string nombre = dr.GetString(1).Trim();

                    pais = new Pais(id, nombre);
                }
                dr.Close();
            }
            return pais;
        }
        // POST
        //public void InsertarPais(Pais pais)
        //{
        //    string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(connection))
        //    {
        //        conn.Open();

        //        SqlCommand comm = conn.CreateCommand();
        //        comm.CommandText = "insertar_pais";
        //        comm.CommandType = CommandType.StoredProcedure;
        //        comm.Parameters.Add(new SqlParameter("@nombre", pais.Nombre));
        //        comm.ExecuteNonQuery();
        //    }
        //}


        // PUT/id
        //public void ActualizarPais(int id, Pais pais)
        //{
        //    string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(connection))
        //    {
        //        conn.Open();

        //        SqlCommand comm = conn.CreateCommand();
        //        comm.CommandText = "actualizar_pais";
        //        comm.CommandType = CommandType.StoredProcedure;
        //        comm.Parameters.Add(new SqlParameter("@id", pais.Id));
        //        comm.Parameters.Add(new SqlParameter("@nombre", pais.Nombre));
        //        comm.ExecuteNonQuery();
        //    }
        //}


        // DELETE/id
        //public void EliminarPais(int id)
        //{
        //    string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(StrConn))
        //    {
        //        conn.Open();

        //        SqlCommand comm = new SqlCommand("eliminar_pais", conn);
        //        comm.CommandType = System.Data.CommandType.StoredProcedure;
        //        comm.Parameters.Add(new SqlParameter("@id", id));

        //        comm.ExecuteNonQuery();
        //    }
        //}
    }
}