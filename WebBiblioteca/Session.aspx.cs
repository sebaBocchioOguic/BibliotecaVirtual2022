using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBiblioteca
{
    public partial class Session : Utilidad
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Session["Usuario"]=txtUsuario.Text;
            //MsgBox("Sesion de Usuario Guardada");
            Response.Redirect("Default.aspx");
        }
    }
}