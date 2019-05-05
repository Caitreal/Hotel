using Hotel2;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel
{
    public partial class VerHabitacion : System.Web.UI.Page
    {
        public List<Habitacion> habitaciones { get; set; }
        public int Id { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var ok = false;
            var conectado = Session["conectado"] as Usuario;
            if (conectado != null)
            {
                var db = new DB();
                Id = Convert.ToInt32(Request.QueryString["id"]);
                imgHabitacion.ImageUrl = "~/imagenes/"+Id+".jpg";
                var habitacion = db.Habitacion.Find(Id);
                txtNombre.Text = habitacion.Descripcion;
                txtPrecio.Text = Convert.ToString(habitacion.Precio);
                txtTipo.Text = habitacion.TipoHabitacion.Nombre;
            }
            else
            {
                Response.Redirect("~/Default");
            }
        }
    }
}