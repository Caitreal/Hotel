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
                    ddlValoracion.Items.Add(new ListItem(" * ","1"));
                    ddlValoracion.Items.Add(new ListItem(" * * ", "2"));
                    ddlValoracion.Items.Add(new ListItem(" * * * ", "3"));
                    ddlValoracion.Items.Add(new ListItem(" * * * * ", "4"));
                    ddlValoracion.Items.Add(new ListItem(" * * * * * ", "5"));
                }
            }

            try
            {
                var reservaId = Convert.ToInt32(Request.QueryString["id"]);
                var db = new DB();
                var reserva = db.Reserva.Find(reservaId);
                if(reserva == null)
                {
                    Response.Redirect("~/Default");
                }
            }
            catch(Exception ex)
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
                                calificacion = new Calificacion();
                                calificacion.ClienteId = clienteIdConectado;
                                calificacion.HabitacionId = habitacionId;
                                calificacion.Valoracion = Convert.ToInt32(ddlValoracion.SelectedValue);
                                db.Calificacion.Add(calificacion);
                                db.SaveChanges();
                                lblMensaje.Text = "HABITACIÓN CALIFICADA CORRECTAMENTE";
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