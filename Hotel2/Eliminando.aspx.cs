using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class Eliminando : System.Web.UI.Page
    {
        public int Id { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var ok = false;
            var conectado = Session["conectado"] as Usuario;

            if (conectado != null)
            {
                if (conectado.TipoUsuario.Nombre == "RECEPCIONISTA")
                {
                    ok = true;
                }
            }
            if (!ok)
            {
                Response.Redirect("~/Default");
            }
            else
            {
                if (!IsPostBack)
                {
                    Id = Convert.ToInt32(Request.QueryString["id"]);
                    var db = new DB();
                    var reservaCliente = db.Reserva.Find(Id);
                    var fechaReserva = reservaCliente.FechaInicio;
                    var fechaRestada = fechaReserva.AddDays(-2);
                    var fechaHoy = DateTime.Now;
                    if (fechaHoy <= fechaRestada)
                    {
                        db.Reserva.Remove(reservaCliente);
                        db.SaveChanges();
                        Response.Redirect("EliminarReservaRecepcionista");
                    }
                    if(fechaHoy >= fechaRestada)
                    {
                        lblTexto.Text = "La reserva ya fue realizada o se encuentra fuera del plazo estipulado";
                    }
                }
            }
        }
    }
}