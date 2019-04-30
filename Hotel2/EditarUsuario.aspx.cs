using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class EditarUsuario : System.Web.UI.Page
    {
        public int id { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["id"]);
            var okadmin = false;
            var okuser = false;
            var conectado = Session["conectado"] as Usuario;
            if (conectado != null)
            {
                if(conectado.TipoUsuario.Nombre == "ADMINSTRADOR")
                {
                    okadmin = true;
                }
                if(conectado.TipoUsuario.Nombre == "CLIENTE" && conectado.TipoUsuario.Nombre == "RECEPCIONISTA" )
                {
                    okuser = true;
                }
                else
                {
                    Response.Redirect("~/Default");
                }
                

                if (okadmin)
                {
                    if (!IsPostBack)
                    {
                        var db = new DB();
                        var Usuario = db.Usuario.Find(id);
                        var nombre = Usuario.NombreUsuario;
                        var clave = Usuario.Clave;
                        var tipoUsuarioId = Usuario.TipoUsuarioId;
                        var tipoUsuario = db.TipoUsuario.ToList();
                        ddlTipoUsuario.DataSource = tipoUsuario;
                        ddlTipoUsuario.DataValueField = "id";
                        ddlTipoUsuario.DataTextField = "Nombre";
                        ddlTipoUsuario.DataBind();
                        ddlTipoUsuario.Items.Insert(0, new ListItem("-- Seleccione un Tipo Usuario --", "0"));
                        txtNombreU.Text = nombre;
                        txtClave.Text = clave;
                        ddlTipoUsuario.SelectedValue = Convert.ToString(tipoUsuarioId);
                    }
                }
                if(okuser)
                {
                    if (!IsPostBack)
                    {
                        var db = new DB();
                        var Usuario = db.Usuario.Find(id);
                        var nombre = Usuario.NombreUsuario;
                        var clave = Usuario.Clave;
                        var tipoUsuarioId = Usuario.TipoUsuarioId;
                        var tipoUsuario = db.TipoUsuario.ToList();
                        ddlTipoUsuario.DataSource = tipoUsuario;
                        ddlTipoUsuario.DataValueField = "id";
                        ddlTipoUsuario.DataTextField = "Nombre";
                        ddlTipoUsuario.DataBind();
                        ddlTipoUsuario.Items.Insert(0, new ListItem("-- Seleccione un Tipo Usuario --", "0"));
                        ddlTipoUsuario.Enabled = false;

                        txtNombreU.Text = nombre;
                        txtClave.Text = clave;
                        ddlTipoUsuario.SelectedValue = Convert.ToString(tipoUsuarioId);
                    }
                }

            }
        }
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            var nombreU = txtNombreU.Text;
            var clave = txtClave.Text;
            var tipoUsuarioId = Convert.ToInt32(ddlTipoUsuario.SelectedValue);

            var db = new DB();
            var Usuario = db.Usuario.Find(id);
            Usuario.NombreUsuario = nombreU;
            Usuario.Clave = clave;
            Usuario.TipoUsuarioId = tipoUsuarioId;

            db.SaveChanges();
            Response.Redirect("ListadoHabitaciones");

        }
    }
}