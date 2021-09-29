using System.Collections.Generic;
using System.Web.Http;
using System.Web.Http.Cors;
using WebApiGCPIL.Models;

namespace WebApiGCPIL.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ClienteController : ApiController
    {
        // GET: api/Cliente
        public IEnumerable<Cliente> Get()
        {
            GestorCliente gestorCliente = new GestorCliente();
            return gestorCliente.BuscarClientes();
        }

        // GET: api/Cliente/5
        public Cliente Get(int id)
        {
            GestorCliente gestorCliente = new GestorCliente();
            return gestorCliente.BuscarCliente(id);
        }

        // POST: api/Cliente

        int idCliente = 0;
        public int Post([FromBody] Cliente value)
        {
            GestorCliente gestorCliente = new GestorCliente();
            idCliente = gestorCliente.InsertarCliente(value);
            return idCliente;
        }

        // POST: api/Login??

        //string mensaje = "";
        //public string Post([FromBody] Login value)
        //{
        //    GestorCliente gestorCliente = new GestorCliente();
        //    mensaje = gestorCliente.consultarCliente(value);
        //    return mensaje ;
        //}

        // PUT: api/Cliente/5
        //public void Put(int id, [FromBody]Cliente value)
        //{
        //    GestorCliente gestorCliente = new GestorCliente();
        //    gestorCliente.ActualizarCliente(id, value);
        //}

        // DELETE: api/Cliente/5
        //public void Delete(int id)
        //{
        //    GestorCliente gestorCliente = new GestorCliente();
        //    gestorCliente.EliminarCliente(id);
        //}
    }
}
