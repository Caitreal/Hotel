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
            var ok = false;
            var conectado = Session["conectado"] as Usuario;

        }
    }
}