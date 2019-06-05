using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class cambiarDescuento : System.Web.UI.Page
    {
        public List<TipoCliente> Lista { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            comprobarSesion();
            var db = new DB();
            this.Lista = db.TipoCliente.ToList();
        }
        private void comprobarSesion()
        {
            Usuario user = Session["conectado"] as Usuario;
            if (user != null)
            {
                if (!user.TipoUsuario.Nombre.Equals("ADMINISTRADOR"))
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}