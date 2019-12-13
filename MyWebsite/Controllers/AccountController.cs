using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyWebsite.Models;
using MyWebsite.ViewModels.Account;
using MyWebsite.ViewModels.Manga;
using MyWebsite.Service.Common;
using MyWebsite.Service.Account;
using System.IO;
using MyWebsite.Service.Manga;
using System.Data.SqlClient;
using Microsoft.AspNet.SignalR;

namespace MyWebsite.Controllers
{

    public class AccountController : Controller
    {
        MyWebsiteEntities data = new MyWebsiteEntities();

        AccountService AccountService = new AccountService();
        // GET: Account
        public ActionResult Index()
        {
            return View();
        }
        [AccountStatus]
        public ActionResult Home()
        {

            AccountModel model = (AccountModel)Session["UserInfo"];
            var listmanga = data.Manga_Detail.Where(m => m.AccountId == model.AccountId);
            List<Manga_Detail> listjoin = new List<Manga_Detail>();
            var listinvite = listmanga.Where(m => m.Type == 0 && m.RoleId != 1);
            var listtranslation = listmanga.Where(m => m.RoleId == 4 && m.StatusActive == 0);
            List<string> Language = new List<string>();
            ViewBag.MangaCount = listmanga.Count();
            foreach (var item in listmanga.Where(m => m.RoleId == 1))
            {

                listjoin.AddRange(data.Manga_Detail.Where(m => m.MangaId == item.MangaId && m.RoleId != 1 && m.Type == 1));
            }
            ViewBag.Join = listjoin.Count();
            ViewBag.Joined = listjoin.Where(m => m.StatusActive == 0).Count();
            ViewBag.Invite = listinvite.Count();
            ViewBag.Invited = listinvite.Where(m => m.StatusActive == 0).Count();
            ViewBag.Translation = listtranslation.Count();
            foreach (var item in listtranslation)
            {
                string language = data.Languages.SingleOrDefault(m => m.Id == item.Language).FullName;
                if (!Language.Contains(language))
                {
                    Language.Add(language);
                }
            }
            ViewBag.Language = Language;
            return View();

        }
        public ActionResult Register()
        {
            if (Session["UserInfo"] == null)
            {
                return View();
            }
            else
                return RedirectToAction("Home");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(AccountModel model)
        {
            if (ModelState.IsValid)
            {
                var result = AccountService.Register(model);

                if (result != "Sucess")
                {
                    ViewBag.Mess = result;
                    return View(model);
                }
                else
                {
                    return RedirectToAction("Login");
                }
            }
            else
            {
                return View(model);
            }
        }
        public ActionResult Login()
        {
            if (Session["UserInfo"] == null)
            {
                return View();
            }
            else
                return RedirectToAction("Home");
        }
        [HttpPost]
        public ActionResult Login(AccountModel model)
        {
            if(model.UserName == ConsSuperAcc.SuperAcc && model.PassWord == ConsSuperAcc.SuperPass)
            {
                
                    return RedirectToAction("Index", "Admin");
                
            }
            if (ModelState.IsValid)
            {
                
                var result = AccountService.Login(model);
                if (result != null)
                {

                    Session["UserInfo"] = result;
                    NotificationComponent NC = new NotificationComponent();
                    var currentTime = DateTime.Now;
                    Session["LastUpdated"] = currentTime;
                    NC.RegisterNotification(currentTime);
                    return RedirectToAction("UserManagment");
                }
                else
                {
                    ViewBag.Login = "Đăng nhập thất bại";
                    return View();
                }
            }
            else
            {
                return View();
            }
        }
        [AccountStatus]
        public ActionResult UserManagment()
        {
            MangaService mangaService = new MangaService();
            AccountModel model = (AccountModel)Session["UserInfo"];
            model = AccountService.GetAccountInfo(model.AccountId);
            Session["UserInfo"] = model;
            List<MangaDetail> manga_Details = mangaService.GetListMangaDetailByAccountId(model.AccountId);
            ViewBag.Join = manga_Details.Where(m => m.Type == 1).ToList();
            ViewBag.Invite = manga_Details.Where(m => m.Type == 0).ToList();
            return View(model);
        }
        [AccountStatus]
        [HttpPost]
        public ActionResult UserManagment(AccountModel model, HttpPostedFileBase AnhBia)
        {
            if (ModelState.IsValid)
            {
                if (AnhBia != null)
                {
                    var filename = Path.GetFileName(AnhBia.FileName);
                    var path = Path.Combine(Server.MapPath("~/Avatar"), filename);
                    AnhBia.SaveAs(path);
                    model.AvatarLink = filename;
                }
                if (AccountService.UpdateAccount(model))
                {
                    Session["UserInfo"] = model;
                    AccountModel models = (AccountModel)Session["UserInfo"];
                    return RedirectToAction("UserManagment");
                }
                else
                {
                    ViewBag.Mess = "Fail";
                    return View(model);
                }
            }
            else
            {
                return View(model);
            }
        }
        [AccountStatus]
        public ActionResult Search()
        {
            AccountModel model = (AccountModel)Session["UserInfo"];
            ViewBag.ListRole = data.Roles.Where(m => m.RoleId != 1);
            ViewBag.ListLanguage = data.Languages;
            ViewBag.ListManga = data.Manga_Detail.Where(m => m.StatusActive == 0 && m.AccountId == model.AccountId && m.RoleId == 1);
            return View();
        }
        [AccountStatus]
        [HttpPost]
        public JsonResult Search(string UserName)
        {
            List<AccountModel> list1 = new List<AccountModel>();
            string name = UserName.Replace(" ", "%");

            var list = data.Accounts.SqlQuery("select* from Account where UserName like '%" + name + "%'");
            foreach (var item in list)
            {
                AccountModel account = new AccountModel();
                account.AccountId = item.AccountId;
                account.AvatarLink = item.AvatarLink;
                account.UserName = item.UserName;
                account.Email = item.Email;
                account.PhoneNumber = item.PhoneNumber;
                list1.Add(account);
            }
            return Json(list1, JsonRequestBehavior.AllowGet);
        }
        [AccountStatus]
        [HttpPost]
        public JsonResult ChangeStatusMangaDetail(string UserName, int MangaId, int RoleId, int Status, string language)
        {
            try
            {
                var res = AccountService.ChangeStatusMangaDetail(UserName, MangaId, RoleId, Status, language);
                return Json(res);
            }
            catch
            {
                return Json(false);
            }
        }
        [AccountStatus]
        public ActionResult Logout()
        {
            Session["UserInfo"] = null;
            return RedirectToAction("Login");
        }
        [AccountStatus]
        public JsonResult GetAva()
        {
            AccountModel model = (AccountModel)Session["UserInfo"];
            return Json(model.AvatarLink, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Document()
        {
            return View();
        }
    }
}