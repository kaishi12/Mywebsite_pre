using MyWebsite.Models;
using PagedList;
using PagedList.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyWebsite.ViewModels.Account;
using System.Data.SqlClient;
using System.Configuration;

namespace MyWebsite.Controllers
{
    public class HomeController : Controller
    {
        MyWebsiteEntities db = new MyWebsiteEntities();

        #region TinhToan
        private int SumLuotXem(int id)
        {
            int Tong = 0;
            var sl = (from chap in db.Chapters where chap.MangaId == id select chap).ToList();
            Tong = sl.Sum(n => n.ViewNumber);
            return Tong;
        }
        private int ChapterCount(int id)
        {
            int Tong = 0;
            var sl = (from chap in db.Chapters where chap.MangaId == id select chap).ToList();
            Tong = sl.Count();
            return Tong;
        }

        public string CheckLanguage(int idManga)
        {
            var defaultLang = (from tr in db.Mangas
                               join trans in db.Translations on tr.MangaId equals trans.MangaId
                               join lang in db.Languages on trans.LanguageId equals lang.LanguageId
                               where tr.MangaId == idManga
                               select lang.Code).ToList();
            for (int i = 0; i < defaultLang.Count(); i++)
            {
                if (defaultLang.ElementAt(i).Contains("VN"))
                {
                    return defaultLang.ElementAt(i);
                }
                else
                {
                    return defaultLang.ElementAt(0);
                }
            }
            return defaultLang.ElementAt(0);
        }
        #endregion

        //Trang Chu
        #region TrangChu
        public ActionResult Slide()
        {
            List<ViewModels.Home.Slides.Slides> list = new List<ViewModels.Home.Slides.Slides>();
            var truyen = (from tr in db.Mangas
                          join chap in db.Chapters on tr.MangaId equals chap.MangaId
                          group new { tr, chap } by new { tr.MangaId, tr.FullName, tr.CoverLink, tr.Alias } into grp
                          select new ViewModels.Home.Slides.Slides
                          {
                              MangaId = grp.Key.MangaId,
                              FullName = grp.Key.FullName,
                              CoverLink = grp.Key.CoverLink,
                              Alias = grp.Key.Alias
                          }).AsEnumerable()
                          .Select(x => new ViewModels.Home.Slides.Slides
                          {
                              MangaId = x.MangaId,
                              FullName = x.FullName,
                              CoverLink = x.CoverLink,
                              ViewNumber = SumLuotXem(x.ViewNumber),
                              Alias = x.Alias,
                              DefaultLang = CheckLanguage(x.MangaId)
                          });
            ViewBag.Slide = truyen.OrderByDescending(n => n.ViewNumber).Take(12);
            return PartialView();
        }

        public ActionResult Index(int? page)
        {
            List<ViewModels.Home.Index.LastUpdatedManga> list = new List<ViewModels.Home.Index.LastUpdatedManga>();
            int pageSize = 10;
            int pageNum = (page ?? 1);
            var web = db.Mangas.OrderByDescending(n => n.UpdateAt);
            foreach (var item in web)
            {
                ViewModels.Home.Index.LastUpdatedManga manga = new ViewModels.Home.Index.LastUpdatedManga();
                manga.Alias = item.Alias;
                manga.CoverLink = item.CoverLink;
                manga.CreateAt = item.CreateAt;
                manga.MangaId = item.MangaId;
                manga.DefaultLang = CheckLanguage(item.MangaId);
                manga.FullName = item.FullName;

                List<ViewModels.Home.Index.LastestChapter> last3Chapter = new List<ViewModels.Home.Index.LastestChapter>();
                foreach (var item1 in item.Translations)
                {
                    foreach (var item2 in item1.Translation_Detail.OrderByDescending(n => n.UpdateAt).Take(3))
                    {
                        ViewModels.Home.Index.LastestChapter getChap = new ViewModels.Home.Index.LastestChapter();
                        getChap.Alias = item2.Chapter.Alias;
                        getChap.ChapterId = item2.ChapterId;
                        getChap.FullName = item2.Chapter.FullName;
                        getChap.UpdateAt = item2.UpdateAt.ToShortDateString();
                        getChap.LanguageId = item2.Translation.LanguageId;
                        getChap.LanguageName = item2.Translation.Language.Code;
                        last3Chapter.Add(getChap);
                    }
                }
                manga.Last3Chapter = last3Chapter;
                list.Add(manga);
            }
            return View(list.ToPagedList(pageNum, pageSize));
        }
        #endregion

