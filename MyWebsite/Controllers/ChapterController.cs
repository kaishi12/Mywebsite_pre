using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyWebsite.ViewModels.Account;
using MyWebsite.ViewModels.Chapter;
using MyWebsite.Service.Chapter;
using MyWebsite.Models;
using MyWebsite.Service.Common;
using System.Transactions;

namespace MyWebsite.Controllers
{
    [AccountStatus]
    public class ChapterController : Controller
    {
        // GET: Chapter
        readonly ChapterService chapterService = new ChapterService();
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        public ActionResult Index()
        {
            return View();
        }
       
        public ActionResult ChapterDetail(int ChapterId)
        {
            var chapter = data.Chapters.FirstOrDefault(m => m.ChapterId == ChapterId);

            return View(chapter);
        }
        public ActionResult Create(int MangaId)
        {
            ViewBag.MangaId = MangaId;
            ViewBag.FullName = data.Mangas.FirstOrDefault(m => m.MangaId == MangaId).FullName;
            return View();
        }
        [HttpPost]
        public ActionResult Create(ChapterModel model, HttpPostedFileBase[] AnhTrang, string PageOrderNumber, string PageFullName)
        {
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    AccountModel account = (AccountModel)Session["UserInfo"];
                    if (ModelState.IsValid)
                    {
                        string[] ListOrderNumber = PageOrderNumber.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                        string[] ListFullName = PageFullName.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                        var folder = Path.GetRandomFileName();
                        if (!Directory.Exists(Path.Combine(Server.MapPath("~/PageLink"), folder)))
                            Directory.CreateDirectory(Path.Combine(Server.MapPath("~/PageLink"), folder));
                        var rawfolder = "Raw";
                        if (!Directory.Exists(Path.Combine(Server.MapPath("~/PageLink"), folder, rawfolder)))
                            Directory.CreateDirectory(Path.Combine(Server.MapPath("~/PageLink"), folder, rawfolder));
                        if (!Directory.Exists(Path.Combine(Server.MapPath("~/PageLink"), folder, "Clear")))
                            Directory.CreateDirectory(Path.Combine(Server.MapPath("~/PageLink"), folder, "Clear"));
                        List<PageModel> pageModels = new List<PageModel>();
                        for (int i = 0; i < AnhTrang.Count(); i++)
                        {

                            PageModel pageModel = new PageModel();
                            var filename = ListFullName[i] + ".png";
                            var path = Path.Combine(Server.MapPath("~/PageLink"), folder, rawfolder, filename);
                            AnhTrang[i].SaveAs(path);
                            pageModel.AccountId = account.AccountId;
                            pageModel.PageLink = folder + "/Raw/" + filename;
                            pageModel.OrderNumber = int.Parse(ListOrderNumber[i]);
                            pageModel.FullName = ListFullName[i];
                            pageModels.Add(pageModel);
                        }
                        model.pageModels = pageModels;
                        model.Alias = model.FullName.Replace(' ', '-');
                        var res = chapterService.AddnewChapter(model);
                        scope.Complete();
                        if (res)
                        {
                            return RedirectToAction("ListChapter", "Manga", new { MangaId = model.MangaId });
                        }
                        else
                        {
                            return View(model);
                        }
                    }
                    else
                    {
                        return RedirectToAction("Error", "PageError");
                    }
                }
            }
            catch (TransactionAbortedException ex)
            {
                return RedirectToAction("Error", "PageError");
            }

        }
        [HttpPost]
        public JsonResult UpdateLinkPage(HttpPostedFileBase fileupload)
        {
            try
            {

                var PageId = int.Parse(Request.Form["PageId"]);
                var page = data.Pages.Find(PageId).PageLink;
                var path = Path.Combine(Server.MapPath("~/PageLink"), page);
                fileupload.SaveAs(path);
                return Json(true);
            }
            catch
            {
                return Json(false);
            }
        }
        [HttpPost]
        public JsonResult UpdateStatusPage(int PageId, bool StatusActive)
        {
            if (chapterService.UpdateRawPage(PageId, "", StatusActive))
            {
                return Json("Success");
            }
            else
            {
                return Json("fail");
            }
        }
        [HttpPost]
        public ActionResult UpdateInfoChapter(ChapterModel model)
        {
            var res = data.Chapters.SingleOrDefault(m => m.ChapterId == model.ChapterId);
            res.OrderNumber = model.OrderNumber;
            res.FullName = model.FullName;

            data.SaveChanges();
            return Json("Lưu thành công");
        }
        [HttpPost]
        public ActionResult AddNewPage(Chapter model, HttpPostedFileBase[] AnhTrang, int CurrentPage)
        {
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    AccountModel account = (AccountModel)Session["UserInfo"];
                    var next = CurrentPage + 1;
                    var folder = "";
                    List<PageModel> pageModels = new List<PageModel>();
                    var page = data.Pages.FirstOrDefault(m => m.ChapterId == model.ChapterId);

                    if (page != null)
                    {
                        folder = page.PageLink.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries)[0];
                    }
                    else
                    {
                        folder = Path.GetRandomFileName();
                        if (!Directory.Exists(Path.Combine(Server.MapPath("~/PageLink"), folder)))
                            Directory.CreateDirectory(Path.Combine(Server.MapPath("~/PageLink"), folder));
                        var rawfolder = "Raw";
                        if (!Directory.Exists(Path.Combine(Server.MapPath("~/PageLink"), folder, rawfolder)))
                            Directory.CreateDirectory(Path.Combine(Server.MapPath("~/PageLink"), folder, rawfolder));
                    }
                    for (int i = 0; i < AnhTrang.Count(); i++)
                    {

                        PageModel pageModel = new PageModel();
                        var filename = "trang " + (next + i) + "-" + model.FullName;
                        var path = Path.Combine(Server.MapPath("~/PageLink"), folder, "Raw", filename + ".png");
                        AnhTrang[i].SaveAs(path);
                        pageModel.AccountId = account.AccountId;
                        pageModel.PageLink = folder + "/Raw/" + filename + ".png";
                        pageModel.OrderNumber = next + i;
                        pageModel.FullName = filename;
                        pageModels.Add(pageModel);
                    }
                    var res = chapterService.AddNewRawPages(pageModels, model.ChapterId);
                    scope.Complete();
                    if (res)
                    {
                        return RedirectToAction("ListChapter", "Manga", new { MangaId = model.MangaId });
                    }
                    else
                    {
                        return RedirectToAction("Error", "PageError");
                    }
                }
            }
            catch (TransactionAbortedException ex)
            {
                return RedirectToAction("Error", "PageError");
            }
        }
        public JsonResult AddNewCleartextPage(HttpPostedFileBase fileupload)
        {
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    AccountModel account = (AccountModel)Session["UserInfo"];
                    var PageId = int.Parse(Request.Form["PageId"]);
                    var PageFA = data.Pages.SingleOrDefault(m => m.PageId == PageId);
                    var folder = PageFA.PageLink.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries)[0];
                    var filename = PageFA.FullName + "-Clear-text" + ".png";
                    var path = Path.Combine(Server.MapPath("~/PageLink"), folder, "Clear", filename);
                    fileupload.SaveAs(path);
                    string PageLink = folder + "/Clear/" + filename;
                    var res = chapterService.AddNewCleartextPage(account.AccountId, PageFA, PageLink);
                    scope.Complete();
                    return Json(res);
                    
                }
            }
            catch (TransactionAbortedException ex)
            {
                
                return Json(2);
            }


        }

    }
}
