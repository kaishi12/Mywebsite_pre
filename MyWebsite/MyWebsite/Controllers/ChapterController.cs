﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyWebsite.ViewModels.Account;
using MyWebsite.ViewModels.Chapter;
using MyWebsite.Service.Chapter;
using MyWebsite.Models;

namespace MyWebsite.Controllers
{
    public class ChapterController : Controller
    {
        // GET: Chapter
        readonly ChapterService chapterService = new ChapterService();
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ChapterDetail(int ChapterId)
        {
            var chapter = data.Chapters.FirstOrDefault(m => m.ChapterId == ChapterId);
            
            return View(chapter);
        }
        public ActionResult Create(int MangaId)
        {
            ViewBag.MangaId = MangaId;
            return View();
        }
        [HttpPost]
        public ActionResult Create(ChapterModel model, HttpPostedFileBase[] AnhTrang, string PageOrderNumber, string PageFullName)
        {
            if (Session["UserInfo"] != null)
            {
                AccountModel account = (AccountModel)Session["UserInfo"];
                if (ModelState.IsValid)
                {
                    string[] ListOrderNumber = PageOrderNumber.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                    string[] ListFullName = PageFullName.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);


                    List<PageModel> pageModels = new List<PageModel>();
                    for (int i = 0; i < AnhTrang.Count(); i++)
                    {
                        PageModel pageModel = new PageModel();
                        var filename = Path.GetFileName(AnhTrang[i].FileName);
                        var path = Path.Combine(Server.MapPath("~/PageLink"), filename);
                        AnhTrang[i].SaveAs(path);
                        pageModel.AccountId = account.AccountId;
                        pageModel.PageLink = filename;
                        pageModel.OrderNumber = int.Parse(ListOrderNumber[i]);
                        pageModel.FullName = ListFullName[i];
                        pageModels.Add(pageModel);
                    }
                    model.pageModels = pageModels;
                    if (chapterService.AddnewChapter(model))
                    {
                        return RedirectToAction("ListChapter", "Manga", new { MangaId = model.MangaId });
                    }
                    else
                    {
                        return View(model);
                    }
                }
                else
                {
                    return RedirectToAction("Index", "User");
                }
            }
            else
                return RedirectToAction("Login", "Account");
        }
        [HttpPost]
        public JsonResult UpdateLinkPage(HttpPostedFileBase fileupload)
        {
            var PageId = int.Parse(Request.Form["PageId"]);
            var filename = Path.GetFileName(fileupload.FileName);
            var path = Path.Combine(Server.MapPath("~/PageLink"), filename);
            fileupload.SaveAs(path);
            string PageLink = filename;
            if (chapterService.UpdateRawPage(PageId, PageLink,-1))
            {
                return Json(true);
            }
            else
            {
                return Json("fail");
            }
        }
        [HttpPost]
        public JsonResult UpdateStatusPage(int PageId,int StatusActive)
        {
            if (chapterService.UpdateRawPage(PageId, "", StatusActive))
            {
                return Json("Success");
            }
            else
            {
                return Json("fail");
            }
        }
        [HttpPost]
        public ActionResult UpdateInfoChapter(ChapterModel model)
        {
            int a = 0;
            return View();
        }
        [HttpPost]
        public ActionResult AddNewPage(Chapter model,string PageOrderNumber, string PageFullName, HttpPostedFileBase[] AnhTrang)
        {
            if (Session["UserInfo"] != null)
            {
                AccountModel account = (AccountModel)Session["UserInfo"];
                
                    string[] ListOrderNumber = PageOrderNumber.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                    string[] ListFullName = PageFullName.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);


                    List<PageModel> pageModels = new List<PageModel>();
                    for (int i = 0; i < AnhTrang.Count(); i++)
                    {
                        PageModel pageModel = new PageModel();
                        var filename = Path.GetFileName(AnhTrang[i].FileName);
                        var path = Path.Combine(Server.MapPath("~/PageLink"), filename);
                        AnhTrang[i].SaveAs(path);
                        pageModel.AccountId = account.AccountId;
                        pageModel.PageLink = filename;
                        pageModel.OrderNumber = int.Parse(ListOrderNumber[i]);
                        pageModel.FullName = ListFullName[i];
                        pageModels.Add(pageModel);
                    }
                    
                    if (chapterService.AddNewRawPages(pageModels,model.ChapterId))
                    {
                        return RedirectToAction("ListChapter", "Manga", new { MangaId = model.MangaId });
                    }
                    else
                    {
                        return View(model);
                    }
               
            }
            else
                return RedirectToAction("Login", "Account");
        }
        public JsonResult AddNewCleartextPage(HttpPostedFileBase fileupload)
        {
            if (Session["UserInfo"] != null)
            {
                AccountModel account = (AccountModel)Session["UserInfo"];
                var PageId = int.Parse(Request.Form["PageId"]);
                var filename = Path.GetFileName(fileupload.FileName);
                var path = Path.Combine(Server.MapPath("~/PageLink"), filename);
                fileupload.SaveAs(path);
                string PageLink = filename;
                var res = chapterService.AddNewCleartextPage(account.AccountId, PageId, PageLink);
                return Json(res);
                
            }
            else
                return Json(3);
        }
        
    }
}