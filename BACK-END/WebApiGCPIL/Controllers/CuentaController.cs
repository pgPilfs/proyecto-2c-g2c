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
    [Authorize]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class CuentaController : ApiController
    {
        // GET: api/Cuenta
        //public IEnumerable<Cuenta> Get()
        //{
        //    /* return new string[] { "value1", "value2" };*/
        //    GestorCuenta gestorCuenta = new GestorCuenta();
        //    return gestorCuenta.MostrarCuentas();
        //}

        // GET: api/Cuenta/5
        public Cuenta Get(int id)
        {
            GestorCuenta gestorCuenta = new GestorCuenta();
            return gestorCuenta.MostrarCuenta(id);
        }

        // POST: api/Cuenta
        //public void Post([FromBody] Cuenta value)
        //{
        //    GestorCuenta gestorCuenta = new GestorCuenta();
        //    gestorCuenta.InsertarCuenta(value);
        //}

        // PUT: api/Cuenta/5
        //public void Put(int id, [FromBody] Cuenta value)
        //{
        //    GestorCuenta gestorCuenta = new GestorCuenta();
        //    gestorCuenta.ActualizarCuenta(id, value);
        //}

        // DELETE: api/Cuenta/5
        //public void Delete(int id)
        //{
        //    GestorCuenta gestorCuenta = new GestorCuenta();
        //    gestorCuenta.EliminarCuenta(id);
        //}
    }
}
