using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class LoginAPI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var nombreUsuario = Request.Params["nombre_usuario"];
            var clave = Request.Params["clave"];

            var respuesta = "";
            var db = new DB();
            db.Configuration.LazyLoadingEnabled = false;
            var usuario = db.Usuario.Where(u => u.NombreUsuario == nombreUsuario && u.Clave == clave).FirstOrDefault();
            if (usuario != null)
            {
                respuesta = JsonConvert.SerializeObject(usuario);
            }
            else
            {
                respuesta = JsonConvert.SerializeObject("ERROR");
            }
            Response.Write(respuesta);
        }
    }
}