using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public class Libro
    {
        Datos.Libro datosLibro = new Datos.Libro();

        public void Agregar(Entidades.Libro libro)
        {
            try
            {
                datosLibro.Agregar(libro);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
