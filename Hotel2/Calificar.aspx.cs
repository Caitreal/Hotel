using Hotel2;
using System;
using System.Linq;
using System.Threading;
using System.Web.UI.WebControls;

namespace Hotel
{
    public partial class Calificar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var ok = false;
            var conectado = Session["conectado"] as Usuario;
            if (conectado != null)
            {
                if (conectado.TipoUsuario.Nombre == "CLIENTE")
                {
                    ok = true;
                    var db = new DB();
                    var reservaId = Convert.ToInt32(Request.QueryString["id"]); 
                    var reserva = db.Reserva.Find(reservaId);
                    var clienteIdConectado = conectado.Cliente.FirstOrDefault().Id;
                    var habitacionId = reserva.HabitacionId;
                    if (reserva != null)
                    {
                        var calificacion = db.Calificacion.Where(c => c.ClienteId == clienteIdConectado && c.HabitacionId == habitacionId).FirstOrDefault();
                        if (calificacion != null)
                        {
                            lblMensaje.Text = "Usted ya ha evaluado anteriormente con " + calificacion.Valoracion + " y solo puedes valorar una vez ";
                        }
                    }
                }
            }
            if (!ok)
            {
                Response.Redirect("~/Default");
            }
            try
            {
                var reservaId = Convert.ToInt32(Request.QueryString["id"]);
                var db = new DB();
                var reserva = db.Reserva.Find(reservaId);
                if (reserva == null)
                {
                    Response.Redirect("~/Default");
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Default");
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                lblMensaje.Text = "";
                var reservaId = Convert.ToInt32(Request.QueryString["id"]);
                var db = new DB();
                var reserva = db.Reserva.Find(reservaId);
                if (reserva == null)
                {
                    Response.Redirect("~/Default");
                }
                else
                {
                    var conectado = Session["conectado"] as Usuario;
                    var clienteIdReserva = reserva.ClienteId;
                    var cliente = conectado.Cliente.FirstOrDefault();
                    var clienteIdConectado = cliente.Id;
                    if (clienteIdReserva != clienteIdConectado)
                    {
                        Response.Redirect("~/Default");
                    }
                    else
                    {
                        var habitacionId = reserva.HabitacionId;
                        var noches = Convert.ToDouble(reserva.NumeroNoches);
                        var fechaFinReserva = reserva.FechaInicio.AddDays(noches);
                        var fechaCalificacion = fechaFinReserva.AddDays(3);
                        var fechaHoy = DateTime.Today;
                        if (fechaHoy >= fechaCalificacion)
                        {
                            var calificacion = db.Calificacion.Where(c => c.ClienteId == clienteIdConectado && c.HabitacionId == habitacionId).FirstOrDefault();
                            if (calificacion != null)
                            {
                                lblMensaje.Text = "SOLAMENTE PUEDE CALIFICAR UNA VEZ LA HABITACIÓN.";
                            }
                            else
                            {
                                if(califica.CurrentRating != 0)
                                {
                                    calificacion = new Calificacion();
                                    calificacion.ClienteId = clienteIdConectado;
                                    calificacion.HabitacionId = habitacionId;
                                    calificacion.Valoracion = califica.CurrentRating;
                                    db.Calificacion.Add(calificacion);
                                    db.SaveChanges();
                                    lblMensaje.Text = "HABITACIÓN CALIFICADA CORRECTAMENTE";
                                }
                                else
                                {
                                    lblMensaje.Text = "NO HAS CALIFICADO";
                                }   
                            }
                        }
                        else
                        {
                            lblMensaje.Text = "SOLAMENTE PUEDE CALIFICAR PASADOS 3 DÍAS DE FINALIZADA LA RESERVA";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Default");
            }
        }
    }
}