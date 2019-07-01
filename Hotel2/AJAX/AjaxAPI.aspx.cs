using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class AjaxAPI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var funcion = Request.QueryString["f"];
            if(funcion == "listado_habitaciones")
            {
                listadoHabitacionesAdministrador();
            }
            if (funcion == "listado_habitaciones_cliente")
            {
                listarHabitacionCliente();
            }
            if (funcion == "listado_habitaciones_recepcionista")
            {
                listarHabitacionRecepcionista();
            }
            if (funcion == "eliminar_habitacion")
            {
                eliminarHabitacionAdministrador();
            }if(funcion == "eliminar_reserva_recepcionista")
            {
                eliminarReservaRecepcionista();
            }if(funcion == "listado_reserva_recepcionista")
            {
                listarReservas();
            }
            if (funcion == "listado_reserva_cliente")
            {
                listarReservasCliente();
            }if(funcion == "eliminar_reserva_recepcionista")
            {
                eliminarReservaRecepcionista();
            }
            if (funcion == "eliminar_reserva_cliente")
            {
                eliminarReservaCliente();
            }
            if (funcion == "evaluar_habitacion")
            {
                evaluarHabitacion();
            }
        }

        private void listadoHabitacionesAdministrador()
        {
            var db = new DB();
            var habitaciones = db.Habitacion.ToList();
            var tipoHabitacion = db.TipoHabitacion.ToList();
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
        
        private void listarHabitacionCliente()
        {
            var db = new DB();
            db.Configuration.LazyLoadingEnabled = false;
            var habitaciones = db.Habitacion.ToList();
            var tipoHabitacion = db.TipoHabitacion.ToList();

            var mensaje = "Error";
            
            Dictionary<string, object> envio = new Dictionary<string, object>();

            if (habitaciones.Count > 0)
            {
                envio["habitaciones"] = habitaciones;
                envio["tipos_habitaciones"] = tipoHabitacion;
                mensaje = JsonConvert.SerializeObject(envio, Formatting.None, new JsonSerializerSettings { ReferenceLoopHandling = ReferenceLoopHandling.Ignore });
            }
            else
            {
                mensaje = JsonConvert.SerializeObject("NO HAY REGISTROS");
            }

            Response.Write(mensaje);
        }

        private void listarHabitacionRecepcionista()
        {
            var db = new DB();
            db.Configuration.LazyLoadingEnabled = false;
            var habitaciones = db.Habitacion.ToList();
            var tipoHabitacion = db.TipoHabitacion.ToList();

            var mensaje = "";

            Dictionary<string, object> envio = new Dictionary<string, object>();

            if(habitaciones.Count > 0)
            {
                envio["habitaciones"] = habitaciones;
                envio["tipos_habitaciones"] = tipoHabitacion;
                mensaje = JsonConvert.SerializeObject(envio, Formatting.None, new JsonSerializerSettings { ReferenceLoopHandling = ReferenceLoopHandling.Ignore });
            }
            else
            {
                mensaje = JsonConvert.SerializeObject("No se encontraron registro");
            }

            Response.Write(mensaje);
        }
        private void eliminarHabitacionAdministrador()
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

            if (eliminados == 0)
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

        private void eliminarReservaRecepcionista()
        {
            var db = new DB();
            var reservaId = Request.Params["reserva_id"];

            var mensaje = "";
            int eliminados = 0;
            try
            {
                var reservaEncontrada = db.Reserva.Find(Convert.ToInt32(reservaId));
                db.Reserva.Remove(reservaEncontrada);
                eliminados = db.SaveChanges();
            }
            catch (Exception)
            {

            }
            if (eliminados == 0)
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

        private void eliminarReservaCliente()
        {
            var db = new DB();
            var reservaId = Request.Params["reserva_id"];

            var mensaje = "";
            int eliminados = 0;
            try
            {
                var reservaEncontrada = db.Reserva.Find(Convert.ToInt32(reservaId));
                db.Reserva.Remove(reservaEncontrada);
                eliminados = db.SaveChanges();
            }
            catch (Exception)
            {

            }
            if (eliminados == 0)
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

        private void listarReservas()
        {
            var db = new DB();
            db.Configuration.LazyLoadingEnabled = false;
            var reservas = db.Reserva.ToList();
            var cliente = db.TipoHabitacion.ToList();
            var usuario = db.Usuario.ToList();
            var habitacion = db.Habitacion.ToList();
            var mensaje = "";

            Dictionary<string, object> envio = new Dictionary<string, object>();

            if (reservas.Count > 0)
            {
                envio["reservas"] = reservas;
                envio["cliente"] = cliente;
                envio["usuario"] = usuario;
                envio["habitacion"] = habitacion;
                mensaje = JsonConvert.SerializeObject(envio, Formatting.None, new JsonSerializerSettings { ReferenceLoopHandling = ReferenceLoopHandling.Ignore });
            }
            else
            {
                mensaje = JsonConvert.SerializeObject("No se encontraron registro");
            }

            Response.Write(mensaje);

        }
        private void listarReservasCliente()
        {
            var db = new DB();
            db.Configuration.LazyLoadingEnabled = false;
            var conectado = Session["conectado"] as Cliente;
            var clienteConectadoId = conectado.Id;
            var reservasCliente = db.Reserva.Where(r => r.UsuarioId == clienteConectadoId).ToList();
            var tipoHabitacion = db.TipoHabitacion.ToList();
            var habitacion = db.Habitacion.ToList();
            var mensaje = "";

            Dictionary<string, object> envio = new Dictionary<string, object>();

            if (reservasCliente.Count > 0)
            {
                envio["reservas"] = reservasCliente;
                envio["tipo"] = tipoHabitacion;
                envio["habitacion"] = habitacion;
                mensaje = JsonConvert.SerializeObject(envio, Formatting.None, new JsonSerializerSettings { ReferenceLoopHandling = ReferenceLoopHandling.Ignore });
            }
            else
            {
                mensaje = JsonConvert.SerializeObject("No se encontraron registro");
            }

            Response.Write(mensaje);

        }
        private void evaluarHabitacion()
        {
            var db = new DB();
            var cliente = Session["conectado"] as Cliente;
            var mensaje = "";

            db.Configuration.LazyLoadingEnabled = false;
            var valorar = 0;

            var reservaId = Convert.ToInt32(Request.QueryString["reserva_id"]);
            var reserva = db.Reserva.Find(reservaId);
            var habitacionId = reserva.HabitacionId;
            var noches = Convert.ToDouble(reserva.NumeroNoches);
            var fechaFin = reserva.FechaInicio.AddDays(noches);
            var fechaCalificar = fechaFin.AddDays(3);
            var fechaHoy = DateTime.Today;

            Dictionary<string, object> envio = new Dictionary<string, object>();

            if (fechaHoy >= fechaCalificar)
            {
                var calificacion = db.Calificacion.Where(c => c.ClienteId == cliente.Id && c.HabitacionId == habitacionId);

                if (calificacion != null)
                {
                    mensaje = JsonConvert.SerializeObject(envio, Formatting.None, new JsonSerializerSettings { ReferenceLoopHandling = ReferenceLoopHandling.Ignore });
                }

            }

        }
    }

}