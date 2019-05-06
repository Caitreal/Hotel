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
        protected void Page_Load(object sender, EventArgs e)
        {
            comprobarSesion();
            var db = new DB();
            List<Reserva> reservas = db.Reserva.ToList();
            List<Habitacion> habitaciones = new List<Habitacion>();

            foreach (Reserva rs in reservas)
            {
                habitaciones.Add(rs.Habitacion);
            }


            DropListHabitacion.DataSource = habitaciones;
            DropListHabitacion.DataTextField = "Id";
            DropListHabitacion.DataValueField = "Id";
            DropListHabitacion.DataBind();
        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {
            var db = new DB();
            List<Reserva> reservas = db.Reserva.ToList();
            Reserva eliminar = new Reserva();
            int idHabitacion = Convert.ToInt32(DropListHabitacion.SelectedValue);

            foreach (Reserva rs in reservas)
            {
                if (rs.HabitacionId == idHabitacion)
                {
                    db.Reserva.Remove(rs);
                    db.SaveChanges();
                    Response.Redirect("MenuRecepcionista.aspx");
                }
            }
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
    }
}