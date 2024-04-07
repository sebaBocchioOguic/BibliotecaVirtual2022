using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data; // Modelo Desconectado ADO.NET
using System.Data.SqlClient; // Modelo Conectado ADO.NET

namespace Logica
{
    public class Autor
    {

        Datos.Autor datosAutor = new Datos.Autor();

        public void Agregar(List<Entidades.Autor> autores, Entidades.Autor autor) { 
            autores.Add(autor);
        }

        public List<Entidades.Autor> TraerTodos(List<Entidades.Autor> autores)
        {
            return autores;
        }

        public int TraerCantidad(List<Entidades.Autor> autores)
        {
            return autores.Count();
        }

        public List<Entidades.Autor> FiltrarxPais(List<Entidades.Autor> autores, string pais)
        {
            List<Entidades.Autor> listaAutoresPais = new List<Entidades.Autor>();

            foreach (var autor in autores)
            {
                if (autor.Pais.Nombre == pais)
                {
                    listaAutoresPais.Add(autor);
                }
            }

            return listaAutoresPais;
        }

        // Métodos de acceso a la BD
        public void Agregar(Entidades.Autor autor)
        {
            try
            {
                if(autor.Nombre.ToUpper().Trim() == "PEDRO")
                {
                    throw new Exception($"No se permite el nombre {autor.Nombre}");
                }
                datosAutor.Agregar(autor);
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
            
        }

        public DataTable TraerTodos()
        {
            return datosAutor.TraerTodos();
        }

        /// <summary>
        /// Sobrecarga del método Logica.TraerTodos(string pais)
        /// Obtiene como resultado los autores filtrados por el país que ingresa por parámetro.
        /// Se obtiene desde la vista VistaAutores de SQLServer
        /// </summary>
        /// <param name="pais"></param>
        /// <returns></returns>
        public DataTable TraerTodos(string pais)
        {
            return datosAutor.TraerTodos(pais);
        }

        public void Modificar() { }
        public void Borrar() { }

    }
}
