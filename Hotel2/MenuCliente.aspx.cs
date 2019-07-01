using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class MenuCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var ok = false;
            var conectado = Session["conectado"] as Usuario;
            
            if(conectado != null)
            {
                if(conectado.TipoUsuario.Nombre == "CLIENTE")
                {
                    ok = true;

                }
                else
                {
                    Response.Redirect("Salir");
                }
            }
            else
            {
                Response.Redirect("~/Default");
            }

        }

        protected void btnListado_Click(object sender, EventArgs e)
        {
            Response.Redirect("AJAX/ListadoHabitacionesCliente");
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Salir");
        }

        protected void btnReservas_Click(object sender, EventArgs e)
        {
            Response.Redirect("AJAX/ListadoReservaCliente.aspx");
        }

    }
}