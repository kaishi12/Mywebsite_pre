using MyWebsite.Models;
using MyWebsite.Service.Account;
using MyWebsite.ViewModels.Account;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace MyWebsite.Service.Common
{
    public class ObjectAttribute : AuthorizeAttribute
    {

        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        AccountService AccountService = new AccountService();
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            try
            {
                var routeValues = HttpContext.Current.Request.RequestContext.RouteData.Values;
                var accInfo = CheckObject(routeValues);
                return accInfo;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            var userInfoSession = filterContext.HttpContext.Session["UserInfo"];
            if (userInfoSession == null)
            {
                filterContext.Result = new RedirectToRouteResult(new
                    RouteValueDictionary(new { controller = "Account", action = "Login" }));
                return;
            }
            filterContext.Result = new ViewResult
            {
                ViewName = "~/Views/Shared/AccountStatusRestriction.cshtml"
            };
        }

        private bool CheckObject(RouteValueDictionary routeValues)
        {
            var userInfoSession = (AccountModel)HttpContext.Current.Session["UserInfo"];
            if (routeValues["controller"].ToString() == "Manga")
            {
                if (routeValues["action"].ToString() == "ListChapter")
                {
                    int mangaid = int.Parse(routeValues["MangaId"].ToString());
                    if (data.Manga_Detail.SingleOrDefault(m => m.MangaId == mangaid && m.AccountId == userInfoSession.AccountId && m.RoleId == 1) != null)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                if (routeValues["action"].ToString() == "UpdateManga")
                {
                    int mangaid = int.Parse(routeValues["MangaId"].ToString());
                    if (data.Manga_Detail.SingleOrDefault(m => m.MangaId == mangaid && m.AccountId == userInfoSession.AccountId && m.RoleId == 1) != null)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            if (routeValues["controller"].ToString() == "Chapter")
            {
                if (routeValues["action"].ToString() == "ChapterDetail")
                {
                    int chapterid = int.Parse(routeValues["ChapterId"].ToString());
                    int mangaid = data.Chapters.SingleOrDefault(m => m.ChapterId == chapterid).MangaId.Value;
                    if (data.Manga_Detail.SingleOrDefault(m => m.MangaId == mangaid && m.AccountId == userInfoSession.AccountId && m.RoleId == 1) != null)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            if (routeValues["controller"].ToString() == "Page")
            {
                int pageid = int.Parse(routeValues["PageId"].ToString());
                int mangaid = data.Pages.SingleOrDefault(m => m.PageId == pageid).Chapter.MangaId.Value;
                if (data.Manga_Detail.SingleOrDefault(m => m.MangaId == mangaid && m.AccountId == userInfoSession.AccountId && m.RoleId == 1) != null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            if (routeValues["controller"].ToString() == "Translation")
            {
                int translationmanagerid = int.Parse(routeValues["TranslationId"].ToString());
               
                if (data.Translations.SingleOrDefault(m => m.TransationId == translationmanagerid && m.AccountId == userInfoSession.AccountId) != null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            return false;
        }
    }
}