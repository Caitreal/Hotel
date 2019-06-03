using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class ListadoReservas : System.Web.UI.Page
    {
        public List <Reserva> Reservas { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var db = new DB();
            Reservas = db.Reserva.ToList();

            var ok = false;

            var conectado = Session["conectado"] as Usuario;
            if (conectado != null)
            {
                if (conectado.TipoUsuario.Nombre == "CLIENTE")
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
                Response.Redirect("Default");
            }
        }
    }
}