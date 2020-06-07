using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace MyWebsite
{
    public class MvcApplication : System.Web.HttpApplication
    {
        string conStr = Service.Common.Const.conStr;
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            //SqlDependency.Start(conStr);
        }
       
        protected void Application_End()
        {
            //here we will stop Sql Dependency  
            SqlDependency.Stop(conStr);
        }
    }
}
