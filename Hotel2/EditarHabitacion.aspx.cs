using Hotel2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel
{
    public partial class EditarHabitacion : System.Web.UI.Page
    {
        public int Id { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Id = Convert.ToInt32(Request.QueryString["id"]);
            var ok = false;
            var conectado = Session["conectado"] as Usuario;
            if (conectado != null)
            {
                if (conectado.TipoUsuario.Nombre == "ADMINISTRADOR")
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
                    if (!IsPostBack)
                    {
                        var db = new DB();
                        var habitacion = db.Habitacion.Find(Id);
                        var descripcion = habitacion.Descripcion;
                        var precio = habitacion.Precio;
                        var tipoHabitacionId = habitacion.TipoHabitacionId;

                        var tiposHabitacion = db.TipoHabitacion.ToList();
                        ddlTipoHabitacion.DataSource = tiposHabitacion;
                        ddlTipoHabitacion.DataValueField = "Id";
                        ddlTipoHabitacion.DataTextField = "Nombre";
                        ddlTipoHabitacion.DataBind();
                        ddlTipoHabitacion.Items.Insert(0, new ListItem("-- Seleccione un Tipo Habitación --", "0"));

                        txtDescripcion.Text = descripcion;
                        txtPrecio.Text = Convert.ToString(precio);
                        ddlTipoHabitacion.SelectedValue = Convert.ToString(tipoHabitacionId);
                    }
                }
            }
        }

            protected void btnAceptar_Click(object sender, EventArgs e)
            {
                var descripcion = txtDescripcion.Text;
                var precio = Convert.ToInt32(txtPrecio.Text);
                var tipoHabitacionId = Convert.ToInt32(ddlTipoHabitacion.SelectedValue);

                var db = new DB();
                var habitacion = db.Habitacion.Find(Id);
                habitacion.Descripcion = descripcion;
                habitacion.Precio = precio;
                habitacion.TipoHabitacionId = tipoHabitacionId;

                db.SaveChanges();

                Response.Redirect("ListadoHabitaciones");

            }
        }
    }