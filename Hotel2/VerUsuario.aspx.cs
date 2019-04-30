using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class VerUsuario : System.Web.UI.Page
    {
        public Boolean ok { get; set; }
        public int id { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["id"]);
            var ok = false;
            var conectado = Session["conectado"] as Usuario;

            if (conectado != null)
            {
                if(conectado.TipoUsuario.Nombre == "ADMINISTRADOR" || conectado.TipoUsuario.Nombre == "CLIENTE" || conectado.TipoUsuario.Nombre == "RECEPCIONISTA" )
                {
                    ok = true;
                }
            }
            if (!ok)
            {
                Response.Redirect("~/Default");
            }

            var db = new DB();
            var Usuario = db.Usuario.Find(id);
            var nombre = Usuario.NombreUsuario;
            var tipoUsuarioId = Usuario.TipoUsuarioId;

            var tipoUsuario = db.Usuario.ToList();
            ddlUsuarioTipo.DataSource = tipoUsuario;
            ddlUsuarioTipo.DataValueField = "Id";
            ddlUsuarioTipo.DataTextField = "Nombre";
            ddlUsuarioTipo.DataBind();

            lblNombre.Text = nombre;
            ddlUsuarioTipo.SelectedValue = Convert.ToString(tipoUsuarioId);
        }

        protected void btnEditarUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EditarUsuario");
        }
    }
}