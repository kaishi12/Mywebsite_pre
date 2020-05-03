using MyWebsite.Models;
using MyWebsite.Service.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.Service.Point
{
    public class PointService
    {
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        public double CalculateTotalMainPoint(int Mangaid,int Pointid,int Accountid)
        {
            
            var chapter = data.Chapters.Where(m => m.Active == true && m.MangaId == Mangaid ).Select(m=>new { m.ChapterId ,m.ViewNumber}).ToList();
            var tmp = chapter.Select(m => m.ChapterId);
            var checks = data.Translation_Detail.Where(m => tmp.Any(temp => temp == m.ChapterId) && m.Active == true).Select(m=>m.ChapterId).ToList();
            var totalview = chapter.Sum(m => m.ViewNumber);
            var multiplepoint = data.Points.FirstOrDefault(m => m.PointId == Pointid).PointNumber;
            var point = totalview * multiplepoint;
            if(Pointid == (int)PointCode.DT)
            {
                foreach(var chap in checks)
                {
                    point += CalculateTotalTranslatePoint(Accountid);
                }
            }
            else
            if (Pointid == (int)PointCode.UPClear)
            {
                foreach (var chap in checks)
                {
                    point += CalculateTotalUploadPoint(Accountid);
                }
            }
            return point;
        }
        public double CalculateChapterMainPoint(int Chapterid, int Pointid, int Accountid)
        {
            var chapter = data.Chapters.SingleOrDefault(m => m.ChapterId == Chapterid);
            var totalview = chapter.ViewNumber;
            if(data.Translation_Detail.SingleOrDefault(m=>m.ChapterId == Chapterid && m.Active == true) == null)
            {
                return 0;
            }
            var multiplepoint = data.Points.FirstOrDefault(m => m.PointId == Pointid).PointNumber;
            var point = totalview * multiplepoint;
            if (Pointid == (int)PointCode.DT)
            {
                
                    point = CalculateChapterTranslatePoint(Accountid,Chapterid);
            }
            else
            if (Pointid == (int)PointCode.UPClear)
            {
                    point += CalculateChapterUploadPoint(Accountid,Chapterid);
            }
            return point;
        }
        private double CalculateTotalTranslatePoint(int Accountid)
        {
            var multiplepoint = data.Points.FirstOrDefault(m => m.PointId == (int)PointCode.ADT).PointNumber;
            var totaltext = data.Texts.Where(m => m.Active == true && m.Allow == true && m.AccountId == Accountid).ToList();
            return multiplepoint * totaltext.Count();
        }
        private double CalculateChapterTranslatePoint(int Accountid,int Chapterid)
        {
            var multiplepoint = data.Points.FirstOrDefault(m => m.PointId == (int)PointCode.ADT).PointNumber;
            var totaltext = data.Texts.Where(m => m.Active == true && m.Allow == true && m.AccountId == Accountid && m.TextBox.Page.ChapterId == Chapterid).ToList();
            return multiplepoint * totaltext.Count();
        }
        private double CalculateTotalUploadPoint(int Accountid)
        {
            var multiplepoint = data.Points.FirstOrDefault(m => m.PointId == (int)PointCode.AUPRAW).PointNumber;
            var totalpage = data.Pages.Where(m => m.Active == true && m.CategoryId == (int)CategoriesPage.Clear && m.AccountId == Accountid).ToList();
            return multiplepoint * totalpage.Count();
        }
        private double CalculateChapterUploadPoint(int Accountid, int Chapterid)
        {
            var multiplepoint = data.Points.FirstOrDefault(m => m.PointId == (int)PointCode.AUPRAW).PointNumber;
            var totalpage = data.Pages.Where(m => m.Active == true && m.CategoryId == (int)CategoriesPage.Clear && m.AccountId == Accountid && m.ChapterId == Chapterid).ToList();
            return multiplepoint * totalpage.Count();
        }
    }
}