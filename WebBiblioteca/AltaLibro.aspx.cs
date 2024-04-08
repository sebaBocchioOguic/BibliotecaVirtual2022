using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBiblioteca
{
    public partial class AltaLibro : Utilidad
    {

        Logica.Autor logicaAutor = new Logica.Autor();
        static int intIdAutor;
        static string strApellido;
        static string strNombre;
        static List<Entidades.Autor> listaAutores = new List<Entidades.Autor>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LlenarCombos();
            }
        }

        public void LlenarCombos()
        {
            // Cargar Generos
            Logica.Genero logicaGenero = new Logica.Genero();
            ddlGenero.DataSource = logicaGenero.TraerTodos();
            ddlGenero.DataTextField = "Nombre";
            ddlGenero.DataValueField = "Id";
            ddlGenero.DataBind();

            // Cargar Editoriales
            Logica.Editorial logicaEditorial = new Logica.Editorial();
            ddlEditorial.DataSource = logicaEditorial.TraerTodos();
            ddlEditorial.DataTextField = "Nombre";
            ddlEditorial.DataValueField = "Id";
            ddlEditorial.DataBind();

            // Cargar Autores
            gvAutoresSeleccionados.DataSource = logicaAutor.TraerTodos();
            gvAutoresSeleccionados.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Agrega a la grilla de Autores Seleccionados
            Entidades.Autor autor = new Entidades.Autor();
            autor.ID = intIdAutor;
            autor.Nombre = strNombre;
            autor.Apellido = strApellido;

            listaAutores.Add(autor);

            gvAutoresSeleccionados.DataSource=listaAutores;
            gvAutoresSeleccionados.DataBind();

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            // Valido en el Server

            if (Page.IsValid)
            {
                // Construyo el objeto de Entidad.Libro
                MsgBox("Datos Validados");
            }
            else
            {
                // Error
                MsgBox("Verifique las reglas del formulario");
            }
        }

        protected void gvAutoresSeleccionados_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow fila = gvAutoresSeleccionados.SelectedRow;
            intIdAutor = Convert.ToInt32(fila.Cells[1].Text);
            strApellido = fila.Cells[2].Text;
            strNombre = fila.Cells[3].Text;

        }

        protected void gvAutoresSeleccionados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAutoresSeleccionados.PageIndex = e.NewPageIndex;
            gvAutoresSeleccionados.DataSource = logicaAutor.TraerTodos();
            gvAutoresSeleccionados.DataBind();
        }
    }
}