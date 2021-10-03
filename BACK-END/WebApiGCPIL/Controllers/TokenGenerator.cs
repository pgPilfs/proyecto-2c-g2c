using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;

namespace WebApiGCPIL.Controllers
{
    public class TokenGenerator 
    {
        public static string GenerateTokenJwt(string email, string rolname)
        {
            //TODO: appsetting for Demo JWT - protect correctly this settings
            var secretKey = ConfigurationManager.AppSettings["JWT_SECRET_KEY"];
            var audienceToken = ConfigurationManager.AppSettings["JWT_AUDIENCE_TOKEN"];
            var issuerToken = ConfigurationManager.AppSettings["JWT_ISSUER_TOKEN"];
            var expireTime = ConfigurationManager.AppSettings["JWT_EXPIRE_MINUTES"];
            //La llave de seguridad
            var securityKey = new SymmetricSecurityKey(System.Text.Encoding.Default.GetBytes(secretKey));
            //Representa la clave criptográfica y los algoritmos de seguridad que se utilizan para generar una firma digital.
            var signingCredentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256Signature);

            //Información que quiero tener guardada en el token, recibiendo un arreglo de Claims.
            ClaimsIdentity claimsIdentity = new ClaimsIdentity(new[] {
                new Claim(ClaimTypes.Email, email),
                new Claim(ClaimTypes.Role, rolname)
            });

            //Constructor que define las propiedades compartidas entre todos los controladores de tokens de seguridad.
            var tokenHandler = new System.IdentityModel.Tokens.Jwt.JwtSecurityTokenHandler();

            var jwtSecurityToken = tokenHandler.CreateJwtSecurityToken(
                audience: audienceToken,
                issuer: issuerToken,
                subject: claimsIdentity,
                //Se establece en la fecha y hora actuales en este equipo, expresada como la hora universal coordinada.
                notBefore: DateTime.UtcNow,
                //Tiempo de expiración del token. Ejemplo: 1 minuto.
                expires: DateTime.UtcNow.AddMinutes(Convert.ToInt32(expireTime)),
                signingCredentials: signingCredentials);
            //Guarda el token de forma string, con las opciones que hemos colocado anteriormente
            var jwtTokenString = tokenHandler.WriteToken(jwtSecurityToken);
            //Retorna el token
            return jwtTokenString;
        }
    }
}