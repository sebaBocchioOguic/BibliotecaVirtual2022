using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Logica
{
    public class Genero
    {
        Datos.Genero datosGenero = new Datos.Genero();

        public void Agregar(string nombre)
        {
            try
            {
                if (nombre == "Violencia")
                {
                    throw new Exception("Género NO permitido");
                }
                datosGenero.Agregar(nombre);
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
                datosGenero.Modificar(id, nombre);
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
                datosGenero.Borrar(id);
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
                return datosGenero.TraerTodos();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
