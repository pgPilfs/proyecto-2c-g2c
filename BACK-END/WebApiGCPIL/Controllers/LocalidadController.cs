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
    public class LocalidadController : ApiController
    {
        // GET: api/Localidad
        public IEnumerable<Localidad> Get()
        {
            GestorLocalidad gestorLocalidad = new GestorLocalidad();
            return gestorLocalidad.MostrarLocalidades();
        }

        // GET: api/Localidad/5
        public Localidad Get(int id)
        {
            GestorLocalidad gestorLocalidad = new GestorLocalidad();
            return gestorLocalidad.MostrarLocalidad(id);
        }

        // POST: api/Localidad
        //public void Post([FromBody] Localidad value)
        //{
        //    GestorLocalidad gestorLocalidad = new GestorLocalidad();
        //    gestorLocalidad.InsertarLocalidad(value);
        //}

        // PUT: api/Localidad/5
        //public void Put(int id, [FromBody] Localidad value)
        //{
        //    GestorLocalidad gestorLocalidad = new GestorLocalidad();
        //    gestorLocalidad.ActualizarLocalidad(id, value);
        //}

        // DELETE: api/Localidad/5
        //public void Delete(int id)
        //{
        //    GestorLocalidad gestorLocalidad = new GestorLocalidad();
        //    gestorLocalidad.EliminarLocalidad(id);
        //}
    }
}
