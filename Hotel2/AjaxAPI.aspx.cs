using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel
{
    public partial class AjaxAPI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var funcion = Request.QueryString["f"];
            if(funcion == "listado_habitaciones")
            {
                listadoHabitaciones();
            }
            if (funcion == "eliminar_habitacion")
            {
                eliminarHabitacion();
            }
        }

        private void listadoHabitaciones()
        {
            var db = new DB();
            var habitaciones = db.Habitacion.ToList();
            var mensaje = "ERROR";
            db.Configuration.LazyLoadingEnabled = false;
            Dictionary<string, object> envio = new Dictionary<string, object>();
            if (habitaciones.Count > 0)
            {
                envio["habitaciones"] = habitaciones;
                mensaje = JsonConvert.SerializeObject(envio);
            }
            else
            {
                mensaje = JsonConvert.SerializeObject("NO HAY REGISTROS");
            }

            Response.Write(mensaje);
        }

        private void eliminarHabitacion()
        {
            var db = new DB();
            var habitacionId = Request.Params["habitacion_id"];

            var mensaje = "";
            int eliminados = 0;
            try
            {
                var habitacion = db.Habitacion.Find(Convert.ToInt32(habitacionId));
                db.Habitacion.Remove(habitacion);
                eliminados = db.SaveChanges();
            }
            catch (Exception ex)
            {
            }
            
            if(eliminados == 0)
            {
                mensaje = "ERROR, NO SE PUDO ELIMINAR EL REGISTRO.";
            }
            else
            {
                mensaje = "OK";
            }

            Dictionary<string, object> envio = new Dictionary<string, object>();
            envio["mensaje"] = mensaje;
            var respuesta = JsonConvert.SerializeObject(envio);
            Response.Write(respuesta);
        }
    }
}