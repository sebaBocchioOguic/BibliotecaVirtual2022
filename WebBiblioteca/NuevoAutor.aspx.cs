using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBiblioteca
{
    public partial class NuevoAutor : Utilidad //System.Web.UI.Page
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
            ddlPaises.DataSource = logicaPais.TraerTodos();
            ddlPaises.DataTextField = "Nombre";
            ddlPaises.DataValueField = "ID";
            ddlPaises.DataBind();
        }

        protected void ddlPaises_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // lblMensaje.Text = "Datos Validados";
                Logica.Autor logicaAutor = new Logica.Autor();
                Entidades.Autor entidadAutor = new Entidades.Autor();

                entidadAutor.Apellido = txtApellido.Text;
                entidadAutor.Nombre = txtNombre.Text;
                entidadAutor.FechaNacimiento = Convert.ToDateTime(txtFechaNacimiento.Text);

                Entidades.Pais entidadPais = new Entidades.Pais();
                entidadPais.ID = Convert.ToInt32(ddlPaises.SelectedValue);

                entidadAutor.Pais = entidadPais;

                logicaAutor.Agregar(entidadAutor);

                try
                {
                    //lblMensaje.Text = $"Autor {entidadAutor.Apellido} agregado";
                    MsgBox($"Autor {entidadAutor.Apellido} agregado");
                }
                catch (Exception ex)
                {

                    MsgBox(ex.Message);
                }

            }
            else
            {
                //lblMensaje.Text = "Datos No Validados";
                MsgBox("Datos No Validados");
            }
        }

        protected void btnReglas_Click(object sender, EventArgs e)
        {
            //lblMensaje.Text = "Todos los campos son obligatorios";
            MsgBox("Todos los Campos son Obligatorios");
        }
    }
}