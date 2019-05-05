using Hotel2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel
{
    public partial class VerHabitacion : System.Web.UI.Page
    {
        public int Id { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var db = new DB();
            Id = Convert.ToInt32(Request.QueryString["id"]);
            imgHabitacion.ImageUrl = "~/Habitaciones/"+Id+".jpg";
            var habitacion = db.Habitacion.Find(Id);
            txtNombre.Text = habitacion.Descripcion;
            txtPrecio.Text = Convert.ToString(habitacion.Precio);
            txtTipo.Text = habitacion.TipoHabitacion.Nombre;

        }
    }
}