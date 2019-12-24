using MyWebsite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyWebsite.ViewModels.Manga;
using MyWebsite.Service.Manga;
using MyWebsite.Service.Account;
using MyWebsite.ViewModels.Account;
using System.IO;
using MyWebsite.Service.Common;

namespace MyWebsite.Controllers
{
    [AccountStatus]
    public class MangaController : Controller
    {
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        readonly MangaService MangaService = new MangaService();
        // GET: Manga
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult CreateManga()
        {

            ViewBag.Genre = from row in data.Genres select row;
            ViewBag.Status = from row in data.Status select row;
            return View();

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateManga(MangaModel model, HttpPostedFileBase AnhBia)
        {

            ViewBag.Genre = from row in data.Genres select row;
            ViewBag.Status = from row in data.Status select row;
            if (AnhBia != null)
            {
                var filename = Path.GetFileName(AnhBia.FileName);
                var path = Path.Combine(Server.MapPath("~/Cover"), filename);
                AnhBia.SaveAs(path);
                model.CoverLink = filename;
            }
            if (ModelState.IsValid)
            {
                model.MangaId = MangaService.AddnewManga(model);
                AccountService accountService = new AccountService();
                AccountModel accountModel = (AccountModel)Session["UserInfo"];
                if (MangaDetailService.AddNewRole(model.MangaId, accountModel.AccountId, 1,null,null) && model.MangaId > -1)
                {
                    return RedirectToAction("Result", new { MangaId = model.MangaId, Status = 0 });
                }
                else
                {
                    return RedirectToAction("Result", new { MangaId = model.MangaId, Status = 1 });
                }
            }
            else
            {
                return View(model);
            }

        }
        public ActionResult Result(int MangaId, int Status)
        {
            if (Status == 0)
            {
                ViewBag.Mess = "Success";
                ViewBag.MangaId = MangaId;
            }
            else
            {
                ViewBag.Mess = "Fail";
            }
            return View();
        }
      
       public ActionResult UpdateManga(int MangaId)
        {

            string list = "";
            ViewBag.Genre = from row in data.Genres select row;
            ViewBag.Status = from row in data.Status select row;
            MangaModel manga = MangaService.GetMangaModel(MangaId);
            foreach (var item in manga.ListGenre)
            {
                list += "," + item;
            }
            ViewBag.ListGenre = list;
            return View(manga);

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UpdateManga(MangaModel model, HttpPostedFileBase AnhBia)
        {

            ViewBag.Genre = from row in data.Genres select row;
            ViewBag.Status = from row in data.Status select row;
            if (AnhBia != null)
            {
                var filename = Path.GetFileName(AnhBia.FileName);
                var path = Path.Combine(Server.MapPath("~/Cover"), filename);
                AnhBia.SaveAs(path);
                model.CoverLink = filename;
            }
            if (ModelState.IsValid && MangaService.UpdateManga(model))
            {
                return RedirectToAction("ListManga");
            }
            else
            {

                return View(model);
            }


        }
        public ActionResult ListManga()
        {
            AccountModel accountModel = (AccountModel)Session["UserInfo"];
           var list = MangaService.GetListMangaByAccountId(accountModel.AccountId, "MC");
            return View(list);

        }
        public ActionResult ListMangaJoin()
        {

            AccountModel accountModel = (AccountModel)Session["UserInfo"];
            var list = data.Manga_Detail.Where(m => m.AccountId == accountModel.AccountId);
            List<int> listmanga = new List<int>();
            foreach(var item in list)
            {
                if(!listmanga.Contains(item.MangaId))
                {
                    listmanga.Add(item.MangaId);
                }
            }
            ViewBag.ListManga = listmanga;
            return View(list);

        }
        [Object]
        public ActionResult ListChapter(int MangaId)
        {

            var list = data.Chapters.Where(m => m.MangaId == MangaId);
            foreach (var item in list)
            {
                var fullname = item.Manga.FullName;
            }
            //ViewBag.RawCount =  list.Where(m => m.CategoryId == 1 && m.StatusActive == 0).Count()
            ViewBag.MangaId = MangaId;
            return View(list);

        }
        [HttpPost]
        public JsonResult Search(string Name)
        {
            AccountModel accountModel = (AccountModel)Session["UserInfo"];
            return Json(MangaService.Search(accountModel.AccountId, Name), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult Join(int id, string role, string language, int type, int? AccountId)
        {


            AccountModel accountModel = (AccountModel)Session["UserInfo"];
            int accid = accountModel.AccountId;
            if(AccountId!= null)
            {
                accid = AccountId.Value;
            }
           if (MangaDetailService.CheckJoin(accid, id, role) != true)
            {
                int res = MangaService.Join(accid, id, role, language, type);
                return Json(res);
            }
            else
            {
                return Json(2);
            }

        }
        [HttpPost]
        public JsonResult CheckNameManga(string FullName)
        {
           
            if (MangaService.CheckNameManga(FullName))
            {
                return Json(false);
            }
            else
                return Json(true);
        }
    }
}