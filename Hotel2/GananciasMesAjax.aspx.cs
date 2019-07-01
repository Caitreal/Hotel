using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class GananciasMesAjax : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            llenarList();

        }

        private void llenarList()
        {
            List<int> meses = new List<int>();
            List<int> anios = new List<int>();

            for (int i = 1; i <= 12; i++)
            {
                meses.Add(i);
            }

            for (int i = 2000; i <= 2019; i++)
            {
                anios.Add(i);
            }
            ListAnios.DataSource = anios;
            ListAnios.DataBind();
            ListMeses.DataSource = meses;
            ListMeses.DataBind();
        }
    }
}