using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class AjaxDannyAPI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var option = Request.QueryString["f"];

            switch (option) {
                case "calcularMes":
                    calcularMes();
                    break;

                case "calcularSinLimites":
                    calcularSinLimites();
                    break;


                default:

                    break;
            }


        }

        private void calcularMes()
        {
            var mes = Convert.ToInt32(Request.Params["mes"]);
            var anio = Convert.ToInt32(Request.Params["anio"]);

            var db = new DB();
            var reservas = db.Reserva.ToList();
            var total = 0;

            foreach (var reserva in reservas)
            {
                var pago = reserva.PagoReserva.FirstOrDefault();
                if(pago.FechaPago.Year == anio && pago.FechaPago.Month == mes)
                {
                    total += pago.Pago;
                }
            }

            Dictionary<string, object> envio = new Dictionary<string, object>();
            envio["respuesta"] = "El total es: $" + total;
            var respuesta = JsonConvert.SerializeObject(envio);
            Response.Write(respuesta);
        }

        private void calcularSinLimites()
        {
            var inicio = Request.Params["inicio"];
            var fin = Request.Params["fin"];

            var fechaInicio = Convert.ToDateTime(inicio);
            var fechaFin = Convert.ToDateTime(fin);

            var db = new DB();
            var reservas = db.Reserva.ToList();
            var total = 0;
            foreach (Reserva r in reservas)
            {
                var pago = r.PagoReserva.FirstOrDefault();
                if(pago.FechaPago >= fechaInicio && pago.FechaPago <= fechaFin)
                {
                    total += pago.Pago;
                }
            }

            Dictionary<string, object> envio = new Dictionary<string, object>();
            envio["respuesta"] = "El total es: $" + total;
            var respuesta = JsonConvert.SerializeObject(envio);
            Response.Write(respuesta);
        }
    }
}