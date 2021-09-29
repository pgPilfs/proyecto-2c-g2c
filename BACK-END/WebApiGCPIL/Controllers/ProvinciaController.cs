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
    public class ProvinciaController : ApiController
    {
        // GET: api/Provincia
        public IEnumerable<Provincia> Get()
        {
            GestorProvincia gestorProvincia = new GestorProvincia();
            return gestorProvincia.MostrarProvincias();
        }

        // GET: api/Provincia/5
        public Provincia Get(int id)
        {
            GestorProvincia gestorProvincia = new GestorProvincia();
            return gestorProvincia.MostrarProvincia(id);
        }

        // POST: api/Provincia
        //public void Post([FromBody] Provincia value)
        //{
        //    GestorProvincia gestorProvincia = new GestorProvincia();
        //    gestorProvincia.InsertarProvincia(value);
        //}

        // PUT: api/Provincia/5
        //public void Put(int id, [FromBody] Provincia value)
        //{
        //    GestorProvincia gestorProvincia = new GestorProvincia();
        //    gestorProvincia.ActualizarProvincia(id, value);
        //}

        // DELETE: api/Provincia/5
        //public void Delete(int id)
        //{
        //    GestorProvincia gestorProvincia = new GestorProvincia();
        //    gestorProvincia.EliminarProvincia(id);
        //}
    }
}
