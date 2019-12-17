using MyWebsite.Models;
using MyWebsite.Service.Chapter;
using MyWebsite.Service.Common;
using MyWebsite.Service.Manga;
using MyWebsite.ViewModels.Account;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyWebsite.Controllers
{
    [AccountStatus]
    public class ContributeController : Controller
    {
        readonly MangaService MangaService = new MangaService();
        readonly ChapterService ChapterService = new ChapterService();
        
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        // GET: Contribute
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult EditorList()
        {

            AccountModel accountModel = (AccountModel)Session["UserInfo"];
            var list = MangaService.GetListMangaByAccountId(accountModel.AccountId, "Ed");
            foreach(var item in list)
            {
                item.FirstChapter = ChapterService.GetFirstChapter(item.MangaId);
            }
            return View(list);

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

            AccountModel accountModel = (AccountModel)Session["UserInfo"];
            var list = MangaService.GetListMangaByAccountId(accountModel.AccountId, "Tr");
            foreach (var item in list)
            {
                item.FirstPage = ChapterService.GetFirstPage(item.MangaId);
            }
            return View(list);

        }
        public ActionResult Translator(int? ChapterId, int? PageId, int? TranslationId)
        {
            AccountModel accountModel = (AccountModel)Session["UserInfo"];
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
                chapterlist = data.Chapters.Where(m => m.MangaId == Firstpage.Chapter.MangaId && m.StatusActive == 0).ToList();
                var list = data.Pages.Where(m => m.ChapterId == Firstpage.ChapterId && m.CategoryId == 1 && m.StatusActive == 0);
                foreach (var item in list)
                {
                    dict.Add(item.PageId, item.FullName);
                }
            }
            else
            {
                ViewBag.ChapterId = ChapterId;
                chapterlist = data.Chapters.Where(m => m.MangaId == data.Chapters.FirstOrDefault(n => n.ChapterId == ChapterId).MangaId && m.StatusActive == 0).ToList();
                var list = data.Pages.Where(m => m.ChapterId == ChapterId && m.CategoryId == 1 && m.StatusActive == 0).ToList();
                foreach (var item in list)
                {
                    dict.Add(item.PageId, item.FullName);
                }
            }
            if (TranslationId == null)
            {
                TranslationId = data.Translations.FirstOrDefault().TransationId;
            }
            if (PageId == null)
            {
                var pagene = dict.FirstOrDefault().Key;
                Firstpage = data.Pages.SingleOrDefault(p => p.PageId == pagene);
                PageId = Firstpage.PageId;
            }
            int mangaid = chapterlist[0].MangaId.Value;
            var Language = data.Translations.Where(m => m.MangaId == mangaid);
            if (data.Translations.SingleOrDefault(m => m.TransationId == TranslationId).StatusActive == 1)
            {
                ViewBag.Block = 1;
            }
            var fonts = data.Fonts.Where(m => m.StatusActive == 0);
            var textbox = Firstpage.TextBoxes.Where(m => m.StatusActive == 0).ToList();
            List<TextBox> textBoxes = new List<TextBox>();
            foreach (var text in textbox)
            {
                text.Texts.Clear();
                Text textadd = data.Texts.SingleOrDefault(m => m.AccountId == accountModel.AccountId && m.TranslationId == TranslationId && m.TextBoxId == text.TextBoxId);
                if (textadd != null)
                {
                    text.Texts.Add(textadd);
                }

            }
            textBoxes = textbox;

            ViewBag.TranslationId = TranslationId;
            ViewBag.MangaFullName = chapterlist.FirstOrDefault().Manga.FullName;
            ViewBag.Language = Language;
            ViewBag.Font = fonts;
            ViewBag.TextBox = textBoxes;
            ViewBag.Text = listtext;
            ViewBag.listpage = dict;
            ViewBag.FirstFontType = fonts.First().Type.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
            ViewBag.PageClear = data.Pages.SingleOrDefault(p => p.PageId_Fa == PageId && p.StatusActive == 0);
            ViewBag.chapterlist = chapterlist;
            return View(Firstpage);
        }
        public ActionResult ContributeList()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddNewTexts(List<Text> model)
        {
            try
            {
                AccountModel accountModel = (AccountModel)Session["UserInfo"];
                foreach (var item in model)
                {
                    if (item.TextId != 0)
                    {
                        var Text = data.Texts.SingleOrDefault(m => m.TextId == item.TextId);
                        Text.TextContent = item.TextContent;
                        Text.Italic = item.Italic;
                        Text.FontSize = item.FontSize;
                        Text.FontId = item.FontId;
                        Text.Bold = item.Bold;
                        Text.ColorText = item.ColorText;
                        data.SaveChanges();
                    }
                    else
                    {
                        if (item.StatusActive == 1)
                        {
                            item.FontId = data.Fonts.FirstOrDefault().FontId;
                            item.ColorText = "red";
                            item.Bold = 400;
                            item.Italic = "0";
                            item.FontSize = 24;
                        }
                        item.AccountId = accountModel.AccountId;
                        data.Texts.Add(item);
                        data.SaveChanges();
                    }
                }

                return Json(true);
            }
            catch (Exception ex)
            {
                return Json(false);
            }

        }
        [HttpPost]
        public JsonResult GetTextByTrans(int TranslationId, int PageId)
        {
            var Textbox = data.TextBoxes.Where(m => m.PageId == PageId && m.StatusActive == 0);
            List<ViewModels.Text.Text> Data = new List<ViewModels.Text.Text>();
            ViewModels.Text.Text newtext = new ViewModels.Text.Text();
            foreach (var item in Textbox)
            {
                var text = data.Texts.SingleOrDefault(m => m.TranslationId == TranslationId && m.StatusActive == 0 && m.TextBoxId == item.TextBoxId);
                if (text != null)
                {
                    var cor = item.Coordinate.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    newtext.text = text.TextContent;
                    newtext.CorX = int.Parse(cor[0]);
                     newtext.CorY = int.Parse(cor[1]);
                    newtext.Height = item.Height.Value;
                    newtext.Witdh = item.Witdh.Value;
                    newtext.Italic = int.Parse(text.Italic);
                    newtext.Bold = text.Bold.Value;
                    newtext.Font = text.Font.FullName;
                    newtext.Degrees = item.Degree.Value;
                    newtext.Size = text.FontSize.Value;
                    newtext.color = text.ColorText;
                    Data.Add(newtext);
                }

            }
            return Json(Data, JsonRequestBehavior.AllowGet);
        }
    }

}