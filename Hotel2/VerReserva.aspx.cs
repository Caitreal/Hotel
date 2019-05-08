using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class VerReserva : System.Web.UI.Page
    {
        public List<Reserva> reserva { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var ok = false;
            var conectado = Session["conectado"] as Usuario;
            var cliente = Session["conectado"] as Cliente;
            var db = new DB();

            if (conectado != null)
            {
                if(conectado.TipoUsuario.Nombre == "CLIENTE")
                {
                    ok = true;
                    reserva = db.Reserva.ToList();
                    if (cliente != null)
                    {
                                            }
                }
            }
        }
    }
}