using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBiblioteca
{
    public partial class Editoriales : Utilidad
    {

        Logica.Editorial logicaEditorial = new Logica.Editorial();

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
                gvEditoriales.DataSource = logicaEditorial.TraerTodos();
                gvEditoriales.DataBind();
            }
            catch (Exception ex)
            {
                MsgBox(ex.Message);
            }
        }

        protected void gvEditoriales_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow filaSeleccionada = gvEditoriales.SelectedRow;
            lblId.Text = filaSeleccionada.Cells[1].Text;
            txtNombre.Text = filaSeleccionada.Cells[2].Text;
        }

        protected void gvEditoriales_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEditoriales.PageIndex = e.NewPageIndex;
            TraerTodos();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                logicaEditorial.Agregar(txtNombre.Text);
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
                logicaEditorial.Modificar(intID, strNombre);
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
                logicaEditorial.Borrar(intID);
                TraerTodos();
            }
            catch (Exception ex)
            {
                MsgBox(ex.Message);
            }

        }
    }
}