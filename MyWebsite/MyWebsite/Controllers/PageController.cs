using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyWebsite.Models;
using MyWebsite.ViewModels.TextBox;
using TextBoxModel = MyWebsite.ViewModels.TextBox.TextBoxModel;
using MyWebsite.Service.TextBox;

namespace MyWebsite.Controllers
{
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
        public ActionResult PageSelect(int Pageid)
        {
            var listpage = data.Pages.Where(m => m.PageId_Fa == Pageid).ToList();
            return View(listpage);
        }
    }
}