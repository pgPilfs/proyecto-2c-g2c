using System.Net;
using System.Web.Http;
using System.Threading;
using WebApiGCPIL.Models;
using System.Web.Http.Cors;
using WebApiGCPIL.Models.Response;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace WebApiGCPIL.Controllers
{
    [AllowAnonymous]
    [RoutePrefix("api/login")]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class LoginController : ApiController
    {
        [HttpGet]
        [Route("echoping")]
        public IHttpActionResult EchoPing()
        {
            return Ok(true);
        }

        [HttpGet]
        [Route("echouser")]
        public IHttpActionResult EchoUser()
        {
            var identity = Thread.CurrentPrincipal.Identity;
            return Ok($" IPrincipal-user: {identity.Name} - IsAuthenticated: {identity.IsAuthenticated}");
        }

        [HttpPost]
        [Route("authenticate")]
        public IHttpActionResult Authenticate(Login login)
        {
            string connection = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();

            using (SqlConnection conn = new SqlConnection(connection))
            {
                conn.Open();
                int id = 0;
                int id_cuenta = 0;
                string nombre = null;
                string email = null;
                string password = null;

                if (login == null)
                {
                    //throw new HttpResponseException(HttpStatusCode.BadRequest);
                    return BadRequest();
                }
                else
                {
                    var comm = conn.CreateCommand();

                    comm.CommandText = "SELECT id, id_cuenta, nombre, email, contrasena FROM CLIENTE";
                    comm.CommandType = CommandType.Text;

                    var dr = comm.ExecuteReader();

                    for (var i = 0; (login.Email != email); i++)
                    {
                        if (dr.Read())
                        {
                            id = dr.GetInt32(0);
                            id_cuenta = dr.GetInt32(1);
                            nombre = dr.GetString(2).Trim();
                            email = dr.GetString(3).Trim();
                            password = dr.GetString(4).Trim();
                        }
                    }
                    //TODO: This code is only for demo - extract method in new class & validate correctly in your application !!
                    var isUserValid = (login.Email == email && login.Password == password);
                    dr.Close();
                    if (isUserValid)
                    {
                        var rolename = "User";
                        var token = TokenGenerator.GenerateTokenJwt(login.Email, rolename);
                        login.Token = token;

                        var response = new TokenResponse() {Id = id, Id_Cuenta = id_cuenta, Nombre = nombre, Email = email, Token = token };

                        return Ok(response);
                    }
                    // Unauthorized access 
                    return Unauthorized();
                }    
            }  
        }
    }
}
