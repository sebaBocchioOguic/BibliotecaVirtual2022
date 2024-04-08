using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBiblioteca
{
    public partial class Paises : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                TraerPaises();
            }
        }

        void TraerPaises()
        {
            Logica.Pais logicaPais = new Logica.Pais();

            gvPaises.DataSource = logicaPais.TraerTodos();
            gvPaises.DataBind();
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            Entidades.Pais entidadPais = new Entidades.Pais();

            entidadPais.Nombre = txtNombre.Text;
            entidadPais.Region = txtRegion.Text;

            Logica.Pais logicaPais = new Logica.Pais();
            logicaPais.Agregar(entidadPais);

            TraerPaises();

        }

        protected void gvPaises_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPaises.PageIndex = e.NewPageIndex;
            TraerPaises();
        }
    }
}