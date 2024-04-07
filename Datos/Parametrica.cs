using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public enum CRUD
    {
        SELECT,
        INSERT,
        UPDATE,
        DELETE
    }

    public abstract class Parametrica
    {
        public Parametrica(string tabla)
        {
            Tabla = tabla;
        }
        public string Tabla { get; set; }

        public void Agregar (string nombre)
        {
            try
            {
                operacion(CRUD.INSERT, 0, nombre);
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
                operacion(CRUD.UPDATE, id, nombre);
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
                operacion(CRUD.DELETE, id);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public DataTable TraerTodos()
        {
            DataTable dt = new DataTable();
            SqlDataAdapter objDa = new SqlDataAdapter("ProcAbmParam", Conexion.strConexion);

            objDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            objDa.SelectCommand.Parameters.AddWithValue("@Accion", CRUD.SELECT.ToString());
            objDa.SelectCommand.Parameters.AddWithValue("@Tabla", Tabla);

            try
            {
                objDa.Fill(dt);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            

            return dt;
        }

        private void operacion(CRUD accion, int id=0, string nombre="")
        {
            string strProc = "ProcAbmParam";
            SqlConnection objCon = new SqlConnection(Conexion.strConexion);
            SqlCommand objComm = new SqlCommand(strProc, objCon);
            objComm.CommandType = CommandType.StoredProcedure;
            objComm.Parameters.AddWithValue("@Accion", accion.ToString());
            objComm.Parameters.AddWithValue("@Tabla", Tabla);
            objComm.Parameters.AddWithValue("@Id", id);
            objComm.Parameters.AddWithValue("@Nombre", nombre);

            try
            {
                objCon.Open();
                objComm.ExecuteNonQuery();

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
            finally
            {
                if (objCon.State == ConnectionState.Open)
                {
                    objCon.Close();
                }
            }
            
        }

    }
}
