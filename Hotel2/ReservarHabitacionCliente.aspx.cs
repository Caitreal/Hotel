using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class Reservar_ : System.Web.UI.Page
    {

        public int Id { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var ok = false;
            var conectado = Session["conectado"] as Usuario;
            Id = Convert.ToInt32(Request.QueryString["id"]); 
            if (conectado != null)
            {
                if (conectado.NombreUsuario == "Cliente")
                {
                    var db = new DB();
                    var cliente = db.Cliente.Find(Id);
                    if ()
                    {

                    }
                }
            }
        }
    }
}