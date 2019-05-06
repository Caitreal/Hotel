using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class ReservarHabitacionRecepcionista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            comprobarSesion();
            LlenarDropListHabitacion();
            LlenarDropListCliente();
        }
        private void LlenarDropListHabitacion()
        {
            var db = new DB();
            List<Habitacion> habitaciones = db.Habitacion.ToList();
            List<Reserva> reservas = db.Reserva.ToList();
            List<Habitacion> habitacionesFiltradas = new List<Habitacion>();

            foreach (Habitacion hb in habitaciones)
            {
                var ocupada = false;
                foreach (Reserva rs in reservas)
                {
                    if (hb.Id == rs.Habitacion.Id)
                    {
                        ocupada = true;
                    }
                }

                if (!ocupada)
                {
                    habitacionesFiltradas.Add(hb);
                }
            }
            DropListHabitacion.DataSource = habitacionesFiltradas;
            DropListHabitacion.DataTextField = "Id";
            DropListHabitacion.DataValueField = "Id";
            DropListHabitacion.DataBind();
        }
        private void LlenarDropListCliente()
        {
            var db = new DB();
            List<Usuario> clientes = new List<Usuario>();
            List<Usuario> usuarios = db.Usuario.ToList();

            foreach (Usuario us in usuarios)
            {
                if (us.TipoUsuario.Nombre.Equals("CLIENTE"))
                {
                    clientes.Add(us);
                }
            }

            DropListCliente.DataSource = clientes;
            DropListCliente.DataTextField = "NombreUsuario";
            DropListCliente.DataValueField = "Id";
            DropListCliente.DataBind();

        }

        protected void btnReservar_Click(object sender, EventArgs e)
        {

            var db = new DB();
            int idUsuario = Convert.ToInt32(DropListCliente.SelectedValue);
            List<Cliente> clientes = db.Cliente.ToList();
            Cliente cliente = null;
            foreach (Cliente cl in clientes)
            {
                if (cl.UsuarioId == idUsuario)
                {
                    cliente = cl;
                }
            }
            Reserva reserva = new Reserva();
            reserva.Cliente = cliente;
            reserva.HabitacionId = Convert.ToInt32(DropListHabitacion.SelectedValue);
            // Response.Write("<script>alert('Habitacion: "+ DropListHabitacion.SelectedValue + "')</script>");

            db.Reserva.Add(reserva);
            db.SaveChanges();
            Response.Redirect("MenuRecepcionista.aspx");
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