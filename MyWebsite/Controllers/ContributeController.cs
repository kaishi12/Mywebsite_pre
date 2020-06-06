using MyWebsite.Models;
using MyWebsite.Service.Chapter;
using MyWebsite.Service.Common;
using MyWebsite.Service.Manga;
using MyWebsite.ViewModels.Account;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.Mvc;
using System.Web.UI.WebControls;

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
            var list = MangaService.GetListMangaByAccountIdandRoleId(accountModel.AccountId, (int)EnumRole.UC);
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
                chapter = data.Chapters.FirstOrDefault(m => m.Active == true);
            }
            else
            {
                chapter = data.Chapters.FirstOrDefault(m => m.ChapterId == ChapterId);
            }
            var chapterlist = data.Chapters.Where(m => m.MangaId == chapter.MangaId && m.Active == true);
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
            var list = MangaService.GetListMangaByAccountIdandRoleId(accountModel.AccountId, (int)EnumRole.TR);
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
                chapterlist = data.Chapters.Where(m => m.MangaId == Firstpage.Chapter.MangaId && m.Active == true).ToList();
                var list = data.Pages.Where(m => m.ChapterId == Firstpage.ChapterId && m.CategoryId == 1 && m.Active == true);
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
            int mangaid = chapterlist[0].MangaId;
            var Language = data.Translations.Where(m => m.MangaId == mangaid);
            if (data.Translations.SingleOrDefault(m => m.TransationId == TranslationId).Active == false)
            {
                ViewBag.Block = 1;
            }
            var fonts = data.Fonts.Where(m => m.Active == true);
            var textbox = Firstpage.TextBoxes.Where(m => m.Active == true).ToList();
            List<Models.TextBox> textBoxes = new List<Models.TextBox>();
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
           
            ViewBag.PageClear = data.Pages.SingleOrDefault(p => p.PageId_Fa == PageId && p.Active == true);
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
                        if(item.FontSize == 0)
                            Text.FontSize = 16;
                        else
                        Text.FontSize = item.FontSize;
                        Text.FontId = item.FontId;
                        Text.Bold = item.Bold;
                        if(item.ColorText == null)
                        {
                            Text.ColorText = "#000000";
                        }
                        else
                        Text.ColorText = item.ColorText;
                        data.SaveChanges();
                    }
                    else
                    {
                        if (item.Active)
                        {
                            if(item.FontId == 0)
                            {
                                item.FontId = data.Fonts.FirstOrDefault().FontId;
                            }
                            else
                            item.FontId = item.FontId;
                            if(item.FontSize == 0)
                            {
                                item.FontSize = 16;
                            }
                            if (item.ColorText == null)
                            {
                                item.ColorText = "#000000";
                            }
                            

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
            var Textbox = data.TextBoxes.Where(m => m.PageId == PageId && m.Active == true);
            List<ViewModels.Text.Text> Data = new List<ViewModels.Text.Text>();
            ViewModels.Text.Text newtext = new ViewModels.Text.Text();
            foreach (var item in Textbox)
            {
                var text = data.Texts.SingleOrDefault(m => m.TranslationId == TranslationId && m.Active == true && m.TextBoxId == item.TextBoxId);
                if (text != null)
                {
                    var cor = item.Coordinate.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    newtext.text = text.TextContent;
                    newtext.CorX = int.Parse(cor[0]);
                     newtext.CorY = int.Parse(cor[1]);
                    newtext.Height = item.Height;
                    newtext.Witdh = item.Witdh;
                    newtext.Italic = text.Italic ;
                    newtext.Bold = text.Bold;
                    newtext.Font = text.Font.FullName;
                    newtext.Degrees = item.Degree;
                    newtext.Size = text.FontSize;
                    newtext.color = text.ColorText;
                    Data.Add(newtext);
                }

            }
            return Json(Data, JsonRequestBehavior.AllowGet);
        }
    }

}
