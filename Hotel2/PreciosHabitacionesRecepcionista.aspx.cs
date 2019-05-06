using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class PreciosHabitacionesRecepcionista : System.Web.UI.Page
    {     
        public List<TipoHabitacion> TipoHabitaciones { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            comprobarSesion();
            LlenarDropList();
            TipoSeleccionado();
        }

        private void LlenarDropList()
        {
            var db = new DB();
            TipoHabitaciones = db.TipoHabitacion.ToList();
            DropListTipoHabitacion.DataSource = TipoHabitaciones;
            DropListTipoHabitacion.DataTextField = "Nombre";
            DropListTipoHabitacion.DataValueField = "Id";
            DropListTipoHabitacion.DataBind();
        }

        private void TipoSeleccionado()
        {
            int IdTIpo = Convert.ToInt32(DropListTipoHabitacion.SelectedValue);
            var db = new DB();
            List<Habitacion> ListaHabitaciones = db.Habitacion.ToList();

            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("ID", typeof(Int32)));
            dt.Columns.Add(new DataColumn("Precio", typeof(Int32)));
            dt.Columns.Add(new DataColumn("Descripcion", typeof(string)));
            dt.Columns.Add(new DataColumn("Tipo", typeof(string)));
            dt.Columns.Add(new DataColumn("Cantidad Personas", typeof(Int32)));

            foreach (Habitacion habitacion in ListaHabitaciones)
            {
                //condicion: habitacion.TipoHabitacion.Id == IdTIpo
                if (true)
                    {
                        DataRow dr = dt.NewRow();
                        dr[0] = habitacion.Id;
                        dr[1] = habitacion.Precio;
                        dr[2] = habitacion.Descripcion;
                        dr[3] = habitacion.TipoHabitacion.Nombre;
                        dr[4] = habitacion.TipoHabitacion.CantidadPersonas;

                        dt.Rows.Add(dr);
                    }             
            }

            DataView dv = new DataView(dt);
            Lista.DataSource = dv;
            Lista.DataBind();
        }
        private void comprobarSesion()
        {
            Usuario user = Session["conectado"] as Usuario;
            if (user != null)
            {
                if (!user.TipoUsuario.Nombre.Equals("RECEPCIONISTA"))
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}