using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBiblioteca
{
    public partial class Generos : Utilidad
    {

        Logica.Genero logicaGenero = new Logica.Genero();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                TraerTodos();
            }
        }

        private void TraerTodos()
        {
            try
            {
                gvGeneros.DataSource = logicaGenero.TraerTodos();
                gvGeneros.DataBind();
            }
            catch (Exception ex)
            {
                MsgBox(ex.Message);
            }
        }

        protected void gvGeneros_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow filaSeleccionada = gvGeneros.SelectedRow;
            lblId.Text = filaSeleccionada.Cells[1].Text;
            txtNombre.Text = filaSeleccionada.Cells[2].Text;
        }

        protected void gvGeneros_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvGeneros.PageIndex = e.NewPageIndex;
            TraerTodos();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                logicaGenero.Agregar(txtNombre.Text);
                TraerTodos();
            }
            catch (Exception ex)
            {
                MsgBox(ex.Message);
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                int intID = Convert.ToInt32(lblId.Text);
                string strNombre = txtNombre.Text;
                logicaGenero.Modificar(intID, strNombre);
                TraerTodos();
            }
            catch (Exception ex)
            {
                MsgBox(ex.Message);
            }
        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            try
            {
                int intID = Convert.ToInt32(lblId.Text);
                logicaGenero.Borrar(intID);
                TraerTodos();
            }
            catch (Exception ex)
            {
                MsgBox(ex.Message);
            }

        }
    }
}