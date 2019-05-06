using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class ListadoHabitacionesCliente : System.Web.UI.Page
    {
        public Boolean ok { get; set; }
        public List<Habitacion> Habitaciones { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var db = new DB();
            Habitaciones = db.Habitacion.ToList();
            System.Diagnostics.Debug.WriteLine("CONSOLA DE TEXTO");

            var ok = false;

            var conectado = Session["conectado"] as Usuario;

            if (conectado == null)
            {
                Response.Redirect("Default");
            }
            else
            {
                if (conectado.TipoUsuario.Nombre == "CLIENTE")
                {
                    ok = true;
                }
                else
                {
                    Response.Redirect("~/Default");
                }
            }
        }
    }
}