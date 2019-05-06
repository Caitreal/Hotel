using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel2
{
    public partial class RegistrarCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var db = new DB();
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            var usuario = txtUsuario.Text;
            var contraseña = txtClave.Text;
            var confirmar = Txtconfir.Text;
            var rut = txtRut.Text;
            var db = new DB();

            if (usuario != "" & contraseña!="" & confirmar!="")
            {
                if(contraseña.Equals(confirmar))
                {
                    var registrarUsuario = new Usuario();
                    if (usuario != registrarUsuario.NombreUsuario)
                    {
                        registrarUsuario.NombreUsuario = usuario;
                        registrarUsuario.Clave = contraseña;
                        registrarUsuario.TipoUsuarioId = 2;
                        db.Usuario.Add(registrarUsuario);
                        db.SaveChanges();

                        Usuario us = new Usuario();

                        List<Usuario> listaU = db.Usuario.ToList();

                        foreach (Usuario u in listaU)
                        {
                            if(u.NombreUsuario == usuario)
                            {
                                us = u;
                            }

                        }

                        Cliente cl = new Cliente();
                        cl.Rut = rut;
                        cl.UsuarioId = us.Id;

                        db.Cliente.Add(cl);
                        db.SaveChanges();


                        lblSuccess.Text = "Se ha registrado correctamente.";
                    }
                    else
                    {
                        lblSuccess.Text = "Usuario ya registrado";
                    }
                }
                else
                {
                    lblMensaje.Text = "ERROR: Las contraseñas no coinciden.";
                }
            }
            else
            {
                lblMensaje.Text = "ERROR: Debes rellenar todos los campos.";
            }
        }
    }
}