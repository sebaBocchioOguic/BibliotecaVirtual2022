
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PresentaciónConsola
{
    internal class Program
    {
        // Creo la colección de autores
        static public List<Entidades.Autor> ListaAutores = new List<Entidades.Autor>();
        static void Main(string[] args)
        {
            int intOpcion = 3;

            do
            {
                Console.Clear();

                Console.WriteLine("Seleccione una Opción");
                Console.WriteLine("\n*********************");
                Console.WriteLine("\n1=Agregar\n2=Mostrar\n3=Autores de Argentina\n4=Fin");

                intOpcion = int.Parse(Console.ReadLine());

                switch (intOpcion)
                {
                    case 1:
                        Nuevos();
                        break;
                    case 2:
                        Mostrar();
                        break;
                    case 3:
                        Mostrar("Argentina");
                        break;
                    case 4:
                        break;

                }

            } while (intOpcion != 4);
        }

        // Procedimientos
        static void Nuevos()
        {
            Entidades.Pais argentina = new Entidades.Pais();
            argentina.ID = 1;
            argentina.Nombre = "Argentina";
            argentina.Region = "América";

            Entidades.Autor autor1 = new Entidades.Autor()
            {
                ID = 1,
                Apellido = "Borges",
                Nombre = "Jorge Luis",
                FechaNacimiento = Convert.ToDateTime("19/08/1899"),
                Pais = argentina
            };

            Entidades.Autor autor2 = new Entidades.Autor()
            {
                ID = 2,
                Apellido = "Cortazar",
                Nombre = "Julio",
                FechaNacimiento = Convert.ToDateTime("19/08/1920"),
                Pais = argentina
            };

            Logica.Autor logicaAutor = new Logica.Autor();

            logicaAutor.Agregar(autor1);
            Console.WriteLine($"Agregó {autor1.Apellido}");
            Console.ReadKey();

            logicaAutor.Agregar(autor2);
            Console.WriteLine($"Agregó {autor2.Apellido}");
            Console.ReadKey();

        }

        static void Mostrar()
        {
            Logica.Autor logicaAutor = new Logica.Autor();
            Console.Clear();

            Console.WriteLine("Lista de Autores");
            Console.WriteLine("****************");

            foreach (var a in logicaAutor.TraerTodos(ListaAutores))
            {
                Console.WriteLine($"\n{a.ID} - {a.Apellido}, {a.Nombre} - Pais: {a.Pais.Nombre}");
            }
            
            Console.WriteLine("\nPresione una tecla para volver al menú");
            Console.ReadKey();

        }

        static void Mostrar(string pais)
        {
            Logica.Autor logicaAutor = new Logica.Autor();
            Console.Clear();

            Console.WriteLine($"Lista de Autores de {pais}");
            Console.WriteLine("*********************************");

            foreach (var a in logicaAutor.FiltrarxPais(ListaAutores, pais))
            {
                Console.WriteLine($"\n{a.ID} - {a.Apellido}, {a.Nombre} - Pais: {a.Pais.Nombre}");
            }

            Console.WriteLine("\nPresione una tecla para volver al menú");
            Console.ReadKey();

        }
    }
}
