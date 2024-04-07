using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data; // Modelo Desconectado ADO.NET
using System.Data.SqlClient; // Modelo Conectado ADO.NET

namespace Datos
{
    public class Autor
    {
        
        public void Agregar(Entidades.Autor autor)
        {
            string strSQL = @"insert into Autores(Apellido, Nombre, FechaNacimiento, IdPais)
                                values (@Apellido, @Nombre, @FechaNacimiento, @IdPais)";

            // Modo Conectado - Clase SqlConnection
            SqlConnection objConexion = new SqlConnection(Conexion.strConexion);

            // Clase SqlCommand para armar la estructura de ejecución de sentencias SQL
            SqlCommand objComm = new SqlCommand(strSQL, objConexion);

            // Agregar parámetros a la consulta creada
            objComm.Parameters.AddWithValue("@Apellido", autor.Apellido);
            objComm.Parameters.AddWithValue("@Nombre", autor.Nombre);
            objComm.Parameters.AddWithValue("@FechaNacimiento", autor.FechaNacimiento);
            objComm.Parameters.AddWithValue("@IdPais", autor.Pais.ID);

            // Indicarle al Command que ejecute una sentencia tipo texto
            objComm.CommandType = CommandType.Text;

            try
            {
                // Abrimos la conexión a la Base de Datos
                objConexion.Open();

                // Ejecuto el comando
                objComm.ExecuteNonQuery();
            }
            catch (SqlException)
            {
                throw new Exception("Error en la conexión con la Base de Datos");
            }
            catch (Exception)
            {
                throw new Exception("Error general en la capa de Datos agregando al autor");
            }
            finally
            {
                // Cierro la conexión
                if(objConexion.State == ConnectionState.Open)
                {
                    objConexion.Close();
                }
                
            }

        }

        /// <summary>
        /// Método Datos.TraerTodos()
        /// Obtiene como resultado TODOS los Autores desde la vista VistaAutores de SQLServer
        /// </summary>
        /// <returns>DataTable</returns>
        public DataTable TraerTodos()
        {
            DataTable dt = new DataTable();

            // Traer todos los datos de la BD, en modo Desconectado
            string strSQL = "select * from VistaAutores";

            SqlDataAdapter objDa = new SqlDataAdapter(strSQL, Conexion.strConexion);

            objDa.Fill(dt); // Método JIT

            return dt;
        }

        /// <summary>
        /// Sobrecarga del método Datos.TraerTodos(string pais)
        /// Obtiene como resultado los autores filtrados por el país que ingresa por parámetro.
        /// Se obtiene desde la vista VistaAutores de SQLServer
        /// </summary>
        /// <param name="pais"></param>
        /// <returns>DataTable</returns>
        public DataTable TraerTodos(string pais)
        {
            DataTable dt = new DataTable();

            // Traer todos los datos de la BD, en modo Desconectado
            string strSQL = "select * from VistaAutores where pais = '" + pais + "'";

            SqlDataAdapter objDa = new SqlDataAdapter(strSQL, Conexion.strConexion);

            objDa.Fill(dt); // Método JIT

            return dt;
        }


    }
}
