using Hotel2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var db = new DB();

            //operaciones básicas CRUD

            //1. CREATE
            /*
            var usuario = new Usuario();
            usuario.NombreUsuario = "PERRITO";
            usuario.Clave = "GUAU";
            usuario.TipoUsuarioId = 2;

            db.Usuario.Add(usuario);
            */

            //2. READ
            //2.a. Leer 1
            //var usuario = db.Usuario.Find(3);
            /*
            var usuario = db.Usuario.Where(u => u.NombreUsuario == "PERRITO").FirstOrDefault();
            lblMensaje.Text = "Usuario: " + usuario.NombreUsuario + " y Clave: " + usuario.Clave;
            */

            //2.b. Leer Todos
            /*var usuarios = db.Usuario.ToList();
            for(var i=0;i<usuarios.Count;i++)
            {
                var u = usuarios[i];
                lblMensaje.Text += u.NombreUsuario + ", ";
            }
            */

            //3. Actualizar
            /*
            var usuario = db.Usuario.Where(u => u.NombreUsuario == "MANGOSTITO").FirstOrDefault();
            usuario.Clave = "GRUÑIDO";
            */

            //4. Eliminar
            /*
            var usuario = db.Usuario.Where(u => u.NombreUsuario == "MANGOSTITO").ToList();
            foreach(var usuario in usuarios)
            {
                db.Usuario.Remove(usuario);
            }
            */
            
            //db.SaveChanges();
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            var usuarioTxt = txtUsuario.Text;
            var clave = txtClave.Text;

            var db = new DB();
            var usuario = db.Usuario.Where(u => u.NombreUsuario == usuarioTxt && u.Clave == clave).FirstOrDefault();

            if(usuario != null)
            {
                //usuario inició sesión correctamente
                Session["conectado"] = usuario;

                switch (usuario.TipoUsuario.Nombre)
                {
                    case "RECEPCIONISTA":
                        Response.Redirect("MenuRecepcionista.aspx");
                        break;

                    case "CLIENTE":
                        break;

                    case "ADMINISTRADOR":
                        break;

                    default:
                        break;
                }
                
            }
            else
            {
                lblMensaje.Text = "ERROR: USUARIO/CLAVE INCORRECTOS.";
            }
        }

        protected void btnRegistrar(object sender, EventArgs e)
        {
            Response.Redirect("RegistrarUsuario");
        }
    }
 }