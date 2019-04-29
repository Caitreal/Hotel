using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class EditarUsuario : System.Web.UI.Page
    {
        public int id { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["id"]);
            var okadmin = false;
            var okuser = false;
            var conectado = Session["conectado"] as Usuario;
            if (conectado != null)
            {
                if(conectado.TipoUsuario.Nombre == "ADMINSTRADOR")
                {
                    okadmin = true;
                }
                if(conectado.TipoUsuario.Nombre == "CLIENTE" && conectado.TipoUsuario.Nombre == "RECEPCIONISTA" )
                {
                    okuser = true;
                }
                if (!IsPostBack)
                {

                }

            }
        }
    }
}