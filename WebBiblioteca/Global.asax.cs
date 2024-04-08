using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace WebBiblioteca
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Código que se ejecuta al iniciar la aplicación
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            Application["Conectados"] = 0;
        }

        void Application_End(object sender, EventArgs e)
        {
            // Código que se ejecuta al finalizar la aplicación
        }

        void Session_Start(object sender, EventArgs e)
        {
            // Código que se ejecuta al iniciar la sesión
            Application["Conectados"] = Convert.ToInt32(Application["Conectados"]) + 1;
        }

        void Session_End(object sender, EventArgs e)
        {
            // Código que se ejecuta al finalizar la sesión
            Application["Conectados"] = Convert.ToInt32(Application["Conectados"]) - 1;
        }
    }
}