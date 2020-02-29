using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyWebsite.Areas.FrontPage.Controllers
{
    public class HomeController : Controller
    {
        // GET: FrontPage/Home
        public ActionResult Index()
        {
            return View();
        }
    }
}