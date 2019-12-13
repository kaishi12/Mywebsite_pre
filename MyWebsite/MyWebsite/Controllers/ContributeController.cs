using MyWebsite.Models;
using MyWebsite.Service.Manga;
using MyWebsite.ViewModels.Account;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyWebsite.Controllers
{
    public class ContributeController : Controller
    {
        readonly MangaService MangaService = new MangaService();
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        // GET: Contribute
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult EditorList()
        {
            if (Session["UserInfo"] != null)
            {
                AccountModel accountModel = (AccountModel)Session["UserInfo"];
                List<Models.Manga> list = MangaService.GetListMangaByAccountId(accountModel.AccountId, 5);
                return View(list);
            }
            else
            {
                return RedirectToAction("Login", "Account");
            }
        }
        public ActionResult Editor(int? ChapterId, int? CategoryId)
        {
            Chapter chapter = new Chapter();
            if (ChapterId == null)
            {
                chapter = data.Chapters.FirstOrDefault(m => m.StatusActive == 0);
            }
            else
            {
                chapter = data.Chapters.FirstOrDefault(m => m.ChapterId == ChapterId);
            }
            var chapterlist = data.Chapters.Where(m => m.MangaId == chapter.MangaId && m.StatusActive == 0);
            if (CategoryId == null)
            {
                ViewBag.CategoryId = 1;
            }
            else
            {
                ViewBag.CategoryId = CategoryId;
            }
            ViewBag.MangaFullName = chapter.Manga.FullName;
            ViewBag.chapterlist = chapterlist;
            return View(chapter);
        }
        public ActionResult TranslatorList()
        {
            if (Session["UserInfo"] != null)
            {
                AccountModel accountModel = (AccountModel)Session["UserInfo"];
                List<Models.Manga> list = MangaService.GetListMangaByAccountId(accountModel.AccountId, 3);
                return View(list);
            }
            else
            {
                return RedirectToAction("Login", "Account");
            }
        }
        public ActionResult Translator(int? ChapterId, int? PageId)
        {
            Page Firstpage = data.Pages.SingleOrDefault(p => p.PageId == PageId);
            List<Chapter> chapterlist = new List<Chapter>();
            List<Page> listPage = new List<Page>();
            if (ChapterId == null)
            {
                
                
                 chapterlist = data.Chapters.Where(m => m.MangaId == Firstpage.Chapter.MangaId && m.StatusActive == 0).ToList();
                 listPage = data.Pages.Where(m => m.ChapterId == Firstpage.ChapterId && m.CategoryId == 1 && m.StatusActive == 0).ToList();
            }
            else
            {
                ViewBag.ChapterId = ChapterId;
                chapterlist = data.Chapters.Where(m => m.MangaId == data.Chapters.FirstOrDefault(n=>n.ChapterId == ChapterId).MangaId && m.StatusActive == 0).ToList();
                listPage = data.Pages.Where(m => m.ChapterId == ChapterId && m.CategoryId == 1 && m.StatusActive == 0).ToList();
                

            }
            ViewBag.chapterlist = chapterlist;
            ViewBag.MangaFullName = chapterlist.FirstOrDefault().Manga.FullName;
            
            ViewBag.PageId = PageId;
            foreach (var item in listPage)

            {
                List<TextBox> list = new List<TextBox>();
                foreach (var textbox in item.TextBoxes)
                {
                    if (textbox.StatusActive == 1)
                    {
                        list.Add(textbox);
                    }
                }
                if (list.Count > 0)
                {
                    foreach (var textboxs in list)
                    {
                        item.TextBoxes.Remove(textboxs);
                    }
                }
            }
            ViewBag.listpage = listPage;
            return View(Firstpage);
        }
        public ActionResult ContributeList()
        {
            return View();
        }
    }

}