using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WebApiGCPIL.Models
{
    public class GestorCliente
    {
        public Cliente BuscarCliente(int id)
        {
            Cliente cliente = null;
            string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "listar_cliente";
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id", id));

                SqlDataReader dr = comm.ExecuteReader();

                if (dr.Read())
                {
                    string nombre = dr.GetString(1).Trim();
                    string apellido = dr.GetString(2).Trim();
                    string email = dr.GetString(3).Trim();
                    string contrasena = dr.GetString(4).Trim();
                    string domicilio = dr.GetString(5).Trim();
                    int idLocalidad = dr.GetInt32(6);
                    int dni = dr.GetInt32(7);
                    int idCuenta = dr.GetInt32(6);

                    cliente = new Cliente(id, nombre, apellido, email, contrasena, domicilio, idLocalidad, dni, idCuenta);
                }

                dr.Close();

            }

            return cliente;
        }
    }
}