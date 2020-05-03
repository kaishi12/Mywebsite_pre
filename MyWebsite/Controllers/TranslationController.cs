using MyWebsite.Models;
using MyWebsite.Service.Common;
using MyWebsite.Service.Manga;
using MyWebsite.Service.Notification;
using MyWebsite.ViewModels.Account;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyWebsite.Controllers
{
    [AccountStatus]
    public class TranslationController : Controller
    {
        readonly MangaService MangaService = new MangaService();
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        // GET: Translation
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ListManga()
        {

            AccountModel accountModel = (AccountModel)Session["UserInfo"];
            var list = data.Translations.Where(m => m.AccountId == accountModel.AccountId && m.Active == true);
            return View(list);

        }
        [Object]
        public ActionResult TranslationManager(int? ChapterId, int? PageId, int TranslationId)
        {
            AccountModel accountModel = (AccountModel)Session["UserInfo"];
            ViewBag.AccountId = accountModel.AccountId;
            Page Firstpage = new Page();
            List<Chapter> chapterlist = new List<Chapter>();
            IDictionary<int, string> dict = new Dictionary<int, string>();
            List<Text> listtext = new List<Text>();
            if (PageId != null)
            {
                Firstpage = data.Pages.SingleOrDefault(p => p.PageId == PageId);
            }
            if (ChapterId == null)
            {
                chapterlist = data.Chapters.Where(m => m.MangaId == Firstpage.Chapter.MangaId && m.Active == true).ToList();
                var list = data.Pages.Where(m => m.ChapterId == Firstpage.ChapterId && m.CategoryId == 1 && m.Active == true).ToList();
                foreach (var item in list)
                {
                    dict.Add(item.PageId, item.FullName);
                }
            }
            else
            {
                ViewBag.ChapterId = ChapterId;
                chapterlist = data.Chapters.Where(m => m.MangaId == data.Chapters.FirstOrDefault(n => n.ChapterId == ChapterId).MangaId && m.Active == true).ToList();
                var list = data.Pages.Where(m => m.ChapterId == ChapterId && m.CategoryId == 1 && m.Active == true).ToList();
                foreach (var item in list)
                {
                    dict.Add(item.PageId, item.FullName);
                }
            }
            if (PageId == null)
            {
                var pagene = dict.FirstOrDefault().Key;
                Firstpage = data.Pages.SingleOrDefault(p => p.PageId == pagene);
                PageId = Firstpage.PageId;
            }

            ViewBag.MangaFullName = chapterlist.FirstOrDefault().Manga.FullName;
            ViewBag.Traslation = data.Translations.SingleOrDefault(m => m.TransationId == TranslationId);
            ViewBag.listpage = dict;
            ViewBag.PageClear = data.Pages.SingleOrDefault(p => p.PageId_Fa == PageId && p.Active == true);
            ViewBag.chapterlist = chapterlist;
            return View(Firstpage);
        }
        public JsonResult AllowText(int Id, int TextBoxId)
        {
            try
            {
                var Text = data.Texts.SingleOrDefault(m => m.TextId == Id);
                var Translationid = Text.TranslationId;
                var Trans = data.Texts.SingleOrDefault(m => m.TextBoxId == TextBoxId && m.TranslationId == Translationid && m.Allow == true);
                if (Trans != null)
                {
                    Trans.Allow = false;
                }
                Text.Allow = true;
                NotificationService notificationService = new NotificationService();
                var res = notificationService.AddnewNoticeSenpai("Trans", Text.TextBox.Page.Chapter.OrderNumber, Text.TextBox.Page.OrderNumber, Text.Translation.Manga.FullName, Text.AccountId, Text.Translation.Language.FullName);
                data.SaveChanges();
                return Json(true);
            }
            
            catch(Exception ex)
            {
                return Json(false);
            }
        }
        [Object]
        public ActionResult ListAllowChapter(int TranslationId)
        {
            var res = data.Translations.SingleOrDefault(m => m.TransationId == TranslationId);
            ViewBag.TranslationId = TranslationId;
            var listchapter = res.Manga.Chapters.Where(m => m.Active == true);
            return View(listchapter);
        }
        public JsonResult AllowChapter(int TranslationId, int ChapterId, bool Status)
        {
            try
            {
                var res = data.Translation_Detail.SingleOrDefault(m => m.TranslationId == TranslationId && m.ChapterId == ChapterId);
                if (res != null)
                {
                    res.Active = true;
                    res.UpdateAt = DateTime.Now;
                    data.SaveChanges();
                }
                else
                {
                    Translation_Detail translation_Detail = new Translation_Detail();
                    translation_Detail.ChapterId = ChapterId;
                    translation_Detail.TranslationId = TranslationId;
                    translation_Detail.Active = Status;
                    translation_Detail.UpdateAt = DateTime.Now;
                    translation_Detail.CreateAt = DateTime.Now;
                    data.Translation_Detail.Add(translation_Detail);
                    data.SaveChanges();
                }
               
                return Json(true);
            }
            catch (Exception ex)
            {
                return Json(false);
            }
        }

    }
}