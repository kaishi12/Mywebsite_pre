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

            ViewBag.Genre = data.Genres.Where(m=>m.Active == true).ToList();
            ViewBag.Status =data.Status.Where(m => m.Active == true).ToList();
            return View();

        }
        [HttpPost]
         public ActionResult CreateManga(MangaModel model, HttpPostedFileBase AnhBia)
        {
            try
            {
                  ViewBag.Genre = data.Genres.Where(m => m.Active == true);
                ViewBag.Status = data.Status.Where(m => m.Active == true);
                if (AnhBia != null)
                {
                    var filename = model.Alias + ".png";
                    var path = Path.Combine(Server.MapPath("~/Cover"), filename);
                    AnhBia.SaveAs(path);
                    model.CoverLink = filename;
                }
                if (ModelState.IsValid)
                {
                    model.MangaId = MangaService.AddnewManga(model);
                    if (model.MangaId == -1)
                    {
                        return RedirectToAction("Result", new { MangaId = model.MangaId, Status = 0 });
                    }
                    if (!MangaGenreService.AddNewManga_Genres(model.MangaId, model.ListGenre.ToList()))
                        return RedirectToAction("Result", new { MangaId = model.MangaId, Status = 0 });


                    AccountModel accountModel = (AccountModel)Session["UserInfo"];
                    data.Manga_Detail.Add(new Manga_Detail
                    {
                        MangaId = model.MangaId,
                        AccountId = accountModel.AccountId,
                        RoleId = (int)EnumRole.CM,
                        Type = (int)EnumTypeMember.Create,
                        Active = true,
                        CreateAt = DateTime.Now,
                        Language = -1,
                        Status = (int)StatusMember.Accept
                    });
                    data.SaveChanges();
                    return RedirectToAction("Result", new { MangaId = model.MangaId, Status = 0 });
                }
                else
                {
                    return View(model);
                }
            }
            catch (Exception ex)
            {
                return RedirectToAction("Result", new { MangaId = model.MangaId, Status = 1 });
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
           var list = MangaService.GetListMangaByAccountIdandRoleId(accountModel.AccountId, (int)EnumRole.CM);
            var translation = data.Translations.Where(m => m.Active).ToList();
            foreach(var item in list)
            {
                item.TransCount = translation.Where(m => m.MangaId == item.MangaId).Count();
            }    
            var chapter = data.Chapters.Where(m => m.Active == true).GroupBy(m => m.MangaId).Select(m => new { id = m.Key, count = m.Count(), totalview = m.Sum(l => l.ViewNumber) }).ToList();
            foreach(var item in list)
            {
                item.ChapterCount = chapter.FirstOrDefault(m => m.id == item.MangaId) == null ? 0 : chapter.FirstOrDefault(m => m.id == item.MangaId).count;
                item.TotalView = chapter.FirstOrDefault(m => m.id == item.MangaId) == null ? 0 : chapter.FirstOrDefault(m => m.id == item.MangaId).totalview;
            }
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

            var list = data.Chapters.Where(m => m.MangaId == MangaId).OrderBy(m=>m.OrderNumber).ToList();
            
            
            //ViewBag.RawCount =  list.Where(m => m.CategoryId == 1 && m.StatusActive == 0).Count()
            ViewBag.MangaId = MangaId;
            ViewBag.FullName = data.Mangas.FirstOrDefault(m => m.MangaId == MangaId).FullName;
            return View(list);

        }
        [HttpPost]
        public JsonResult Search(string Name)
        {
             AccountModel accountModel = (AccountModel)Session["UserInfo"];
            return Json(MangaService.Search(accountModel.AccountId, Name), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult Join(int id, int role, int language, int type, int? AccountId)
        {


            AccountModel accountModel = (AccountModel)Session["UserInfo"];
            int accid = accountModel.AccountId;
            if(AccountId != null)
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
        public ActionResult ListAllManga(int page,int sort,string genre,string status)
        {
            var list = data.Mangas.Where(m => m.Active == true);
            if (genre != null)
            {
                var idgenre = data.Genres.FirstOrDefault(m => m.Alias == genre).GenreId;
                list = list.Where(m => m.Manga_Genres.Where(g => g.GenreId == idgenre) != null);
            }
            if (status != null && status != "all")
            {
                var idstat = data.Status.FirstOrDefault(m => m.Alias == status).StatusId;
                list = list.Where(m => m.StatusId == idstat);
            }
            if (sort == (int)SortManga.AZ)
            {
                list = list.OrderBy(m => m.FullName);
            }
            else if(sort == (int)SortManga.ZA)
            {
                list = list.OrderByDescending(m => m.FullName);
            }
            else if(sort == (int)SortManga.Update)
            {
                list = list.OrderByDescending(m => m.UpdateAt);
            }
            
            ViewBag.List = list.Select(m=> new ListAllMangaFistLoad { MangaId = m.MangaId,CoverLink = m.CoverLink,FullName = m.FullName }).Skip((int)MangaPerPage.number * (page-1)).Take((int)MangaPerPage.number).ToList();
            ViewBag.Page = Math.Ceiling((double)data.Mangas.Where(m => m.Active == true).Count() / (double)MangaPerPage.number);
            ViewBag.Status = data.Status.Where(m => m.Active).Select(m => new StatusModelManga { StatusId = m.StatusId, FullName = m.FullName, Alias = m.Alias }).ToList();
           var Genres = data.Genres.Where(m => m.Active).Select(m => new GenresModelManga { GenreId = m.GenreId, FullName = m.FullName, Description = m.Description,Alias = m.Alias }).ToList();
            foreach(var item in Genres)
            {
                item.Alias = Url.Action("ListAllManga", "Manga", new { page = page, sort = sort, genre = item.Alias, status = status }).ToString();
            }
            ViewBag.Genres = Genres;
            return View();
        }
        public ActionResult GetInfoListManga(int page, int sort, string genre, string status)
        {
            var list = data.Mangas.Where(m => m.Active == true);
            if (genre != "")
            {
                var idgenre = data.Genres.FirstOrDefault(m => m.Alias == genre).GenreId;
                list = list.Where(m => m.Manga_Genres.Where(g => g.GenreId == idgenre) != null);
            }
            if (status != "" && status != "all")
            {
                var idstat = data.Status.FirstOrDefault(m => m.Alias == status).StatusId;
                list = list.Where(m => m.StatusId == idstat);
            }
            if (sort == (int)SortManga.AZ)
            {
                list = list.OrderBy(m => m.FullName);
            }
            else if (sort == (int)SortManga.ZA)
            {
                list = list.OrderByDescending(m => m.FullName);
            }
            else if (sort == (int)SortManga.Update)
            {
                list = list.OrderByDescending(m => m.UpdateAt);
            }

            var info = list.Skip((int)MangaPerPage.number * (page - 1)).Take((int)MangaPerPage.number);
            var listmanga = new List<ListMangaDetail>();

            foreach(var item in info)
            {
                var manga = new ListMangaDetail();
                manga.MangaId = item.MangaId;
                manga.FullName = item.FullName;
                manga.Description = item.Description;
                manga.Author = item.Author;
                var genres = item.Manga_Genres.Where(m => m.Active == true).Select(m => new GenresModelManga { GenreId = m.GenreId, FullName = m.Genre.FullName }).ToList();
                manga.genres = genres;
                manga.View = item.Chapters.Sum(m => m.ViewNumber);
                listmanga.Add(manga);
            }

            return Json(listmanga, JsonRequestBehavior.AllowGet);
        }
        public ActionResult MangaProfile(int id)
        {
            ViewBag.ListRole = data.Roles.Where(m => m.RoleId != 1).ToList();
            ViewBag.ListLanguage = data.Languages.ToList();
            var manga = data.Mangas.Find(id);
            var realmanga = new ListMangaDetail();
            realmanga.MangaId = manga.MangaId;
            realmanga.FullName = manga.FullName;
            realmanga.Description = manga.Description;
            realmanga.Author = manga.Author;
            realmanga.Image = manga.CoverLink;
            var genres = manga.Manga_Genres.Where(m => m.Active == true).Select(m => new GenresModelManga { GenreId = m.GenreId, FullName = m.Genre.FullName }).ToList();
            ViewBag.Genre = genres;
            realmanga.View = manga.Chapters.Sum(m => m.ViewNumber);
            ViewBag.Manga = realmanga;
            return View();
        }
        public ActionResult GetInfoJoin(int id)
        {
            var list = data.Manga_Detail.Where(m => m.Active == true && m.MangaId == id && m.Status ==(int) StatusMember.Accept).Select(m=> new InfoJoinModel { RoleId = m.RoleId,AccountId = m.AccountId, LanguageId = m.Language,UserName = m.Account.UserName});
            var Ql = list.FirstOrDefault(m => m.RoleId == (int)EnumRole.CM);
            var DT = list.Where(m => m.RoleId == (int)EnumRole.TR);
            var UC = list.Where(m => m.RoleId == (int)EnumRole.UC);
            var TM = list.Where(m => m.RoleId == (int)EnumRole.TM).ToList();
            var listlanguage = data.Languages.Where(m => m.Active == true).ToList();
            foreach(var item in TM)
            {
                item.Language = listlanguage.FirstOrDefault(m => m.LanguageId == item.LanguageId).FullName;
            }
            return Json(new { ql = Ql, dt = DT, uc = UC, tm = TM }, JsonRequestBehavior.AllowGet);
        }
        public class StatusModelManga
        {
            public int StatusId { get; set; }
            public string FullName { get; set; }
            public string Alias { get; set; }
        }
        public class GenresModelManga
        {
            public int GenreId { get; set; }
            public string FullName { get; set; }
            public string Description { get; set; }
            public string Alias { get; set; }
        }
        public class ListMangaDetail
        {
            public int MangaId { get; set; }
            public string FullName { get; set; }
            public string Description { get; set; }
            public string Author { get; set; }
            public int View { get; set; }
            public string Image { get; set; }
            public List<GenresModelManga> genres { get; set; }
        }
        public class ListAllMangaFistLoad
        {
            public int MangaId { get; set; }
            public string FullName { get; set; }
            public string CoverLink { get; set; }
        }
        public class InfoJoinModel
        {
            public int AccountId { get; set; }
            public string UserName { get; set; }
            public int RoleId { get; set; }
            public int? LanguageId { get; set; }
            public string Language { get; set; }
        }
        
    }
}