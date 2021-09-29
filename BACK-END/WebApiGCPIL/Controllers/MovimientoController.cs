using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using WebApiGCPIL.Models;

namespace WebApiGCPIL.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class MovimientoController : ApiController
    {
        // GET: api/Movimiento
        //public IEnumerable<Movimiento> Get()
        //{
        //    GestorMovimiento gestorMovimiento = new GestorMovimiento();
        //    return gestorMovimiento.MostrarMovimientos();
        //}

        // GET: api/Movimiento/5 -->id DE LA TABLA CUENTA /ID ORIGEN?? --> DEBERIA DEVOLVER UNA LISTA CON LOS ULTIMOS 10 MOVIMIENTOS POR EJEMPLO
        //ENTONCES CUANDO CREE UN USUARIO DEBO ASIGNARLE UN ID ORIGEN AL MOVIMIENTO QUE VA A SER IGUAL AL ID DE ORIGEN
        public IEnumerable<Movimiento> Get(int id)
        {
            GestorMovimiento gestorMovimientos = new GestorMovimiento();
            return gestorMovimientos.MostrarMovimiento(id);
        }

        // POST: api/Movimiento
        string mensaje;
        public string Post([FromBody] Movimiento value)
        {
            GestorMovimiento gestorMovimiento = new GestorMovimiento();
            mensaje = gestorMovimiento.InsertarMovimiento(value);
            return mensaje;
        }

        // PUT: api/Movimiento/5
        //public void Put(int id, [FromBody] Movimiento value)
        //{
        //    GestorMovimiento gestorMovimiento = new GestorMovimiento();
        //    gestorMovimiento.ActualizarMovimiento(id, value);
        //}

        // DELETE: api/Movimiento/5
        //public void Delete(int id)
        //{
        //    GestorMovimiento gestorMovimiento = new GestorMovimiento();
        //    gestorMovimiento.EliminarMovimiento(id);
        //}
    }
}