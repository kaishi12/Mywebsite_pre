using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyWebsite.ViewModels.Chapter;
using MyWebsite.Models;
namespace MyWebsite.Service.Chapter
{
    public class ChapterService
    {
        readonly MyWebsiteEntities data = new MyWebsiteEntities();

        public bool AddnewChapter(ChapterModel model)
        {
            try
            {
                Models.Chapter chapter = new Models.Chapter();
                chapter.CreateAt = DateTime.Now;
                chapter.FullName = model.FullName;
                chapter.OrderNumber = model.OrderNumber;
                chapter.MangaId = model.MangaId;

                chapter.StatusActive = 0;
                chapter.ViewNumber = 0;
                data.Chapters.Add(chapter);
                data.SaveChanges();
                AddNewRawPages(model.pageModels, chapter.ChapterId);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool AddNewRawPages(List<PageModel> pageModels, int ChapterId)
        {
            try
            {
                foreach (var item in pageModels)
                {
                    Page page = new Page();
                    page.FullName = item.FullName;
                    page.OrderNumber = item.OrderNumber;
                    page.AccountId = item.AccountId;
                    page.CreateAt = DateTime.Now;
                    page.PageLink = item.PageLink;
                    page.StatusActive = 0;
                    page.CategoryId = 1;
                    page.ChapterId = ChapterId;
                    data.Pages.Add(page);
                    data.SaveChanges();
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool UpdateRawPage(int PageId, string PageLink, int StatusActive)
        {
            try
            {
                Page page = data.Pages.SingleOrDefault(m => m.PageId == PageId);
                if (PageLink != "")
                    page.PageLink = PageLink;
                if (StatusActive != -1)
                {
                    page.StatusActive = StatusActive;
                }
                data.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public int AddNewCleartextPage(int AccountId, int PageId, string PageLink)
        {
            try
            {
                var pageFA = data.Pages.SingleOrDefault(m => m.PageId == PageId && m.StatusActive == 0);
                if (pageFA != null)
                {
                    Page page = new Page();
                    page.PageId_Fa = PageId;
                    page.OrderNumber = pageFA.OrderNumber;
                    page.CategoryId = 2;
                    page.AccountId = AccountId;
                    page.ChapterId = pageFA.ChapterId;
                    page.CreateAt = DateTime.Now;
                    page.FullName = pageFA.FullName + "-Clear-text-";
                    page.PageLink = PageLink;
                    page.StatusActive = 1;
                    data.Pages.Add(page);
                    data.SaveChanges();
                    return 1;
                }
                else
                    return 0;
            }
            catch (Exception ex)
            {
                return 2;
            }
        }

    }
}