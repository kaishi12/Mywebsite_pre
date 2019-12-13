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
        public ActionResult Register()
        {
            return View();
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
            return View();
        }
        [HttpPost]
        public ActionResult Login(AccountModel model)
        {
            if (ModelState.IsValid)
            {
                var result = AccountService.Login(model);
                if (result != null)
                {

                    Session["UserInfo"] = result;
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

        public ActionResult UserManagment()
        {
            if (Session["UserInfo"] != null)
            {
                MangaService mangaService = new MangaService();
                AccountModel model = (AccountModel)Session["UserInfo"];
                model = AccountService.GetAccountInfo(model.AccountId);
                List<MangaDetail> manga_Details = mangaService.GetListMangaDetailByAccountId(model.AccountId);
                ViewBag.Join = manga_Details.Where(m=>m.Type == 1 && m.RoleId != 1).ToList();
                ViewBag.Invite = manga_Details.Where(m => m.Type == 0 && m.RoleId != 1).ToList();
                return View(model);
            }
            else
            {
                return RedirectToAction("Login");
            }
        }
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
        public ActionResult Search()
        {
            if (Session["UserInfo"] != null)
            {
                
                AccountModel model = (AccountModel)Session["UserInfo"];
                ViewBag.ListRole = data.Roles.Where(m => m.RoleId != 1).ToList();
                ViewBag.ListLanguage = data.Languages.ToList();

                ViewBag.ListManga = data.Manga_Detail.Where(m=>m.StatusActive==0 && m.AccountId == model.AccountId && m.RoleId == 1).ToList();
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }
        }
        [HttpPost]
        public JsonResult Search(string UserName)
        {
            List<AccountModel> list1 = new List<AccountModel>();
            string name = UserName.Replace(" ", "%");

            var list = data.Accounts.SqlQuery("select* from Account where UserName like '%" + name + "%'").ToList();
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
        [HttpPost]
        public JsonResult ChangeStatusMangaDetail(string UserName,int MangaId,int RoleId,int Status)
        {
            try { 
            var res = data.Manga_Detail.SingleOrDefault(m => m.Account.UserName == UserName && m.MangaId == MangaId && m.RoleId == RoleId);
            res.StatusActive = Status;
            data.SaveChanges();
            return Json(true);
            }
            catch (Exception ex)
            {
                return Json(false);
            }
        }
        public ActionResult Logout()
        {
            Session["UserInfo"] = null;
            return RedirectToAction("Login");
        }
    }
}