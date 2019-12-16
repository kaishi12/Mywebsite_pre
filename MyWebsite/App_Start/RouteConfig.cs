using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace MyWebsite
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
               "ListChapter",
               "ListChapter/{MangaId}",
               new { controller = "Manga", action = "ListChapter" }
           );
            routes.MapRoute(
               "Profile",
               "ProfileUser/{username}",
               new { controller = "Account", action = "ProfileUser" }
           );
            routes.MapRoute(
               "EditorList",
               "EditorList",
               new { controller = "Contribute", action = "EditorList" }
           );
            routes.MapRoute(
               "Editor",
               "Editor/{ChapterId}/{CategoryId}",
               new { controller = "Contribute", action = "Editor", ChapterId = UrlParameter.Optional, CategoryId = UrlParameter.Optional }
           );
            routes.MapRoute(
               "Translator",
               "Translator/{ChapterId}/{PageId}/{TranslationId}",
               new { controller = "Contribute", action = "Editor", ChapterId = UrlParameter.Optional, PageId = UrlParameter.Optional, TranslationId = UrlParameter.Optional }
           );
            routes.MapRoute(
               "TranslatorList",
               "TranslatorList",
               new { controller = "Contribute", action = "TranslatorList" }
           );
            routes.MapRoute(
                "ListAllowChapter",
                "ListAllowChapter/{TranslationId}",
                new { controller = "Translation", action = "ListAllowChapter" }
            );
            routes.MapRoute(
               "TranslationManager",
               "TranslationManager/{TranslationId}/{ChapterId}/{PageId}",
               new { controller = "Translation", action = "TranslationManager" , ChapterId = UrlParameter.Optional , PageId = UrlParameter.Optional }
           );
            routes.MapRoute(
               "PageDetail",
               "PageDetail/{PageId}",
               new { controller = "Page", action = "PageDetail" }
           );
            routes.MapRoute(
               "PageSelect",
               "PageSelect/{PageId}",
               new { controller = "Page", action = "PageSelect" }
           );
            routes.MapRoute(
                "UpdateChapter",
                "UpdateChapter/{MangaId}",
                new { controller = "Chapter", action = "UpdateChapter" }
            );
            routes.MapRoute(
               "ChapterDetail",
               "ChapterDetail/{ChapterId}",
               new { controller = "Chapter", action = "ChapterDetail" }
           );
            routes.MapRoute(
              name: "UpdateManga",
              url: "UpdateManga/{MangaId}",
              defaults: new { controller = "Manga", action = "UpdateManga" }
          );
            routes.MapRoute(
                name: "Search",
                url: "Search",
                defaults: new { controller = "Account", action = "Search", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "UserManagment",
                url: "UserManagment",
                defaults: new { controller = "Account", action = "UserManagment", id = UrlParameter.Optional }
            );
          
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Account", action = "Home", id = UrlParameter.Optional }
            );
           
        }
    }
}
