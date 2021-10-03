using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

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
                //validar si viene nulo un registro con un if
                if (dr.Read())
                {
                    string nombre = dr.GetString(1).Trim();
                    string apellido = dr.GetString(2).Trim();
                    string email = dr.GetString(3).Trim();
                    //no retornamos contraseña
                    string domicilio = dr.GetString(5).Trim();
                    int idLocalidad = dr.GetInt32(6);
                    int dni = dr.GetInt32(7);
                    DateTime fechaNacimiento = dr.GetDateTime(8);
                    int idCuenta = dr.GetInt32(9);
                    string cuit = dr.GetString(10).Trim();
                    string genero = dr.GetString(11).Trim();
                    string nacionalidad = dr.GetString(12).Trim();

                    cliente = new Cliente(id, nombre, apellido, email, domicilio, idLocalidad, dni, fechaNacimiento, idCuenta, cuit, genero, nacionalidad);
                }

                dr.Close();

            }

            return cliente;
        }

        //public List<Cliente> BuscarClientes()
        //{
        //    List<Cliente> lista = new List<Cliente>();
        //    string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(connection))
        //    {
        //        conn.Open();

        //        SqlCommand comm = conn.CreateCommand();
        //        comm.CommandText = "listar_clientes";
        //        comm.CommandType = CommandType.StoredProcedure;

        //        SqlDataReader dr = comm.ExecuteReader();

        //        while (dr.Read())
        //        {
        //            int id = dr.GetInt32(0);
        //            string nombre = dr.GetString(1).Trim();
        //            string apellido = dr.GetString(2).Trim();
        //            string email = dr.GetString(3).Trim();
        //            string contrasena = dr.GetString(4).Trim();
        //            string domicilio = dr.GetString(5).Trim();
        //            int idLocalidad = dr.GetInt32(6);
        //            int dni = dr.GetInt32(7);
        //            DateTime fechaNacimiento = dr.GetDateTime(8);
        //            int idCuenta = dr.GetInt32(9);
        //            string cuit = dr.GetString(10).Trim();
        //            string genero = dr.GetString(11).Trim();
        //            string nacionalidad = dr.GetString(12).Trim();

        //            Cliente cliente = new Cliente(id, nombre, apellido, email, domicilio, idLocalidad, dni, fechaNacimiento, idCuenta, cuit, genero, nacionalidad, contrasena);
        //            lista.Add(cliente);
        //        }

        //        dr.Close();
        //    }

        //    return lista;


        //}

        public int InsertarCliente(Cliente cliente)
        {
            int? value = 0;
            int resultado = 0;

            string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();
            SqlTransaction objTransaction = null;
            //creo parametros nulos
            SqlParameter param = new SqlParameter("@id_origen", SqlDbType.Int);
            param.Value = DBNull.Value;
            SqlParameter param1 = new SqlParameter("@id_destino", SqlDbType.Int);
            param1.Value = DBNull.Value;

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();

                objTransaction = conn.BeginTransaction("AltaCliente");

                var con = conn.CreateCommand();

                con.Transaction = objTransaction;

                try
                {
                    ///*PRIMERO INSERTO MOVIMIENTO INICIAL, 
                    ///DESPUES CREO LA CUENTA ASIGNANDO ESE ID DE MOVIMIENTO
                    ///LUEGO CREO EL CLIENTE CON EL ID DE LA CUENTA Y
                    ///POR ULTIMO, ACTUALIZO MOVIMIENTO CON EL ID_ORIGEN


                    con.CommandText = "insertar_movimiento";
                    con.CommandType = CommandType.StoredProcedure;
                    con.Parameters.Add(new SqlParameter("@monto", value));
                    con.Parameters.Add(new SqlParameter("@fecha_hora", DateTime.Now));
                    con.Parameters.Add(param);
                    con.Parameters.Add(param1);
                    con.Parameters.Add(new SqlParameter("@motivo", "apertura de cuenta"));
                    con.Parameters.Add(new SqlParameter("@id_tipoMovimiento", 5));


                    int idMov = Convert.ToInt32(con.ExecuteScalar());
                    string cvu = CreaCBU(); //deberia consultar si existe o no
                ///
                    con.Parameters.Clear();
                    con.CommandText = "insertar_cuenta";
                    con.CommandType = CommandType.StoredProcedure;
                    con.Parameters.Add(new SqlParameter("@id_tipoCuenta", 1));
                    con.Parameters.Add(new SqlParameter("@id_movimiento", idMov));
                    con.Parameters.Add(new SqlParameter("@cvu", cvu));
                    con.Parameters.Add(new SqlParameter("@saldo", value));
                    con.Parameters.Add(new SqlParameter("@estado", 1));
                    con.Parameters.Add(new SqlParameter("@giro_descubierto", value));
                    con.Parameters.Add(new SqlParameter("@calificacion_cred", 1));
                    con.Parameters.Add(new SqlParameter("@comision", 0.5));
                    con.Parameters.Add(new SqlParameter("@cotizacion", 183));

                    int idCuenta = Convert.ToInt32(con.ExecuteScalar());

                ///
                    con.Parameters.Clear();
                    con.CommandText = "actualizar_movimiento";
                    con.CommandType = CommandType.StoredProcedure;
                    con.Parameters.Add(new SqlParameter("@id", idMov));
                    con.Parameters.Add(new SqlParameter("@id_origen", idCuenta));
                    con.ExecuteNonQuery();

                ///
                    con.Parameters.Clear();
                    con.CommandText = "insertar_cliente";
                    con.CommandType = CommandType.StoredProcedure;


                    con.Parameters.Add(new SqlParameter("@nombre", cliente.Nombre));
                    con.Parameters.Add(new SqlParameter("@apellido", cliente.Apellido));
                    con.Parameters.Add(new SqlParameter("@email", cliente.Email));
                    con.Parameters.Add(new SqlParameter("@contrasena", cliente.Contrasena));
                    con.Parameters.Add(new SqlParameter("@domicilio", cliente.Domicilio));
                    con.Parameters.Add(new SqlParameter("@idLocalidad", cliente.IdLocalidad));
                    con.Parameters.Add(new SqlParameter("@dni", cliente.Dni));
                    con.Parameters.Add(new SqlParameter("@fechaNacimiento", cliente.FechaNacimiento));
                    con.Parameters.Add(new SqlParameter("@id_cuenta", idCuenta));
                    con.Parameters.Add(new SqlParameter("@cuil", cliente.Cuil));
                    con.Parameters.Add(new SqlParameter("@genero", cliente.Genero));
                    con.Parameters.Add(new SqlParameter("@nacionalidad", cliente.Nacionalidad));

                    resultado = Convert.ToInt32(con.ExecuteScalar());

                    objTransaction.Commit();
                }
                catch (Exception)
                {
                    objTransaction.Rollback();
                    resultado = 0;
 
                }
                return resultado;

            }

        }

        //public string consultarCliente(Login cliente)
        //{
        //    return "hola";
            //int? value = 0;
            //int resultado = 0;

            //string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();
            //SqlTransaction objTransaction = null;
            ////creo parametros nulos
            //SqlParameter param = new SqlParameter("@id_origen", SqlDbType.Int);
            //param.Value = DBNull.Value;
            //SqlParameter param1 = new SqlParameter("@id_destino", SqlDbType.Int);
            //param1.Value = DBNull.Value;

            //using (SqlConnection conn = new SqlConnection(connection))
            //{
            //    conn.Open();

            //    objTransaction = conn.BeginTransaction("AltaCliente");

            //    var con = conn.CreateCommand();

            //    con.Transaction = objTransaction;

            //    try
            //    {
            //        ///*PRIMERO INSERTO MOVIMIENTO INICIAL, 
            //        ///DESPUES CREO LA CUENTA ASIGNANDO ESE ID DE MOVIMIENTO
            //        ///LUEGO CREO EL CLIENTE CON EL ID DE LA CUENTA Y
            //        ///POR ULTIMO, ACTUALIZO MOVIMIENTO CON EL ID_ORIGEN


            //        con.CommandText = "insertar_movimiento";
            //        con.CommandType = CommandType.StoredProcedure;
            //        con.Parameters.Add(new SqlParameter("@monto", value));
            //        con.Parameters.Add(new SqlParameter("@fecha_hora", DateTime.Now));
            //        con.Parameters.Add(param);
            //        con.Parameters.Add(param1);
            //        con.Parameters.Add(new SqlParameter("@motivo", "apertura de cuenta"));
            //        con.Parameters.Add(new SqlParameter("@id_tipoMovimiento", 5));


            //        int idMov = Convert.ToInt32(con.ExecuteScalar());
            //        string cvu = CreaCBU(); //deberia consultar si existe o no
            //        ///
            //        con.Parameters.Clear();
            //        con.CommandText = "insertar_cuenta";
            //        con.CommandType = CommandType.StoredProcedure;
            //        con.Parameters.Add(new SqlParameter("@id_tipoCuenta", 1));
            //        con.Parameters.Add(new SqlParameter("@id_movimiento", idMov));
            //        con.Parameters.Add(new SqlParameter("@cvu", cvu));
            //        con.Parameters.Add(new SqlParameter("@saldo", value));
            //        con.Parameters.Add(new SqlParameter("@estado", 1));
            //        con.Parameters.Add(new SqlParameter("@giro_descubierto", value));
            //        con.Parameters.Add(new SqlParameter("@calificacion_cred", 1));
            //        con.Parameters.Add(new SqlParameter("@comision", 0.5));
            //        con.Parameters.Add(new SqlParameter("@cotizacion", 183));

            //        int idCuenta = Convert.ToInt32(con.ExecuteScalar());

            //        ///
            //        con.Parameters.Clear();
            //        con.CommandText = "actualizar_movimiento";
            //        con.CommandType = CommandType.StoredProcedure;
            //        con.Parameters.Add(new SqlParameter("@id", idMov));
            //        con.Parameters.Add(new SqlParameter("@id_origen", idCuenta));
            //        con.ExecuteNonQuery();

            //        ///
            //        con.Parameters.Clear();
            //        con.CommandText = "insertar_cliente";
            //        con.CommandType = CommandType.StoredProcedure;


            //        con.Parameters.Add(new SqlParameter("@nombre", cliente.Nombre));
            //        con.Parameters.Add(new SqlParameter("@apellido", cliente.Apellido));
            //        con.Parameters.Add(new SqlParameter("@email", cliente.Email));
            //        con.Parameters.Add(new SqlParameter("@contrasena", cliente.Contrasena));
            //        con.Parameters.Add(new SqlParameter("@domicilio", cliente.Domicilio));
            //        con.Parameters.Add(new SqlParameter("@idLocalidad", cliente.IdLocalidad));
            //        con.Parameters.Add(new SqlParameter("@dni", cliente.Dni));
            //        con.Parameters.Add(new SqlParameter("@fechaNacimiento", cliente.FechaNacimiento));
            //        con.Parameters.Add(new SqlParameter("@id_cuenta", idCuenta));
            //        con.Parameters.Add(new SqlParameter("@cuil", cliente.Cuil));
            //        con.Parameters.Add(new SqlParameter("@genero", cliente.Genero));
            //        con.Parameters.Add(new SqlParameter("@nacionalidad", cliente.Nacionalidad));

            //        resultado = Convert.ToInt32(con.ExecuteScalar());

            //        objTransaction.Commit();
            //    }
            //    catch (Exception)
            //    {
            //        objTransaction.Rollback();
            //        resultado = 0;

            //    }
            //    return resultado;

            //}

        //}

        //public void ActualizarCliente(int id, Cliente cliente)
        //{
        //    string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(connection))
        //    {
        //        conn.Open();

        //        SqlCommand comm = conn.CreateCommand();
        //        comm.CommandText = "actualizar_cliente";
        //        comm.CommandType = CommandType.StoredProcedure;
        //        comm.Parameters.Add(new SqlParameter("@id", cliente.Id));
        //        comm.Parameters.Add(new SqlParameter("@nombre", cliente.Nombre));
        //        comm.Parameters.Add(new SqlParameter("@apellido", cliente.Apellido));
        //        /*comm.Parameters.Add(new SqlParameter("@fotoDniFrente", cliente.FotoDniFrente = null));
        //        comm.Parameters.Add(new SqlParameter("@fotoDniDorso", cliente.FotoDniDorso = null));*/
        //        comm.Parameters.Add(new SqlParameter("@idLocalidad", cliente.IdLocalidad));
        //        comm.Parameters.Add(new SqlParameter("@domicilio", cliente.Domicilio));
        //        comm.Parameters.Add(new SqlParameter("@dni", cliente.Dni));
        //        comm.Parameters.Add(new SqlParameter("@email", cliente.Email));
        //        comm.Parameters.Add(new SqlParameter("@idCuenta", cliente.IdCuenta));
        //        comm.ExecuteNonQuery();
        //    }
        //}


        // DELETE/id
        //public void EliminarCliente(int id)
        //{
        //    string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(StrConn))
        //    {
        //        conn.Open();

        //        SqlCommand comm = new SqlCommand("eliminar_cliente", conn);
        //        comm.CommandType = System.Data.CommandType.StoredProcedure;
        //        comm.Parameters.Add(new SqlParameter("@id", id));

        //        comm.ExecuteNonQuery();
        //    }
        //}


        private string CreaCBU()
        {
            Random rnd = new Random();
            int number = rnd.Next(100000000, 1000000001);
            int number1 = rnd.Next(100000000, 1000000001);
            string cvu = number.ToString();
            string cbu = number1.ToString();
            return $"1000{cbu}{cvu}";
        }
    }
}