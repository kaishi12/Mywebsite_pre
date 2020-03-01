using MyWebsite.Models;
using MyWebsite.Service.Account;
using MyWebsite.Service.Common;
using MyWebsite.Service.Language;
using MyWebsite.Service.Manga;
using MyWebsite.ViewModels.Account;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyWebsite.Controllers
{

    public class AccountController : Controller
    {
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        readonly MangaService MangaService = new MangaService();
        readonly AccountService AccountService = new AccountService();
        // GET: Account
        public ActionResult Index()
        {
            return View();
        }
        [AccountStatus]
        public ActionResult Home()
        {
            try
            {
                AccountModel model = (AccountModel)Session["UserInfo"];
                //Danh sách truyện đã đăng kí theo vai trò
                ViewBag.ListMangaCreated = MangaService.GetListMangaByAccountIdandRoleId(model.AccountId, (int)EnumRole.CM).Take(3);
                ViewBag.ListMangaWithTranslateRole = MangaService.GetListMangaByAccountIdandRoleId(model.AccountId, (int)EnumRole.TR).Take(3);
                ViewBag.ListMangaWithEditorRole = MangaService.GetListMangaByAccountIdandRoleId(model.AccountId, (int)EnumRole.UC).Take(3);
                ViewBag.ListMangaWithTranslationManagerRole = MangaService.GetListMangaByAccountIdandRoleId(model.AccountId, (int)EnumRole.TM).Take(3);

                //Danh sách truyện vừa tạo
                ViewBag.ListNewManga = MangaService.GetListNewManga().Take(5);

                ViewBag.ListLanguage = LanguageService.GetListLanguage();




                //Các thể loại Danh sách đơn gửi tới người dùng(bản rút gọn)
                var listMangaOwned = data.Manga_Detail.Where(m => m.AccountId == model.AccountId && m.RoleId == 1).Select(m => m.MangaId);
                List<Manga_Detail> ListRequestByPeople = new List<Manga_Detail>();
                List<Manga_Detail> ListRequestToPeople = new List<Manga_Detail>();
                List<Manga_Detail> ListRequestByYou = new List<Manga_Detail>();

                if (ListRequestByPeople.Count() <= 5)
                    ListRequestByPeople
                    .AddRange(
                    data.Manga_Detail
                                    .Where(m => m.Type == 0 && listMangaOwned.Any(l => l == m.MangaId) && m.Active == true && m.Status == (int)StatusMember.Wait)
                                    .OrderBy(m => m.CreateAt)
                                    .Take(5)
                            );
                if (ListRequestToPeople.Count() <= 5)
                    ListRequestToPeople
                    .AddRange(
                    data.Manga_Detail
                                    .Where(m => m.AccountId != model.AccountId && listMangaOwned.Any(l => l == m.MangaId) && m.Type == 1 && m.Status == (int)StatusMember.Wait && m.Active == true)
                                    .OrderBy(m => m.CreateAt)
                                    .Take(5)
                            );
                if (ListRequestByYou.Count() <= 5)
                    ListRequestByYou.AddRange(data.Manga_Detail.Where(m => m.AccountId == model.AccountId && m.Type == (int)EnumTypeMember.Join && !listMangaOwned.Any(ma => m.MangaId != ma) && m.Active == true).OrderBy(m => m.CreateAt).Take(3));
                ViewBag.ListRequestToPeople = ListRequestToPeople;
                ViewBag.ListRequestByYou = ListRequestByYou;
                ViewBag.ListRequestByPeople = ListRequestByPeople;
                ViewBag.ListRequestToYou = data.Manga_Detail.Where(m => m.Type == (int)EnumTypeMember.Invite && m.RoleId != 1 && m.AccountId == model.AccountId && m.Active == true).OrderBy(m => m.CreateAt).Take(3).ToList();
                ///
                var listmanga = data.Manga_Detail.Where(m => m.AccountId == model.AccountId);
                List<Manga_Detail> listjoin = new List<Manga_Detail>();
                var listinvite = listmanga.Where(m => m.Type == 0 && m.RoleId != 1);
                var listtranslation = listmanga.Where(m => m.RoleId == (int)EnumRole.TM && m.Active == true);
                ViewBag.MangaCount = listmanga.Count();
                foreach (var item in listmanga.Where(m => m.RoleId == 1))
                {

                    listjoin.AddRange(data.Manga_Detail.Where(m => m.MangaId == item.MangaId && m.RoleId != 1 && m.Type == 1));
                }
                ViewBag.Join = listjoin.Count();
                ViewBag.Joined = listjoin.Where(m => m.Active == true).Count();
                ViewBag.Invite = listinvite.Count();
                ViewBag.Invited = listinvite.Where(m => m.Active == true).Count();
                ViewBag.Translation = listtranslation.Count();
                var listlanguageid = listtranslation.Where(m => m.Language != null).Select(m => m.Language);
                var language = data.Languages.Where(m => listlanguageid.Any(l => l == m.LanguageId)).Select(m => m.FullName).ToList();
                ViewBag.Language = language;

                return View();
            }
            catch (Exception ex)
            {
                return RedirectToAction("PageError", "Error");
            }
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


            AccountModel model = (AccountModel)Session["UserInfo"];
            model = AccountService.GetAccountInfo(model.AccountId);
            Session["UserInfo"] = model;
            ViewBag.PeopleJoin = MangaDetailService.GetPeopleJoinManga(model.AccountId);
            ViewBag.Join = MangaService.GetListJoined(model.AccountId);
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
                    return Json(true, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(false, JsonRequestBehavior.AllowGet);
                }
            }
            else
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }
        [AccountStatus]
        public ActionResult Search()
        {
            AccountModel model = (AccountModel)Session["UserInfo"];
            ViewBag.ListRole = data.Roles.Where(m => m.RoleId != 1).ToList();
            ViewBag.ListLanguage = data.Languages.ToList();
            ViewBag.ListManga = data.Manga_Detail.Where(m => m.Active == true && m.AccountId == model.AccountId && m.RoleId == 1).ToList();
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
        public JsonResult ChangeStatusMangaDetail(string UserName, int MangaId, int RoleId, int Status, int language)
        {
            try
            {
                var res = AccountService.ChangeStatusMangaDetail(UserName, MangaId, RoleId, Status, language);
                return Json(res, JsonRequestBehavior.AllowGet);
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
        public JsonResult UpdateAva(int AccountId, HttpPostedFileBase file)
        {
            try
            {
                var filename = Path.GetFileName(file.FileName);
                var path = Path.Combine(Server.MapPath("~/Avatar"), filename);
                file.SaveAs(path);
                AccountService.UpdateAvatar(AccountId, filename);
                return Json(1);
            }
            catch (Exception ex)
            {
                return Json(0);
            }
        }
        [AccountStatus]
        [HttpPost]
        public JsonResult UpdateStatus(int AccountId, string Status)
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
        public JsonResult UpdatePassWord(int AccountId, string OldPassWord, string PassWord)
        {
            try
            {
                if (AccountService.CheckPassWord(AccountId, OldPassWord))
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
        /// <summary>
        /// Người A xem thông tin account của người B
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public ActionResult ProfileUser(string username)
        {
            var model = AccountService.GetProfile(username);
            ViewBag.Join = MangaService.GetListJoined(model.AccountId);
            return View(model);
        }

        /// <summary>
        /// Yêu cầu gia nhập truyện của bạn tạo ra
        /// </summary>
        /// <returns></returns>
        public ActionResult ListRequestByPeople()
        {
            AccountModel model = (AccountModel)Session["UserInfo"];
            var listMangaOwned = data.Manga_Detail.Where(m => m.AccountId == model.AccountId && m.RoleId == 1).Select(m => m.MangaId);
            List<Manga_Detail> ListRequestByPeople = new List<Manga_Detail>();

           
                ListRequestByPeople.AddRange(data.Manga_Detail.Where(m => m.Type == 0 && listMangaOwned.Any(l=>l==m.MangaId)).OrderBy(m => m.CreateAt));
            
            return View(ListRequestByPeople);
        }
        /// <summary>
        /// Yêu cầu gia nhập truyện của người ta gửi đến bạn
        /// </summary>
        /// <returns></returns>
        public ActionResult ListRequestToYou()
        {
            AccountModel model = (AccountModel)Session["UserInfo"];
            var ListRequestToYou = data.Manga_Detail.Where(m => m.Type == 1 && m.RoleId != 1 && m.AccountId == model.AccountId).OrderBy(m => m.CreateAt);
            return View(ListRequestToYou);
        }
        /// <summary>
        /// Yêu cầu gia nhập truyện của bạn do bạn gửi tới người ta
        /// </summary>
        /// <returns></returns>
        public ActionResult ListRequestToPeople()
        {
            AccountModel model = (AccountModel)Session["UserInfo"];
            var listMangaOwned = data.Manga_Detail.Where(m => m.AccountId == model.AccountId && m.RoleId == 1).Select(m => m.MangaId);
            List<Manga_Detail> ListRequestToPeople = new List<Manga_Detail>();

            foreach (var item in listMangaOwned)
            {
                ListRequestToPeople.AddRange(data.Manga_Detail.Where(m => m.AccountId != model.AccountId && m.MangaId == item && m.Type == 1).OrderBy(m => m.CreateAt));
            }
            return View(ListRequestToPeople);
        }
        /// <summary>
        /// Yêu cầu gia nhập truyện của người ta do bạn gửi
        /// </summary>
        /// <returns></returns>
        public ActionResult ListRequestByYou()
        {
            AccountModel model = (AccountModel)Session["UserInfo"];
            var listMangaOwned = data.Manga_Detail.Where(m => m.AccountId == model.AccountId && m.RoleId == 1).Select(m => m.MangaId);
            var ListRequestByYou = data.Manga_Detail.Where(m => m.AccountId == model.AccountId && m.Type == 1 && !listMangaOwned.Any(ma => m.MangaId != ma)).OrderBy(m => m.CreateAt);
            return View(ListRequestByYou);
        }

    }
}