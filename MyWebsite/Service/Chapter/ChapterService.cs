﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyWebsite.ViewModels.Chapter;
using MyWebsite.Models;
using MyWebsite.Service.Notification;
using Dapper;
using MyWebsite.Service.Common;

namespace MyWebsite.Service.Chapter
{
    public class ChapterService
    {
        readonly MyWebsiteEntities data = new MyWebsiteEntities();

        public bool AddnewChapter(ChapterModel model)
        {
            try
            {
                var param = new DynamicParameters();
                param.Add("@FullName", model.FullName);
                param.Add("@OrderNumber", model.OrderNumber);
                param.Add("@MangaId", model.MangaId);
                param.Add("@CreateAt", DateTime.Now);
                param.Add("@ViewNumber", model.ViewNumber);
                param.Add("@StatusActive", 0);
                int ChapterId = DALHelpers.QueryByStored<int>("Chapter_AddNewChapter", param).FirstOrDefault();
                AddNewRawPages(model.pageModels, ChapterId);
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
                    page.StatusActive = StatusActive;
                data.SaveChanges();
                if (StatusActive == 0 && page.CategoryId == 2)
                {
                    NotificationService notificationService = new NotificationService();
                    var res = notificationService.AddnewNoticeSenpai("Upload", page.OrderNumber.Value,page.Chapter.OrderNumber.Value, page.Chapter.Manga.FullName, page.AccountId.Value,"");
                }
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
                    var res = data.Pages.SingleOrDefault(m => m.AccountId == AccountId && m.PageId_Fa == PageId);
                    if (res == null)
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
                    }
                    else
                    {
                        res.PageLink = PageLink;
                    }

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