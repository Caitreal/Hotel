using Hotel2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel
{
    public partial class ListadoHabitaciones : System.Web.UI.Page
    {
        public Boolean ok { get; set; }
        public List<Habitacion> Habitaciones { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("CONSOLA DE TEXTO");

            var ok = false;

            var conectado = Session["conectado"] as Usuario;
            if(conectado == null)
            {
                Response.Redirect("Default");
            }
            else
            {
                var db = new DB();
                Habitaciones = db.Habitacion.ToList();
                if(conectado.TipoUsuario.Nombre == "ADMINISTRADOR")
                {
                    ok = true;
                }
                if (!ok)
                {
                    Response.Redirect("~/Default");
                }
            }
        }

        protected void btnEditarHabitacion_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditarHabitacion");
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            Response.Redirect("CrearHabitacion");
        }
    }
}