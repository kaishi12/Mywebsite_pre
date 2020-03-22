using MyWebsite.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyWebsite.Controllers
{
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
        public ActionResult Addfont(string fontname,HttpPostedFileBase[] fontupload)
        {
           
            var foldername = @"~/LayoutUser/assets/fonts/" + fontname;
            var pathfolder = Path.Combine(Server.MapPath("~/LayoutUser/assets/fonts"), fontname);
            System.IO.Directory.CreateDirectory(pathfolder);
            Font font = new Font();
            font.FontLink =   "/" + fontname + "/font.css";
            font.FullName = fontname;
            font.Active = true;
            font.Description = "nothing";
            string Type = "";
            foreach (var item in fontupload)
            {
                var filename = Path.GetFileName(item.FileName);
               var path = Path.Combine(Server.MapPath(foldername), filename);
                item.SaveAs(path);
               
                if(!filename.Contains("Italic") && !filename.Contains("font"))
                {
                    Type += filename.Replace(".ttf", "") + ";";
                }
            }
            
            font.Type = Type.Remove(Type.Length - 1);
            data.Fonts.Add(font);
            data.SaveChanges();
            return RedirectToAction("ListFont");
            
            
        }
    }
}
