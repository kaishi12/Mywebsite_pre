using MyWebsite.Models;
using MyWebsite.Service.Common;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyWebsite.Controllers
{
    [AdminStatus]
    public class AdminController : Controller
    {
        // GET: Admin
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ListFont()
        {
            var listfont = data.Fonts;
            return View(listfont);
        }
        [HttpPost]
        public ActionResult Addfont(string fontname, HttpPostedFileBase fontupload)
        {


            using (System.IO.StreamWriter file = new System.IO.StreamWriter(Server.MapPath("~/LayoutUser/assets/fonts/font.css"), true))
            {
                file.WriteLine("@font-face{font-family: " + fontname + ";src:url(/LayoutUser/assets/fonts/" + Path.GetFileName(fontupload.FileName.Replace(" ","-")) + ");}");
            }




            Font font = new Font();
            font.FontLink = "/" + fontname + "/font.css";
            font.FullName = fontname;
            font.Active = true;
            font.Description = "nothing";
            var filename = Path.GetFileName(fontupload.FileName.Replace(" ", "-"));
            var path = Path.Combine(Server.MapPath("~/LayoutUser/assets/fonts"), filename);
            fontupload.SaveAs(path);
            data.Fonts.Add(font);
            data.SaveChanges();
            return RedirectToAction("ListFont");


        }
    }
}
