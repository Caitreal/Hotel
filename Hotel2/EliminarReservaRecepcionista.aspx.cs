using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class EliminarReservaRecepcionista : System.Web.UI.Page
    {
        public List <Habitacion> Habitaciones { get; set; }
        public List <Reserva> Reservas { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            comprobarSesion();
            var db = new DB();
            Habitaciones = db.Habitacion.ToList();
            Reservas = db.Reserva.ToList();

        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {
            
        }

        private void comprobarSesion()
        {
            Usuario user = Session["conectado"] as Usuario;
            if (user != null)
            {
                if (!user.TipoUsuario.Nombre.Equals("RECEPCIONISTA"))
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void EliminarReserva_Click(object sender, EventArgs e)
        {

        }
    }
}