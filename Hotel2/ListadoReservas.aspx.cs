using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class ListadoReservas : System.Web.UI.Page
    {
        public List <Reserva> reservas { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var db = new DB();
         
            var ok = false;

            var conectado = Session["conectado"] as Usuario;
           
            if (conectado != null)
            {
                if (conectado.TipoUsuario.Nombre == "CLIENTE")
                {
                    ok = true;
                    var idCliente = conectado.Id;
                    reservas = db.Reserva.Where(r => r.UsuarioId == idCliente).ToList();
                }
                else
                {
                    Response.Redirect("Salir");
                }
            }
            else
            {
                Response.Redirect("Default");
            }
        }
    }
}