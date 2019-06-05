using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class cambiar : System.Web.UI.Page
    {
        private int Id;
        protected void Page_Load(object sender, EventArgs e)
        {
            comprobarSesion();
            var db = new DB();
            this.Id = Convert.ToInt32(Request.QueryString["id"]);
            TipoCliente tp = db.TipoCliente.Find(this.Id);
           if(!IsPostBack)
            {
            txtNombre.Text = tp.Nombre.ToString();
            txtDescuento.Text = tp.Descuento.ToString();
            }
        }

        protected void Guardar_Click(object sender, EventArgs e)
        {            
            var db = new DB();
            TipoCliente tp = db.TipoCliente.Find(this.Id);
            tp.Nombre = txtNombre.Text;
            tp.Descuento = Convert.ToInt32(txtDescuento.Text);
            db.SaveChanges();
            Response.Redirect("cambiarDescuento.aspx");
        }
        private void comprobarSesion()
        {
            Usuario user = Session["conectado"] as Usuario;
            if (user != null)
            {
                if (!user.TipoUsuario.Nombre.Equals("ADMINISTRADOR"))
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