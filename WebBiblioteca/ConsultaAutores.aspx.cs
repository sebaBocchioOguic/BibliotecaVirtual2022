using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBiblioteca
{
    public partial class ConsultaAutores : Utilidad
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                TraerAutores("Argentina");
                TraerPaises();
            }
        }

        void TraerAutores()
        {
            Logica.Autor logicaAutor = new Logica.Autor();

            gvAutores.DataSource = logicaAutor.TraerTodos();

            gvAutores.DataBind();

        }

        /// <summary>
        /// Sobrecarga del método WebBiblioteca.TraerTodos(string pais)
        /// Obtiene como resultado los autores filtrados por el país que ingresa por el DropDownList.
        /// Se obtiene desde la vista VistaAutores de SQLServer
        /// </summary>
        /// <param name="pais"></param>
        void TraerAutores(string pais)
        {
            Logica.Autor logicaAutor = new Logica.Autor();

            gvAutores.DataSource = logicaAutor.TraerTodos(pais);

            gvAutores.DataBind();

        }


        void TraerPaises()
        {
            Logica.Pais logicaPais = new Logica.Pais();
            ddlPaises.DataSource = logicaPais.TraerTodos();
            ddlPaises.DataTextField = "Nombre";
            ddlPaises.DataValueField = "Nombre";
            ddlPaises.DataBind();

        }

        protected void gvAutores_SelectedIndexChanged(object sender, EventArgs e) {}

        protected void gvAutores_SelectedIndexChanging(object sender, GridViewSelectEventArgs e) {}

        protected void gvAutores_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAutores.PageIndex = e.NewPageIndex;
            TraerAutores();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
           // TraerAutores(ddlPaises.SelectedValue.ToString());
        }

        protected void ddlPaises_SelectedIndexChanged(object sender, EventArgs e)
        {
            TraerAutores(ddlPaises.SelectedValue.ToString());
        }
    }
}