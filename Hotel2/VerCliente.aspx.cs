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
        public int Id { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var ok = false;
            var usuario = Session["conectado"] as Usuario;
            if (usuario != null)
            {
                if (usuario.TipoUsuario.Nombre == "CLIENTE")
                {
                    ok = true;
                }
            }
            if (!ok)
            {
                Response.Redirect("~/Default");
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            var db = new DB();
            if (txtRut.Text != "")
            {
                Id = Convert.ToInt32(Request.QueryString["id"]);
                var Usuario = db.Usuario.Find(Id);
                lblNombre.Text = Usuario.NombreUsuario;
                txtTipo.Text = Usuario.TipoUsuario.Nombre;
                var cliente = new Cliente();
                cliente.Rut = txtRut.Text;
                cliente.UsuarioId = Id;
                cliente.TipoClienteId = 1;
                db.SaveChanges();
            }
            else
            {
                lblError.Text = "Campo Vacío";
            }
            
        }
    }
}