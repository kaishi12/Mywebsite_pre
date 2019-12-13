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

                if (!result)
                {
                    ViewBag.Mess = "Thất bại";
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
            if (ModelState.IsValid)
            {
                if (model.UserName == "adminkaishi" && model.PassWord == "adminkaishi")
                {
                    return RedirectToAction("ListFont", "Admin");
                }
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
            ViewBag.Join = mangaService.GetListJoined(model.AccountId);
            ViewBag.Invite = manga_Details.Where(m => m.Type == 0).ToList();
            
            return View(model);

        }
        [AccountStatus]
        [HttpPost]
        public ActionResult UpdateInfo(UpdateAccountInfoModel model)
        {
            if (ModelState.IsValid)
            {
                if (AccountService.UpdateAccount(model))
                {
                    return Json(1);
                }
                else
                {        
                    return Json(0);
                }
            }
            else
            {
                return Json(0);
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
           return Json(AccountService.Search(UserName), JsonRequestBehavior.AllowGet);
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
        [AccountStatus]
        [HttpPost]
        public JsonResult UpdateAva(int AccountId,HttpPostedFileBase file)
        {
            try
            {
                var filename = Path.GetFileName(file.FileName);
                var path = Path.Combine(Server.MapPath("~/Avatar"), filename);
                file.SaveAs(path);
                AccountService.UpdateAvatar(AccountId, filename);
                return Json(1);
            }
            catch(Exception ex)
            {
                return Json(0);
            }
        }
        [AccountStatus]
        [HttpPost]
        public JsonResult UpdateStatus(int AccountId,string Status)
        {
            try
            {
                AccountService.UpdateStatus(AccountId, Status);
                return Json(1);
            }
            catch (Exception ex)
            {
                return Json(0);
            }
        }
        [AccountStatus]
        [HttpPost]
        public JsonResult UpdatePassWord(int AccountId,string OldPassWord, string PassWord)
        {
            try
            {
                if(AccountService.CheckPassWord(AccountId, OldPassWord))
                {
                   AccountService.UpdatePassWord(AccountId, PassWord);
                  return Json(1);
                }
                else
                return Json(0);
            }
            catch (Exception ex)
            {
                return Json(0);
            }
        }
    }
}