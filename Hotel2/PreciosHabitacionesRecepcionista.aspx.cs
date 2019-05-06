using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class PreciosHabitacionesRecepcionista : System.Web.UI.Page
    {     
        public List<TipoHabitacion> TipoHabitaciones { get; set; }
        public List<Habitacion> ListaHab { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            comprobarSesion();
            LlenarDropList();
            ListaHab = new DB().Habitacion.ToList();    
        }

        private void LlenarDropList()
        {
            var db = new DB();
            TipoHabitaciones = db.TipoHabitacion.ToList();
            DropListTipoHabitacion.DataSource = TipoHabitaciones;
            DropListTipoHabitacion.DataTextField = "Nombre";
            DropListTipoHabitacion.DataValueField = "Id";
            DropListTipoHabitacion.DataBind();
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