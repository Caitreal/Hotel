using Hotel2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel
{
    public partial class CrearHabitacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var ok = false;
            var conectado = Session["conectado"] as Usuario;
            if (conectado != null)
            {
                if(conectado.TipoUsuario.Nombre == "ADMINISTRADOR")
                {
                    ok = true;
                }
            }
            if (!ok)
            {
                Response.Redirect("~/Default");
            }
            else
            {
                if (!IsPostBack)
                {
                    LlenarTiposHabitacion();
                }
            }
        }

        private void LlenarTiposHabitacion()
        {
            var db = new DB();
            var tiposHabitacion = db.TipoHabitacion.ToList();
            ddlTipoHabitacion.DataSource = tiposHabitacion;
            ddlTipoHabitacion.DataValueField = "Id";
            ddlTipoHabitacion.DataTextField = "Nombre";
            ddlTipoHabitacion.DataBind();
            ddlTipoHabitacion.Items.Insert(0, new ListItem("-- Seleccione un Tipo Habitación --","0"));
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            var descripcion = txtDescripcion.Text;
            var precio = Convert.ToInt32(txtPrecio.Text);
            var tipo = Convert.ToInt32(ddlTipoHabitacion.SelectedValue);

            var db = new DB();
            if(descripcion != "" && precio > 0 && tipo > 0)
            {
                var nuevaHabitacion = new Habitacion();
                nuevaHabitacion.Descripcion = descripcion;
                nuevaHabitacion.Precio = precio;
                nuevaHabitacion.TipoHabitacionId = tipo;
                db.Habitacion.Add(nuevaHabitacion);
                db.SaveChanges();
                Response.Redirect("ListadoHabitaciones");
            }
            else
            {
                lblMensaje.Text = "ERROR: por favor rellena todos los campos.";
            }
        }
    }
}