        //Thong tin cua mot truyen
        #region MangaDetails
        public ActionResult MangaDetail(string alias, string language)
        {
            var mangaId = (from tr in db.Mangas where tr.Alias == alias select tr.MangaId).SingleOrDefault().ToString();
            Session["MangaId"] = mangaId;
            var Manga = db.Mangas.SingleOrDefault(m => m.Alias == alias);
            ViewBag.MangaAlias = alias;
            ViewBag.MangaId = mangaId;
            ViewBag.CurLang = language;
            if (Manga != null)
            {
                return View(Manga);
            }
            else
            {
                return RedirectToAction("PageError", "Error");
            }
        }

        public ActionResult MangaGenres(int id)
        {
            var theloai = (from tr in db.Mangas
                           join ctt in db.Manga_Genres on tr.MangaId equals ctt.MangaId
                           join tl in db.Genres on ctt.GenreId equals tl.GenreId
                           where tr.MangaId == id
                           select tl).ToList();
            return PartialView(theloai);
        }

        public ActionResult ViewNumber(int id)
        {
            int project = (from tr in db.Mangas where tr.MangaId == id select tr.MangaId).FirstOrDefault();
            ViewBag.View = SumLuotXem(project);
            return PartialView();
        }

        public ActionResult MangaChapter(int id, string language)
        {
            var dao = new DAO.DAOChapter();
            ViewBag.MangaId = id;
            var list = dao.GetListChapter(id, language);
            ViewBag.CurLang = language;
            return PartialView(list);
        }
        #endregion

        //Doc mot chapter cua truyen(Project) & lua chon chapter khi doc
        #region DocTruyen(DocChapter)
        public ActionResult ReadChapter(string alias, int idManga, int idChapter, string language)
        {
            var chuongtr = db.Pages.Where(m => m.ChapterId == idChapter && m.CategoryId == 1 && m.Status == 0).OrderBy(m => m.OrderNumber).ToList();
            ViewBag.MangaName = (from tr in db.Mangas where tr.MangaId == idManga select tr.FullName).FirstOrDefault().ToString();
            ViewBag.MangaAlias = (from tr in db.Mangas where tr.MangaId == idManga select tr.Alias).FirstOrDefault().ToString();
            ViewBag.ChapterAlias = alias;

            ViewBag.ChapterName = (from chtr in db.Chapters where chtr.ChapterId == idChapter select chtr.FullName).FirstOrDefault().ToString();
            ViewBag.MangaId = idManga;
            ViewBag.ChapterId = idChapter;
            ViewBag.CurLang = language;
            Chapter dbChapter = db.Chapters.Where(x => x.MangaId == idManga && x.ChapterId == idChapter).SingleOrDefault();
            dbChapter.ViewNumber++;
            db.SaveChanges();
            return View(chuongtr);
        }

        public ActionResult SelectChapter(int id, int chuong, string language)
        {
            ViewBag.MangaId = id;
            ViewBag.ChapterId = chuong;
            ViewBag.CurLang = language;
            DAO.DAOChapter dao = new DAO.DAOChapter();
            var list = dao.GetListChapter(id, language);
            var PrevChapter = dao.GetPrevChap(id, chuong, language);
            var NextChapter = dao.GetNextChap(id, chuong, language);
            ViewBag.PrevChapter = PrevChapter;
            ViewBag.NextChapter = NextChapter;
            ViewBag.ChapterList = list;

            return PartialView();
        }
        #endregion

        //Truyen cua 1 tac gia
        #region TruyenTheoTacGia
        //public ActionResult MangaByAuthor(string author, int? page)
        //{
        //    int pageSize = 10;
        //    int pageNum = (page ?? 1);
        //    ViewBag.Tacgia = author;

