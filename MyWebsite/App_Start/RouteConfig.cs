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
            
            //Account
            routes.MapRoute("Login","Login",new { controller = "Account", action = "Login" });
            routes.MapRoute("Register", "Register", new { controller = "Account", action = "Register" });
            routes.MapRoute("Profile", "ProfileUser/{username}",new { controller = "Account", action = "ProfileUser" });
            routes.MapRoute("UserManagment", "UserManagment", new { controller = "Account", action = "UserManagment" });
            routes.MapRoute("Search", "Search", new { controller = "Account", action = "Search" });
            routes.MapRoute("Home", "Home", new { controller = "Account", action = "Home" });

            //Manga
            routes.MapRoute("ListChapter","ListChapter/{MangaId}",new { controller = "Manga", action = "ListChapter" });
            routes.MapRoute("UpdateManga", "UpdateManga/{MangaId}", new { controller = "Manga", action = "UpdateManga" });
            routes.MapRoute("CreateManga", "CreateManga", new { controller = "Manga", action = "CreateManga" }); 
            routes.MapRoute("ListMangaJoin", "ListMangaJoin", new { controller = "Manga", action = "ListMangaJoin" });
            routes.MapRoute("ListManga", "ListManga", new { controller = "Manga", action = "ListManga" });

            //Contribute
            routes.MapRoute("EditorList","EditorList", new { controller = "Contribute", action = "EditorList" });
            routes.MapRoute("Editor","Editor/{ChapterId}/{CategoryId}", new { controller = "Contribute", action = "Editor", ChapterId = UrlParameter.Optional, CategoryId = UrlParameter.Optional });
            routes.MapRoute("Translator","Translator/{ChapterId}/{PageId}/{TranslationId}",new { controller = "Contribute", action = "Editor", ChapterId = UrlParameter.Optional, PageId = UrlParameter.Optional, TranslationId = UrlParameter.Optional });
            routes.MapRoute("TranslatorList","TranslatorList",new { controller = "Contribute", action = "TranslatorList" });
            
            //TranslationManager
            routes.MapRoute("ListAllowChapter","ListAllowChapter/{TranslationId}",new { controller = "Translation", action = "ListAllowChapter" });
            routes.MapRoute("TranslationManager","TranslationManager/{TranslationId}/{ChapterId}/{PageId}", new { controller = "Translation", action = "TranslationManager" , ChapterId = UrlParameter.Optional , PageId = UrlParameter.Optional });
            routes.MapRoute("TranslationList", "TranslationList", new { controller = "Translation", action = "ListManga" });
           
            //Page
            routes.MapRoute("PageDetail","PageDetail/{PageId}",new { controller = "Page", action = "PageDetail" });
            routes.MapRoute( "PageSelect", "PageSelect/{PageId}",new { controller = "Page", action = "PageSelect" });
            
            //Chapter
            routes.MapRoute("UpdateChapter","UpdateChapter/{MangaId}",new { controller = "Chapter", action = "UpdateChapter" });
            routes.MapRoute("ChapterDetail","ChapterDetail/{ChapterId}",new { controller = "Chapter", action = "ChapterDetail" });

            //ListDetailMangaRole
            routes.MapRoute("ListRequestByPeople", "ListRequestByPeople", new { controller = "Account", action = "ListRequestByPeople" });
            routes.MapRoute("ListRequestToPeople", "ListRequestToPeople", new { controller = "Account", action = "ListRequestToPeople" });
            routes.MapRoute("ListRequestToYou", "ListRequestToYou", new { controller = "Account", action = "ListRequestToYou" });
            routes.MapRoute("ListRequestByYou", "ListRequestByYou", new { controller = "Account", action = "ListRequestByYou" });

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Account", action = "Login", id = UrlParameter.Optional }
            );
           
        }
    }
}
