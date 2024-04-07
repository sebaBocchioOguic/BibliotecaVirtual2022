using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class Libro
    {
        public void Agregar(Entidades.Libro Libro)
        {
            string strProc = "ProcAltaLibro";

            SqlConnection objCon = new SqlConnection(Conexion.strConexion);

            SqlCommand objCom = new SqlCommand(strProc, objCon);

            objCom.CommandType = CommandType.StoredProcedure;

            objCom.Parameters.AddWithValue("@ISBN", Libro.ISBN);
            objCom.Parameters.AddWithValue("@Titulo", Libro.Titulo);
            objCom.Parameters.AddWithValue("@Edicion", Libro.Edicion);
            objCom.Parameters.AddWithValue("@IdGenero", Libro.IdGenero);
            objCom.Parameters.AddWithValue("@IdEditorial", Libro.IdEditorial);

            // Crear un DataTable ya que en SqlServer el parametro es una tabla
            DataTable dtAutores = new DataTable();

            DataColumn IdAutor = dtAutores.Columns.Add("IdAutor",typeof(int));

            try
            {
                // Si no hay autores
                if(Libro.Autores.Count == 0)
                {
                    throw new Exception("Debe tener al menos un autor");
                }

                // Por cada autor
                foreach (var autor in Libro.Autores)
                {
                    DataRow nuevaFila = dtAutores.NewRow();
                    nuevaFila["IdAutor"] = autor.ID;
                    dtAutores.Rows.Add(nuevaFila);
                }

                // Crear el 6to parámetro
                SqlParameter paramAutores = new SqlParameter();
                paramAutores.ParameterName = "@Autores";
                paramAutores.Direction = ParameterDirection.Input;
                paramAutores.SqlDbType = SqlDbType.Structured;
                paramAutores.Value = dtAutores;

                // Agrego a la colección de parámetros
                objCom.Parameters.Add(paramAutores);

                // Abrir la conexión
                objCon.Open();

                // Invoco al SP desde el objCommand
                objCom.ExecuteNonQuery();

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }

            finally
            {
                if(objCon.State == ConnectionState.Open)
                {
                    objCon.Close();
                }
            }

        }
    }
}
