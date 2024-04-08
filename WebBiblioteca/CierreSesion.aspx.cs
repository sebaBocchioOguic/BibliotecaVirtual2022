using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBiblioteca
{
    public partial class CierreSesion : Utilidad
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();
            MsgBox("Sesión Finalizada");
        }
    }
}