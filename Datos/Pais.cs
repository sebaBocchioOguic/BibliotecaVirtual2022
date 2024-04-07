using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class Pais
    {
        public void Agregar(Entidades.Pais pais)
        {
            string strSQL = @"insert into Paises(Nombre, Region)
                                values (@Nombre, @Region)";

            // Modo Conectado - Clase SqlConnection
            SqlConnection objConexion = new SqlConnection(Conexion.strConexion);

            // Clase SqlCommand para armar la estructura de ejecución de sentencias SQL
            SqlCommand objComm = new SqlCommand(strSQL, objConexion);

            // Agregar parámetros a la consulta creada
            objComm.Parameters.AddWithValue("@Nombre", pais.Nombre);
            objComm.Parameters.AddWithValue("@Region", pais.Region);

            // Indicarle al Command que ejecute una sentencia tipo texto
            objComm.CommandType = CommandType.Text;

            // Abrimos la conexión a la Base de Datos
            objConexion.Open();

            // Ejecuto el comando
            objComm.ExecuteNonQuery();

            // Cierro la conexión
            objConexion.Close();
        }


        public DataTable TraerTodos()
        {
            DataTable dt = new DataTable();

            // Traer todos los datos de la BD, en modo Desconectado
            string strSQL = "select * from Paises";

            SqlDataAdapter objDa = new SqlDataAdapter(strSQL, Conexion.strConexion);

            objDa.Fill(dt); // Método JIT

            return dt;
        }

    }
}
