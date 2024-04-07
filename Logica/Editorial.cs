using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Logica
{
    public class Editorial
    {
        Datos.Editorial datosEditorial = new Datos.Editorial();

        public void Agregar(string nombre)
        {
            try
            {
                if (nombre == "Violencia")
                {
                    throw new Exception("Género NO permitido");
                }
                datosEditorial.Agregar(nombre);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void Modificar(int id, string nombre)
        {
            try
            {
                datosEditorial.Modificar(id, nombre);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }

        public void Borrar(int id)
        {
            try
            {
                datosEditorial.Borrar(id);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public DataTable TraerTodos()
        {
            try
            {
                return datosEditorial.TraerTodos();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