        //    List<ViewModels.Home.Author.MangaByAuthor> list = new List<ViewModels.Home.Author.MangaByAuthor>();
        //    var truyen = (from tr in db.Mangas where tr.Author == author select tr);
        //    foreach (var item in truyen.OrderByDescending(a => a.CreateAt))
        //    {
        //        ViewModels.Home.Author.MangaByAuthor manga = new ViewModels.Home.Author.MangaByAuthor();
        //        manga.MangaId = item.MangaId;
        //        manga.FullName = item.FullName;
        //        manga.CoverLink = item.CoverLink;
        //        manga.Description = item.Description;
        //        manga.CreateAt = item.CreateAt.ToShortDateString();
        //        manga.Author = item.Author;
        //        manga.Active = item.Active;
        //        manga.Alias = item.Alias;
        //        manga.StatusId = item.StatusId;
        //        manga.UpdateAt = item.UpdateAt.ToShortDateString();
        //        List<ViewModels.Home.Author.LastestChapter> last2Chapter = new List<ViewModels.Home.Author.LastestChapter>();
        //        foreach(var item1 in item.Translations)
        //        {
        //            foreach(var item2 in item.Chapters.OrderByDescending(n=>n.OrderNumber).Take(2))
        //            {
        //                foreach(var item3 in item2.Translation_Detail )
        //                {
        //                    ViewModels.Home.Author.LastestChapter GetChapter = new ViewModels.Home.Author.LastestChapter();
        //                    GetChapter.ChapterId = item3.Chapter.ChapterId;
        //                    GetChapter.MangaId = item3.Chapter.MangaId;
        //                    GetChapter.FullName = item3.Chapter.Manga.FullName;
        //                    GetChapter.Alias = item3.Chapter.Alias;
        //                    GetChapter.OrderNumber = item3.Chapter.OrderNumber;
        //                    GetChapter.LanguageId = item3.Translation.LanguageId;
        //                    last2Chapter.Add(GetChapter);
        //                }
        //            }
        //        }
        //        list.Add(manga);
        //    }

        //    return View(list.ToPagedList(pageNum, pageSize));
        //}
        public ActionResult MangaByAuthor(string author, int? page)
        {
            int pageSize = 10;
            int pageNum = (page ?? 1);
            ViewBag.Author = author;
            List<ViewModels.Home.Author.MangaByAuthor> list = new List<ViewModels.Home.Author.MangaByAuthor>();
            var truyen = (from tr in db.Mangas where tr.Author == author select tr);
            foreach (var item in truyen.OrderByDescending(a => a.CreateAt))
            {
                ViewModels.Home.Author.MangaByAuthor manga = new ViewModels.Home.Author.MangaByAuthor();
                manga.MangaId = item.MangaId;
                manga.FullName = item.FullName;
                manga.CoverLink = item.CoverLink;
                manga.Description = item.Description;
                manga.CreateAt = item.CreateAt.ToShortDateString();
                manga.DefaultLang = CheckLanguage(item.MangaId);
                manga.Author = item.Author;
                manga.Active = item.Active;
                manga.Alias = item.Alias;
                manga.StatusId = item.StatusId;
                manga.UpdateAt = item.UpdateAt.ToShortDateString();
                list.Add(manga);
            }

            return View(list.ToPagedList(pageNum, pageSize));
        }

        public ActionResult GetLasted2Chapter(int id)
        {
            var lay2chuong = (from tr in db.Mangas
                              join chap in db.Chapters on tr.MangaId equals chap.MangaId
                              join transd in db.Translation_Detail on chap.ChapterId equals transd.ChapterId
                              join trans in db.Translations on transd.TranslationId equals trans.TransationId
                              join lang in db.Languages on trans.LanguageId equals lang.LanguageId
                              where tr.MangaId == id
                              select new ViewModels.Home.Chapter.Get2Chapter
                              {
                                  ChapterId = chap.ChapterId,
                                  MangaId = tr.MangaId,
                                  FullName = chap.FullName,
                                  Alias = chap.Alias,
                                  OrderNumber = chap.OrderNumber,
                                  LangId = lang.Code
                              }).OrderByDescending(a => a.OrderNumber).Take(2).ToList();
            return PartialView(lay2chuong);
        }
        #endregion

        //List the loai o header va Trang xem tat ca truyen cua the loai
        #region TruyenTheoTheLoai-TheLoai
        public ActionResult Genre()
        {
            var theloai = (from tl in db.Genres select tl).OrderBy(a => a.FullName).ToList();
            return PartialView(theloai);
        }


