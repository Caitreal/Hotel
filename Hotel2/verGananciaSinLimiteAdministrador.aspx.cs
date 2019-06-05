using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class verGananciaSinLimiteAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void Calcular_Click(object sender, EventArgs e)
        {
            int ganancias = 0;
            textoCalculo.Text = "";
            if (comprobarRango())
            {
                DateTime inicio = Calendar1.SelectedDate;
                DateTime fin = Calendar2.SelectedDate;
                var db = new DB();
                List<PagoReserva> pagos = db.PagoReserva.Where(p => p.FechaPago >= inicio && p.FechaPago <= fin).ToList();               
                foreach (PagoReserva p in pagos)
                {
                    ganancias += p.Pago;
                }
                textoCalculo.Text = "Las ganancias para tal rango son de: $" + ganancias;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Porfavor revisa el rango de fechas')", true);
            }
        }

        private Boolean comprobarRango()
        {
            Boolean correcto = false;
            DateTime inicio = Calendar1.SelectedDate;
            DateTime fin = Calendar2.SelectedDate;
            if(inicio != null && fin != null)
            {
                if(inicio < fin)
                {
                    correcto = true;
                }
            }
            return correcto;
        }

    }
}