using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data; // Modelo Desconectado ADO.NET
using System.Data.SqlClient; // Modelo Conectado ADO.NET

namespace Logica
{
    public class Pais
    {
        Datos.Pais datosPais = new Datos.Pais();

        // Métodos de acceso a la BD
        public void Agregar(Entidades.Pais pais)
        {
            datosPais.Agregar(pais);
        }

        public DataTable TraerTodos()
        {
            return datosPais.TraerTodos();
        }
    }
}
