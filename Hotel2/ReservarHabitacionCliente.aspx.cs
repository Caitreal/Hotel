using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class Reservar_ : System.Web.UI.Page
    {

        public int Id { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
           
 
        }

        protected void reservar_Click(object sender, EventArgs e)
        {
            var db = new DB();
            Usuario conectado = Session["conectado"] as Usuario;


            Cliente cli = new Cliente();

            List<Cliente> liscli = db.Cliente.ToList();

            foreach (Cliente c in liscli)
            {
                if (c.UsuarioId == conectado.Id)
                {
                    cli = c;
                }
            }

            Reserva rs = new Reserva();
            rs.Cliente = cli;
            rs.UsuarioId = conectado.Id;
            rs.NumeroNoches = Convert.ToInt32(txtNumNoches.Text);
            rs.CantidadPersonas = Convert.ToInt32(txtPersonas.Text);
            rs.HabitacionId = Convert.ToInt32(Request.QueryString["id"]);

            db.Reserva.Add(rs);
            db.SaveChanges();

            Response.Redirect("MenuCliente.aspx");

        }
    }
}