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
    public class PaisController : ApiController
    {
        // GET: api/Pais
        public IEnumerable<Pais> Get()
        {
            GestorPais gestorPais = new GestorPais();
            return gestorPais.MostrarPaises();
        }

        // GET: api/Pais/5
        public Pais Get(int id)
        {
            GestorPais gestorPais = new GestorPais();
            return gestorPais.MostrarPais(id);
        }

        // POST: api/Pais
        //public void Post([FromBody] Pais value)
        //{
        //    GestorPais gestorPais = new GestorPais();
        //    gestorPais.InsertarPais(value);
        //}

        // PUT: api/Pais/5
        //public void Put(int id, [FromBody] Pais value)
        //{
        //    GestorPais gestorPais = new GestorPais();
        //    gestorPais.ActualizarPais(id, value);
        //}

        // DELETE: api/Pais/5
        //public void Delete(int id)
        //{
        //    GestorPais gestorPais = new GestorPais();
        //    gestorPais.EliminarPais(id);
        //}
    }
}
