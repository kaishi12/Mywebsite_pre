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
        [Object]
        public ActionResult PageDetail(int PageId)
        {
            var page = data.Pages.SingleOrDefault(p => p.PageId == PageId);
            var listPage = data.Pages.Where(m => m.ChapterId == page.ChapterId && m.CategoryId == 1 && m.StatusActive == 0).ToList();
           
            foreach(var item in listPage)

            {
                List<TextBox> list = new List<TextBox>();
                foreach (var textbox in item.TextBoxes)
                {
                    if(textbox.StatusActive == 1)
                    {
                        list.Add(textbox);
                    }
                }
                if(list.Count> 0)
                {
                    foreach(var textboxs in list)
                    {
                        item.TextBoxes.Remove(textboxs); 
                    }
                }
            }
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
        [Object]
        public ActionResult PageSelect(int Pageid)
        {
            var pagefa = data.Pages.SingleOrDefault(m => m.PageId == Pageid);
            ViewBag.MangaId = pagefa.Chapter.Manga.MangaId;
            ViewBag.ChapterId = pagefa.ChapterId;
            ViewBag.PageRawName = pagefa.FullName;
            ViewBag.ListPage = data.Pages.Where(m => m.ChapterId == pagefa.ChapterId && m.StatusActive == 0 && m.CategoryId == 1);
            var listpage = data.Pages.Where(m => m.PageId_Fa == Pageid);
            return View(listpage);
        }
    }
}