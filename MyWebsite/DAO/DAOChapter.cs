using MyWebsite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.DAO
{
    public class DAOChapter
    {
        MyWebsiteEntities db = null;
        public DAOChapter()
        {
            db = new MyWebsiteEntities();
        }

        public List<ViewModels.Home.MangaDetail.ListChapter> GetListChapter(int maproject, string language)
        {
            var listtruyen = (from chap in db.Chapters
                              join transd in db.Translation_Detail on chap.ChapterId equals transd.ChapterId
                              join trans in db.Translations on transd.TranslationId equals trans.TransationId
                              join lang in db.Languages on trans.LanguageId equals lang.LanguageId
                              where chap.MangaId == maproject && lang.Code == language
                              select chap).OrderByDescending(a => a.OrderNumber).ToList();
            List<ViewModels.Home.MangaDetail.ListChapter> chuongtruyens = new List<ViewModels.Home.MangaDetail.ListChapter>();

            foreach (var truyen in listtruyen)
            {
                ViewModels.Home.MangaDetail.ListChapter chuongtruyen1 = new ViewModels.Home.MangaDetail.ListChapter();
                chuongtruyen1.FullName = truyen.FullName;        

                chuongtruyen1.CreateAt = truyen.CreateAt.ToShortDateString();
                chuongtruyen1.ViewNumber = truyen.ViewNumber;
                chuongtruyen1.ChapterId = truyen.ChapterId;
                chuongtruyen1.MangaId = truyen.MangaId;
                chuongtruyen1.Alias = truyen.Alias;
                chuongtruyens.Add(chuongtruyen1);

            }
            return chuongtruyens;
        }

        public Chapter GetNextChap(int maproject, int machuong, string language)
        {
            var listchuongtruyen = (from chap in db.Chapters
                                    join transd in db.Translation_Detail on chap.ChapterId equals transd.ChapterId
                                    join trans in db.Translations on transd.TranslationId equals trans.TransationId
                                    join lang in db.Languages on trans.LanguageId equals lang.LanguageId
                                    where chap.MangaId == maproject && lang.Code == language
                                    select chap).OrderBy(a => a.OrderNumber).ToList();
            var chuongtruyen = new Chapter();
            var count = listchuongtruyen.Count();
            int i = 0;
            foreach (var item in listchuongtruyen)
            {
                if (item.ChapterId == machuong)
                {

                    if (i != count - 1)
                    {
                        chuongtruyen = listchuongtruyen[i + 1];
                        return chuongtruyen;
                    }

                }
                i++;
            }
            return null;
        }

        public Chapter GetPrevChap(int maproject, int machuong, string language)
        {
            var listchuongtruyen = (from chap in db.Chapters
                                    join transd in db.Translation_Detail on chap.ChapterId equals transd.ChapterId
                                    join trans in db.Translations on transd.TranslationId equals trans.TransationId
                                    join lang in db.Languages on trans.LanguageId equals lang.LanguageId
                                    where chap.MangaId == maproject && lang.Code == language
                                    select chap).OrderBy(a => a.OrderNumber).ToList();
            var chuongtruyen = new Chapter();

            int i = 0;
            foreach (var item in listchuongtruyen)
            {
                if (item.ChapterId == machuong)
                {
                    if (i == 0)
                    {
                        break;
                    }
                    else
                    {
                        chuongtruyen = listchuongtruyen[i - 1];
                        return chuongtruyen;
                    }


                }
                i++;
            }
            return null;

        }

        public List<ViewModels.Home.Chapter.GetLastedChapter> Get2Chapter(int maproject)
        {
            var lay2chuong = (from tr in db.Mangas
                             join chap in db.Chapters on tr.MangaId equals chap.MangaId
                             join transd in db.Translation_Detail on chap.ChapterId equals transd.ChapterId
                             join trans in db.Translations on transd.TranslationId equals trans.TransationId
                             join lang in db.Languages on trans.LanguageId equals lang.LanguageId
                             where tr.MangaId == maproject
                             select new ViewModels.Home.Chapter.GetLastedChapter
                             {
                                 ChapterId = chap.ChapterId,
                                 MangaId = tr.MangaId,
                                 FullName = chap.FullName,
                                 Alias = chap.Alias,
                                 OrderNumber = chap.OrderNumber,
                                 LanguageId = lang.Code
                             }).OrderByDescending(a => a.OrderNumber).Take(2).ToList();
            return lay2chuong;
        }

        public List<ViewModels.Home.Chapter.GetLastedChapter> Get1Chapter(int maproject)
        {
            var lay1chuong = (from tr in db.Mangas
                              join chap in db.Chapters on tr.MangaId equals chap.MangaId
                              join transd in db.Translation_Detail on chap.ChapterId equals transd.ChapterId
                              join trans in db.Translations on transd.TranslationId equals trans.TransationId
                              join lang in db.Languages on trans.LanguageId equals lang.LanguageId
                              where tr.MangaId == maproject
                              select new ViewModels.Home.Chapter.GetLastedChapter
                              {
                                  ChapterId = chap.ChapterId,
                                  MangaId = tr.MangaId,
                                  FullName = chap.FullName,
                                  Alias = chap.Alias,
                                  OrderNumber = chap.OrderNumber,
                                  LanguageId = lang.Code
                              }).OrderByDescending(a => a.OrderNumber).Take(1).ToList();
            return lay1chuong;
        }
    }
}