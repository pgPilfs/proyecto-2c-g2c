using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiGCPIL.Models.Response
{
    public class Respuesta
    {
        // Respuestas que le retornará al usuario
        public int Exito { get; set; }
        public string Mensaje { get; set; }
        public object Data { get; set; }

        // Respuesta de éxito inicializada en cero
        public Respuesta()
        {
            this.Exito = 0;
        }

        /// <summary>
        /// 2do constructor: Crea un objeto de respuesta e inicializa el atributo Mensaje, con un string determinado.
        /// </summary>
        /// <param name="msg"></param>
        public Respuesta(String msg)
        {
            this.Exito = 0;
            this.Mensaje = msg;
        }
        
    }
}