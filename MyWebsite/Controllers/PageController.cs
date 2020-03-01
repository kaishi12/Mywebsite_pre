using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyWebsite.Models;
using MyWebsite.ViewModels.TextBox;
using TextBoxModel = MyWebsite.ViewModels.TextBox.TextBoxModel;
using MyWebsite.Service.TextBox;
using MyWebsite.Service.Common;

namespace MyWebsite.Controllers
{
    [AccountStatus]
    public class PageController : Controller
    {
        // GET: Page
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        readonly TextBoxService textBoxService = new TextBoxService();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult PageDetail(int PageId)
        {
            var page = data.Pages.SingleOrDefault(p => p.PageId == PageId);
            var listPage = data.Pages.Where(m => m.ChapterId == page.ChapterId && m.Active == true).ToList();
           
           
                List<TextBox> list = new List<TextBox>();
                foreach (var textbox in page.TextBoxes.Where(m=>m.Active == true).ToList())
                {
                    if(textbox.Active == true)
                    {
                        list.Add(textbox);
                    }
                }
               
            
            ViewBag.list = list;
            ViewBag.listpage = listPage;
            return View(page);
        }
        [HttpPost]
        public ActionResult AddNewTextBoxes(List<TextBoxModel> model)
        {
            if(textBoxService.AddNewTextBoxes(model)== true)
            {
                return Json(true);
            }
            else
            {
                return Json(false);
            }
        }
       
        public ActionResult PageSelect(int Pageid)
        {
            var pagefa = data.Pages.SingleOrDefault(m => m.PageId == Pageid);
            ViewBag.MangaId = pagefa.Chapter.Manga.MangaId;
            ViewBag.ChapterId = pagefa.ChapterId;
            ViewBag.PageRawName = pagefa.FullName;
            ViewBag.ListPage = data.Pages.Where(m => m.ChapterId == pagefa.ChapterId && m.Active == true && m.CategoryId == 1);
            var listpage = data.Pages.Where(m => m.PageId_Fa == Pageid);
            return View(listpage);
        }
        public ActionResult UpdateStatusPage(int PageId,int Status)
        {
            try
            {
                var res = data.Pages.FirstOrDefault(m => m.PageId == PageId);
                res.Status = Status;
                data.SaveChanges();
                return Json("Success", JsonRequestBehavior.AllowGet);
            }
          catch(Exception e)
          {
                return Json("Failed", JsonRequestBehavior.AllowGet);
            }
        }
    }
}