        public ActionResult MangaByGenre(string alias, int? page)
        {
            int pageSize = 10;
            int pageNum = (page ?? 1);

            var truyen = (from tr in db.Mangas
                          join chap in db.Chapters on tr.MangaId equals chap.MangaId
                          join ctt in db.Manga_Genres on tr.MangaId equals ctt.MangaId
                          join ct in db.Genres on ctt.GenreId equals ct.GenreId
                          where ct.Alias == alias
                          group new { tr, chap } by new { tr.MangaId, tr.FullName, tr.CoverLink, tr.Author, tr.Description, tr.Alias } into grp
                          select new ViewModels.Home.Genre.MangaByGenre
                          {
                              MangaId = grp.Key.MangaId,
                              FullName = grp.Key.FullName,
                              CoverLink = grp.Key.CoverLink,
                              Author = grp.Key.Author,
                              Description = grp.Key.Description,
                              Alias = grp.Key.Alias,
                          }).AsEnumerable()
                          .Select(x => new ViewModels.Home.Genre.MangaByGenre
                          {
                              MangaId = x.MangaId,
                              FullName = x.FullName,
                              CoverLink = x.CoverLink,
                              Author = x.Author,
                              Description = x.Description,
                              Alias = x.Alias,
                              DefaultLang = CheckLanguage(x.MangaId)
                          }).OrderByDescending(a => a.FullName).ToList();

            if (truyen.Count == 0)
            {
                ViewBag.KoCoTruyen = "Yes";
                ViewBag.ThongBao = "Chưa có truyện thuộc thể loại này";
            }

            ViewBag.TheLoai = (from tl in db.Genres where tl.Alias == alias select tl.FullName).FirstOrDefault();


            return View(truyen.ToPagedList(pageNum, pageSize));
        }

        public ActionResult GetLasted1Chapter(int id)
        {
            var lay1chuong = (from tr in db.Mangas
                              join chap in db.Chapters on tr.MangaId equals chap.MangaId
                              join transd in db.Translation_Detail on chap.ChapterId equals transd.ChapterId
                              join trans in db.Translations on transd.TranslationId equals trans.TransationId
                              join lang in db.Languages on trans.LanguageId equals lang.LanguageId
                              where tr.MangaId == id
                              select new ViewModels.Home.Chapter.Get1Chapter
                              {
                                  MangaId = tr.MangaId,
                                  ChapterId = chap.ChapterId,
                                  CoverLink = tr.CoverLink,
                                  Description = tr.Description,
                                  FullNameManga = tr.FullName,
                                  FullNameChapter = chap.FullName,
                                  AliasManga = tr.Alias,
                                  AliasChapter = chap.Alias,
                                  LangId = lang.Code,
                                  OrderNumber = chap.OrderNumber
                              }).OrderByDescending(a => a.OrderNumber).Take(1).SingleOrDefault();
            return PartialView(lay1chuong);
        }
        #endregion

        //Truyen moi dang len co the ko co chapter(Manga Table)
        #region TruyenMoi
        public ActionResult NewManga()
        {
            var list = (from tr in db.Mangas
                        select new ViewModels.Home.NewManga.NewManga
                        {
                            MangaId = tr.MangaId,
                            MangaAlias = tr.Alias,
                            FullName = tr.FullName,
                            CoverLink = tr.CoverLink,
                            CreateAt = tr.CreateAt,
                        }).AsEnumerable()
                        .Select(x => new ViewModels.Home.NewManga.NewManga()
                        {
                            MangaId = x.MangaId,
                            MangaAlias = x.MangaAlias,
                            FullName = x.FullName,
                            CoverLink = x.CoverLink,
                            CreateAt = x.CreateAt,
                            DefaultLang = CheckLanguage(x.MangaId)
                        })
                        .OrderByDescending(a => a.CreateAt).Take(12);
            return PartialView(list);
        }
        #endregion

        //Tim kiem truyen
        #region Search
        // GET: TimKiem
        [HttpGet]
        public ActionResult SearchManga(string keyword, int? page)
        {
            ViewBag.TuKhoa = keyword;
            var lstKQTK = (from tr in db.Mangas
                           where tr.FullName.Contains(keyword)
                           select new ViewModels.Home.SearchManga.SearchManga
                           {
                               MangaId = tr.MangaId,
                               FullName = tr.FullName,
                               CoverLink = tr.CoverLink,
                               MangaAlias = tr.Alias,
                               Author = tr.Author
                           }).AsEnumerable()
                .Select(x => new ViewModels.Home.SearchManga.SearchManga
                {
                    MangaId = x.MangaId,
                    FullName = x.FullName,
                    CoverLink = x.CoverLink,
                    MangaAlias = x.MangaAlias,
                    Author = x.Author,
                    DefaultLang = CheckLanguage(x.MangaId)
                }).ToList();

            //Phân trang
            int pageNum = (page ?? 1);
            int pageSize = 9;
            if (lstKQTK.Count == 0)
            {
                ViewBag.ThongBao = "Không tìm thấy kết quả";
            }
            ViewBag.ThongBao = "Đã tìm thấy " + lstKQTK.Count + " kết quả";
            return View(lstKQTK.OrderBy(n => n.FullName).ToPagedList(pageNum, pageSize));
        }

