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
        public int Id { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            ImagenHab.ImageUrl= "imagenes/1.jpg";

        
        }
    }
}