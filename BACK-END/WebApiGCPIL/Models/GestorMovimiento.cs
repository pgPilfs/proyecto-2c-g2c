using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApiGCPIL.Models
{
    public class GestorMovimiento
    {
        // GET
        //public List<Movimiento> MostrarMovimientos()
        //{
        //    List<Movimiento> lista = new List<Movimiento>();
        //    string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(StrConn))
        //    {
        //        conn.Open();

        //        SqlCommand comm = conn.CreateCommand();
        //        comm.CommandText = "mostrar_movimientos";
        //        comm.CommandType = CommandType.StoredProcedure;

        //        SqlDataReader dr = comm.ExecuteReader();
        //        while (dr.Read())
        //        {
        //            int id = dr.GetInt32(0);
        //            double monto = dr.GetDouble(1);
        //            DateTime fecha_hora = dr.GetDateTime(2);
        //            int id_Destino = dr.GetInt32(3);
        //            int id_Origen = dr.GetInt32(4);
        //            string motivo = dr.GetString(5).Trim();
        //            int id_TipoMovimiento = dr.GetInt32(6);

        //            Movimiento movimiento = new Movimiento( id_TipoMovimiento, id_Origen, id_Destino, monto, fecha_hora, motivo, id);
        //            lista.Add(movimiento);
        //        }
        //        dr.Close();
        //    }
        //    return lista;
        //}


        // GET/id ---> CREAR PROCEDIMIENTO DE CONSULTA DE LOS ÚLTIMOS 10 MOVIMIENTOS POR ID DE ORIGEN
        public List<Movimiento> MostrarMovimiento(int _id)
        {
            List<Movimiento> lista = new List<Movimiento>();
            Movimiento movimiento = null;
            int valor_null_destino;
            string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "mostrar_ultimos_movimientos";
                comm.CommandType = CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id", _id));

                SqlDataReader dr = comm.ExecuteReader();

                while (dr.Read())
                {
                    int id = dr.GetInt32(0);
                    double monto = dr.GetDouble(1);
                    DateTime fecha_hora = dr.GetDateTime(2);

                    if (dr.IsDBNull(3))
                    {
                        valor_null_destino = 0;
                    }else
                    {
                        valor_null_destino = dr.GetInt32(3);
                    }
                    int id_Destino = valor_null_destino;

                    int id_Origen = dr.GetInt32(4);
                    string motivo = dr.GetString(5).Trim();
                    int id_TipoMovimiento = dr.GetInt32(6);

                    movimiento = new Movimiento( id_TipoMovimiento, id_Origen, id_Destino, monto, fecha_hora, motivo, id );
                    lista.Add(movimiento);
                }
                dr.Close();
            }
            return lista;
        }


        // POST ---> ASIGNARLE EL MOVIMIENTO A LA ID DE CUENTA CORRESPONDIENTE, NO PUEDE QUEDAR HUERFANO
        //1ero debo INSERTAR EL MOVIMIENTO, OBTENER EL SALDO DE LA CUENTA, DISCRIMINAR QUE TIPO DE OPERACION ES(IFS) Y ACTUALIZAR EL SALDO DE LA CTA
        public string InsertarMovimiento(Movimiento movimiento)
        {
            string mensaje;

            string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();
            SqlTransaction objTransaction = null;
            SqlParameter param = new SqlParameter("@id_destino", SqlDbType.Int);
            param.Value = DBNull.Value;

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();

                objTransaction = conn.BeginTransaction("Movimientos");

                var con = conn.CreateCommand();

                con.Transaction = objTransaction;

                try
                {
                    if(movimiento.idOrigen == 0)
                    {
                        return mensaje = "ERROR: el idOrigen no puede ser cero";
                    }
                    else
                    {
                        con.CommandText = "insertar_movimiento";
                        con.CommandType = CommandType.StoredProcedure;

                        if (movimiento.idTipoMovimiento == 2 || movimiento.idTipoMovimiento == 3)
                        {
                            con.Parameters.Add(new SqlParameter("@id_TipoMovimiento", movimiento.idTipoMovimiento));
                            con.Parameters.Add(param);
                            con.Parameters.Add(new SqlParameter("@id_Origen", movimiento.idOrigen));
                            con.Parameters.Add(new SqlParameter("@monto", movimiento.Monto));
                            con.Parameters.Add(new SqlParameter("@fecha_hora", movimiento.fechaHora));
                            con.Parameters.Add(new SqlParameter("@motivo", movimiento.Motivo));
                            con.ExecuteNonQuery();
                        }
                        else
                        {
                            if (movimiento.idDestino == 0)
                            {
                                return mensaje = "ERROR: el idDestino no puede ser cero";
                            }
                            else
                            {
                                con.Parameters.Add(new SqlParameter("@id_TipoMovimiento", movimiento.idTipoMovimiento));
                                con.Parameters.Add(new SqlParameter("@id_Destino", movimiento.idDestino));
                                con.Parameters.Add(new SqlParameter("@id_Origen", movimiento.idOrigen));
                                con.Parameters.Add(new SqlParameter("@monto", movimiento.Monto));
                                con.Parameters.Add(new SqlParameter("@fecha_hora", movimiento.fechaHora));
                                con.Parameters.Add(new SqlParameter("@motivo", movimiento.Motivo));
                                con.ExecuteNonQuery();
                            }
                                
                        }


                        con.Parameters.Clear();

                        double saldoOrigen = 0;
                        double saldoOrigenNuevo = 0;
                        double saldoDestino = 0;
                        double saldoDestinoNuevo = 0;


                        //consulta saldo Origen
                        con.CommandText = "consultar_saldo";
                        con.CommandType = CommandType.StoredProcedure;
                        con.Parameters.Add(new SqlParameter("@id", movimiento.idOrigen));

                        SqlDataReader dr = con.ExecuteReader();

                        if (dr.Read())
                        {
                            saldoOrigen = dr.GetDouble(0);
                        }
                        dr.Close();

                        if (movimiento.idTipoMovimiento == 1) //transferencia
                        {
                            //consulta saldo Destino
                            con.Parameters.Clear();
                            con.CommandText = "consultar_saldo";
                            con.CommandType = CommandType.StoredProcedure;
                            con.Parameters.Add(new SqlParameter("@id", movimiento.idDestino));

                            SqlDataReader dr1 = con.ExecuteReader();

                            if (dr1.Read())
                            {
                                saldoDestino = dr1.GetDouble(0);
                            }
                            dr1.Close();

                            saldoOrigenNuevo = saldoOrigen - movimiento.Monto;
                            saldoDestinoNuevo = saldoDestino + movimiento.Monto;

                            //actualizar saldo cuenta Origen
                            con.Parameters.Clear();
                            con.CommandText = "actualizar_saldo_cuenta";
                            con.CommandType = CommandType.StoredProcedure;
                            con.Parameters.Add(new SqlParameter("@id", movimiento.idOrigen));
                            con.Parameters.Add(new SqlParameter("@saldo", saldoOrigenNuevo));
                            con.ExecuteNonQuery();
                            //actualizar saldo cuenta Destino
                            con.Parameters.Clear();
                            con.CommandText = "actualizar_saldo_cuenta";
                            con.CommandType = CommandType.StoredProcedure;
                            con.Parameters.Add(new SqlParameter("@id", movimiento.idDestino));
                            con.Parameters.Add(new SqlParameter("@saldo", saldoDestinoNuevo));
                            con.ExecuteNonQuery();
                            //inserto movimiento en tabla movimiento de Destino
                            con.Parameters.Clear();
                            con.CommandText = "insertar_movimiento";
                            con.CommandType = CommandType.StoredProcedure;

                            con.Parameters.Add(new SqlParameter("@id_TipoMovimiento", movimiento.idTipoMovimiento));
                            con.Parameters.Add(new SqlParameter("@id_Origen", movimiento.idDestino));
                            con.Parameters.Add(new SqlParameter("@id_Destino", movimiento.idOrigen)); //mismo movimiento pero con el idOrigen y idDestino revertidos
                            con.Parameters.Add(new SqlParameter("@monto", movimiento.Monto));
                            con.Parameters.Add(new SqlParameter("@fecha_hora", movimiento.fechaHora));
                            con.Parameters.Add(new SqlParameter("@motivo", movimiento.Motivo));
                            con.ExecuteNonQuery();

                        }
                        if (movimiento.idTipoMovimiento == 2)//ingreso de dinero
                        {
                            saldoOrigenNuevo = saldoOrigen + movimiento.Monto;
                            //actualizar saldo cuenta Origen
                            con.Parameters.Clear();
                            con.CommandText = "actualizar_saldo_cuenta";
                            con.CommandType = CommandType.StoredProcedure;
                            con.Parameters.Add(new SqlParameter("@id", movimiento.idOrigen));
                            con.Parameters.Add(new SqlParameter("@saldo", saldoOrigenNuevo));
                            con.ExecuteNonQuery();
                        }
                        if (movimiento.idTipoMovimiento == 3)//egreso de dinero
                        {
                            saldoOrigenNuevo = saldoOrigen - movimiento.Monto;
                            //actualizar saldo cuenta Origen
                            con.Parameters.Clear();
                            con.CommandText = "actualizar_saldo_cuenta";
                            con.CommandType = CommandType.StoredProcedure;
                            con.Parameters.Add(new SqlParameter("@id", movimiento.idOrigen));
                            con.Parameters.Add(new SqlParameter("@saldo", saldoOrigenNuevo));
                            con.ExecuteNonQuery();
                        }

                        objTransaction.Commit();
                        mensaje = "transaccion exitosa";
                    }
                    
                }
                catch (Exception)
                {
                    objTransaction.Rollback();
                    mensaje = "error en la transacción";
                }
                return mensaje;

            }
        }

        //// PUT/id
        //public void ActualizarMovimiento(int id, Movimiento movimiento)
        //{
        //    string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(connection))
        //    {
        //        conn.Open();

        //        SqlCommand comm = conn.CreateCommand();
        //        comm.CommandText = "actualizar_movimiento";
        //        comm.CommandType = CommandType.StoredProcedure;
        //        comm.Parameters.Add(new SqlParameter("@id", movimiento.Id));

        //        comm.Parameters.Add(new SqlParameter("@id_TipoMovimiento", movimiento.idTipoMovimiento));
        //        comm.Parameters.Add(new SqlParameter("@id_Origen", movimiento.idOrigen));
        //        comm.Parameters.Add(new SqlParameter("@id_Destino", movimiento.idDestino));
        //        comm.Parameters.Add(new SqlParameter("@monto", movimiento.Monto));
        //        comm.Parameters.Add(new SqlParameter("@fecha_hora", movimiento.fechaHora));
        //        comm.Parameters.Add(new SqlParameter("@motivo", movimiento.Motivo));
        //        comm.ExecuteNonQuery();
        //    }
        //}

        //// DELETE/id
        //public void EliminarMovimiento(int id)
        //{
        //    string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

        //    using (SqlConnection conn = new SqlConnection(StrConn))
        //    {
        //        conn.Open();

        //        SqlCommand comm = new SqlCommand("eliminar_movimiento", conn);
        //        comm.CommandType = System.Data.CommandType.StoredProcedure;
        //        comm.Parameters.Add(new SqlParameter("@id", id));

        //        comm.ExecuteNonQuery();
        //    }
        //}
    }
}