        [HttpPost]
        public ActionResult SearchManga(FormCollection f, int? page)
        {
            string keyword = f["txtKeyword"].ToString();
            ViewBag.TuKhoa = keyword;

            var lstKQTK = (from tr in db.Mangas
                           where tr.FullName.Contains(keyword)
                           select new ViewModels.Home.SearchManga.SearchManga
                           {
                               MangaId = tr.MangaId,
                               FullName = tr.FullName,
                               CoverLink = tr.CoverLink,
                               MangaAlias = tr.Alias,
                               Author = tr.Author
                           }).AsEnumerable()
                .Select(x => new ViewModels.Home.SearchManga.SearchManga
                {
                    MangaId = x.MangaId,
                    FullName = x.FullName,
                    CoverLink = x.CoverLink,
                    MangaAlias = x.MangaAlias,
                    Author = x.Author,
                    DefaultLang = CheckLanguage(x.MangaId)
                }).ToList();


            //Phân trang
            int pageNum = (page ?? 1);
            int pageSize = 9;
            if (lstKQTK.Count == 0)
            {
                ViewBag.ThongBao = "Không tìm thấy kết quả";
            }
            ViewBag.ThongBao = "Đã tìm thấy " + lstKQTK.Count + " kết quả";
            return View(lstKQTK.OrderBy(n => n.FullName).ToPagedList(pageNum, pageSize));
        }



