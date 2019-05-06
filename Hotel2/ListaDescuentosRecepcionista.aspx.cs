using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class ListaDescuentosRecepcionista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            comprobarSesion();
            var db = new DB();
            List<TipoCliente> ListaTipTipoCliente = db.TipoCliente.ToList();

            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("Nombre", typeof(string)));
            dt.Columns.Add(new DataColumn("Descuento", typeof(Int32)));

            foreach(TipoCliente tp in ListaTipTipoCliente)
            {
                DataRow dr = dt.NewRow();
                dr[0] = tp.Nombre;
                dr[1] = tp.Descuento;            

                dt.Rows.Add(dr);
            }

            DataView dv = new DataView(dt);
            ListaDescuentos.DataSource = dv;
            ListaDescuentos.DataBind();
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