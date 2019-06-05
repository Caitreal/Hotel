using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class verGananciasMesAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarListas();

        }

        private void cargarListas()
        {
            var db = new DB();
            List<PagoReserva> pagos = db.PagoReserva.ToList();
            List<int> months = new List<int>();
            List<int> years = new List<int>();

            for (int i = 1; i <= 12; i++)
            {
                months.Add(i);
            }
            foreach(PagoReserva p in pagos)
            {
                Boolean existe = false;
                foreach(int y in years)
                {
                    if(p.FechaPago.Year == y)
                    {
                        existe = true;
                        break;
                    }
                }
                if (!existe)
                {
                    years.Add(p.FechaPago.Year);
                }
            }

            ListMonths.DataSource = months;            
            ListMonths.DataBind();
            ListYears.DataSource = years;            
            ListYears.DataBind();
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
            var db = new DB();
            int year = Convert.ToInt32(ListYears.SelectedValue);
            int month = Convert.ToInt32(ListMonths.SelectedValue);
            List<PagoReserva> pagos = db.PagoReserva.Where(
                p => p.FechaPago.Year == year && p.FechaPago.Month == month)
                .ToList();
            int ganancia = 0;
            foreach (PagoReserva p in pagos)
            {
                ganancia += p.Pago;
            }
            textoCalculo.Text = "Ganancias para mes "+month+" del año "+year+" es de: $" + ganancia;
        }
    }
}