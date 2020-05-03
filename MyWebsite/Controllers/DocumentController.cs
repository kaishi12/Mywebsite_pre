using MyWebsite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyWebsite.Controllers
{
    public class DocumentController : Controller
    {
        // GET: Document
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult LoadDocument()
        {
            var list = data.Documents.ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
    }
}