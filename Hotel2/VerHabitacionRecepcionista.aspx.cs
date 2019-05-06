using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class VerHabitacionRecepcionista : System.Web.UI.Page
    {
        public string Id { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            Id =Convert.ToString(Request.QueryString["Id"]);
            ImagenHab.ImageUrl= "~/imagenes/"+Id+".jpg";        
        }
    }
}