        public JsonResult ListName(string term)
        {
            var datab = (from tr in db.Mangas
                         join chap in db.Chapters
                         on tr.MangaId equals chap.MangaId
                         where tr.StatusId == 1 && tr.FullName.Contains(term)
                         group new { tr, chap } by new { tr.MangaId, tr.FullName, tr.CoverLink, tr.Alias } into grp
                         select new { grp.Key.MangaId, grp.Key.FullName, grp.Key.Alias })
                            .AsEnumerable().Select(x => new ViewModels.Home.SearchManga.ListName
                            {
                                MangaId = x.MangaId,
                                FullName = x.FullName,
                                MangaAlias = x.Alias,
                                DefaultLang = CheckLanguage(x.MangaId),
                            });

            var test = datab.Count();
            //var db=data.Truyens.Where(x => x.TenProject.Contains(term)).Select(x =>new { x.MaProject, x.TenProject });
            return Json(new
            {
                data = datab,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
        #endregion

        #region FBPage
        public ActionResult Fbpage()
        {
            return PartialView();
        }
        #endregion

        #region Bookmark
        public ActionResult BookmarkHead()
        {
            if (Session["UserInfo"] != null)
            {
                AccountModel account = (AccountModel)Session["UserInfo"];
                var data = (from tr in db.Mangas
                            join bmark in db.Bookmarks on tr.MangaId equals bmark.MangaId
                            join acc in db.Accounts on bmark.AccountId equals acc.AccountId
                            where acc.AccountId == account.AccountId
                            where bmark.SeenStatus == false
                            select new ViewModels.Home.Bookmark.BookmarkHead
                            {
                                MangaId = tr.MangaId,
                                MangaName = tr.FullName,
                                MangaAlias = tr.Alias,
                                CoverImg = tr.CoverLink,
                                UpdateDate = tr.UpdateAt.ToString()
                            }).AsEnumerable()
                            .Select(x => new ViewModels.Home.Bookmark.BookmarkHead()
                            {
                                MangaId = x.MangaId,
                                MangaName = x.MangaName,
                                MangaAlias = x.MangaAlias,
                                CoverImg = x.CoverImg,
                                SeenStatus = x.SeenStatus,
                                UpdateDate = Convert.ToDateTime(x.UpdateDate).ToShortDateString()
                            });
                ViewBag.MangaCount = data.Count();
                if (data.Count() != 0)
                {
                    ViewBag.Data = data.ToList();
                }
                else
                {
                    ViewBag.Message = "Đã xem hết truyện theo dõi";
                }

            }
            return PartialView();
        }
        public ActionResult BookmarkSpan()
        {
            AccountModel account = (AccountModel)Session["UserInfo"];
            int mangaId = Convert.ToInt32(Session["MangaId"]);
            var data = (from tr in db.Mangas
                        join bmark in db.Bookmarks on tr.MangaId equals bmark.MangaId
                        join acc in db.Accounts on bmark.AccountId equals acc.AccountId
                        where tr.MangaId == mangaId && acc.AccountId == account.AccountId
                        select bmark).FirstOrDefault();
            ViewBag.Data = data;
            return PartialView();
        }

        public ActionResult BookmarkList()
        {
            AccountModel user = (AccountModel)Session["UserInfo"];
            if (user != null)
            {
                try
                {
                    var data = (from tr in db.Mangas
                                join bmark in db.Bookmarks on tr.MangaId equals bmark.MangaId
                                join acc in db.Accounts on bmark.AccountId equals acc.AccountId
                                where acc.AccountId == user.AccountId
                                select new ViewModels.Home.Bookmark.Bookmark
                                {
                                    MangaId = tr.MangaId,
                                    MangaName = tr.FullName,
                                    MangaAlias = tr.Alias,
                                    CoverImg = tr.CoverLink,
                                    LastSeenChap = bmark.LastSeenChap,
                                    SeenStatus = bmark.SeenStatus
                                }).AsEnumerable()
                            .Select(x => new ViewModels.Home.Bookmark.Bookmark()
                            {
                                MangaId = x.MangaId,
                                MangaName = x.MangaName,
                                MangaAlias = x.MangaAlias,
                                CoverImg = x.CoverImg,
                                LastSeenChap = x.LastSeenChap,
                                SeenStatus = x.SeenStatus,
                                AllChapCount = ChapterCount(x.MangaId)
                            }).OrderBy(x => x.SeenStatus).ThenBy(x => x.MangaName).ToList();
                    ViewBag.UserId = user.AccountId;
                    if (data.Count == 0)
                    {
                        ViewBag.KoCoTruyen = "Yes";
                        ViewBag.ThongBao = "Chưa có truyện theo dõi";
                    }
                    return View(data);
                }
                catch
                {
                    ViewBag.KoCoTruyen = "Yes";
                    ViewBag.ThongBao = "Lỗi hệ thống";
                    return View();
                }
            }
            else
            {
                return RedirectToAction("Login", "Account");
            }
        }

        [HttpPost]
        public JsonResult AddBookmark()
        {
            if (Session["UserInfo"] != null)
            {
                AccountModel account = (AccountModel)Session["UserInfo"];
                int mangaId = Convert.ToInt32(Session["MangaId"]);
                Bookmark obj = new Bookmark();
                obj.MangaId = mangaId;
                obj.AccountId = account.AccountId;
                obj.LastSeenChap = ChapterCount(mangaId);
                obj.SeenStatus = true;
                db.Bookmarks.Add(obj);
                db.SaveChanges();
            }
            return Json(true, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult DelBookmark(int idManga)
        {
            if (Session["UserInfo"] != null)
            {
                AccountModel account = (AccountModel)Session["UserInfo"];
                Bookmark obj = db.Bookmarks.Where(x => x.AccountId == account.AccountId).Where(x => x.MangaId == idManga).SingleOrDefault();
                ViewBag.MangaId = idManga;
                db.Bookmarks.Remove(obj);
                db.SaveChanges();
            }
            return Json(true, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult UpdateBookmark(int idManga, int? idChapter)
        {
            if (Session["UserInfo"] != null)
            {
                AccountModel account = (AccountModel)Session["UserInfo"];
                Bookmark update = db.Bookmarks.Where(x => x.AccountId == account.AccountId).Where(x => x.MangaId == idManga).SingleOrDefault();
                if (update != null)
                {
                    int checkSeenChap;
                    if (idChapter == null)
                    {
                        checkSeenChap = ChapterCount(idManga);
                    }
                    else
                    {
                        checkSeenChap = Convert.ToInt32(db.Chapters.Where(x => x.ChapterId == idChapter).Where(x => x.MangaId == idManga).Select(x => x.OrderNumber).SingleOrDefault());
                    }
                    if (update.LastSeenChap < checkSeenChap)
                    {
                        update.LastSeenChap = checkSeenChap;
                        if (update.LastSeenChap == ChapterCount(idManga))
                        {
                            update.SeenStatus = true;
                        }
                        else
                        {
                            update.SeenStatus = false;
                        }
                        db.SaveChanges();
                    }
                }
            }
            return Json(true, JsonRequestBehavior.AllowGet);
        }
        #endregion
    }
}