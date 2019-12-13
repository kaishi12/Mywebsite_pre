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

namespace MyWebsite.Controllers
{
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
            if (Session["UserInfo"] != null)
            {
                ViewBag.Genre = from row in data.Genres select row;
                ViewBag.Status = from row in data.Status select row;
                return View();
            }
            else
            {
                return RedirectToAction("Login", "Account");
            }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateManga(MangaModel model, HttpPostedFileBase AnhBia)
        {
            if (Session["UserInfo"] != null)
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
                    if (accountService.AddNewRole(model.MangaId, accountModel.AccountId, 1) && model.MangaId > -1)
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
            else
            {
                return RedirectToAction("Login", "Account");
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
            if (Session["UserInfo"] != null)
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
            else
            {
                return RedirectToAction("Login", "Account");
            }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UpdateManga(MangaModel model, HttpPostedFileBase AnhBia)
        {
            if (Session["UserInfo"] != null)
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
            else
            {
                return RedirectToAction("Login", "Account");
            }
        }
        public ActionResult ListManga()
        {
            if (Session["UserInfo"] != null)
            {
                AccountModel accountModel = (AccountModel)Session["UserInfo"];
                List<Models.Manga> list = MangaService.GetListMangaByAccountId(accountModel.AccountId,1);
                return View(list);
            }
            else
            {
                return RedirectToAction("Login", "Account");
            }
        }
        public ActionResult ListMangaJoin()
        {
            if (Session["UserInfo"] != null)
            {
                AccountModel accountModel = (AccountModel)Session["UserInfo"];
                List<MangaJoin> list = MangaService.GetListMangaJoinByAccountId(accountModel.AccountId);
                return View(list);
            }
            else
            {
                return RedirectToAction("Login", "Account");
            }
        }
        public ActionResult ListChapter(int MangaId)
        {
            if (Session["UserInfo"] != null)
            {
                var list = data.Chapters.Where(m => m.MangaId == MangaId).ToList();
                //ViewBag.RawCount =  list.Where(m => m.CategoryId == 1 && m.StatusActive == 0).Count()
                ViewBag.MangaId = MangaId;
                return View(list);
            }
            else
            {
                return RedirectToAction("Login", "Account");
            }
        }
        [HttpPost]
        public JsonResult Search(string Name)
        {
            AccountModel accountModel = (AccountModel)Session["UserInfo"];
            List<MangaJoin> mangaJoins = MangaService.Search(accountModel.AccountId, Name);
            return Json(mangaJoins, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult Join(int id,string role,int language,int type,int? AccountId)
        {
            
            if (Session["UserInfo"] != null)
            {
                AccountModel accountModel = (AccountModel)Session["UserInfo"];
                if(AccountId != null)
                {
                    accountModel.AccountId = AccountId.Value;
                }
                if(MangaService.CheckJoin(accountModel.AccountId,id,role) == true)
                { 
                int res = MangaService.Join(accountModel.AccountId,id,role,language,type);
                return Json(res);
                }
                else
                {
                    return Json(2);
                }
            }
            else
            return Json(3);
        }
    }
}