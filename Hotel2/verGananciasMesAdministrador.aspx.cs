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
          //  comprobarSesion();
            cargarDropList();
        }

        private void cargarDropList()
        {
            var db = new DB();
            List<PagoReserva> pago = db.PagoReserva.ToList();
            List<int> years = new List<int>();
            List<int> months = new List<int>();
            foreach(PagoReserva p in pago)
            {
                Boolean existe = false;
                foreach(int year in years)
                {
                    if(p.FechaPago.Year == year)
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
            for (int i = 1; i <= 12; i++)
            {
                months.Add(i);
            }

            ListYear.DataSource = years;
          //  ListYear.DataTextField = "";
          //  ListYear.DataValueField = "";
            ListYear.DataBind();

            ListMonth.DataSource = months;
          //  ListMonth.DataTextField = "";
          //  ListMonth.DataValueField = "";
            ListMonth.DataBind();

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

        protected void calcular_Click(object sender, EventArgs e)
        {
            var db = new DB();
            int year = Convert.ToInt32(ListYear.SelectedValue);
            int month = Convert.ToInt32(ListMonth.SelectedValue);
            int ingreso = 0;
            List<PagoReserva> filtradasYear = db.PagoReserva.Where(p => p.FechaPago.Year == year).ToList();
            foreach(PagoReserva f in filtradasYear)
            {
                if(f.FechaPago.Month == month)
                {
                    ingreso += f.Pago;
                }
            }
            txtIngreso.Text = "El ingreso para dicho mes es de $" + Convert.ToString(ingreso) + ListMonth.SelectedValue;
        }
    }
}