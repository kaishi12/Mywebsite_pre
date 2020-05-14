using MyWebsite.Models;
using MyWebsite.Service.Common;
using MyWebsite.Service.Point;
using MyWebsite.ViewModels.Account;
using MyWebsite.ViewModels.Point;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyWebsite.Controllers
{


    [AccountStatus]
    public class PointController : Controller
    {
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        readonly PointService service = new PointService();
        // GET: Point
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ListPoint()
        {
            return View();
        }
        public ActionResult GetPoint()
        {
            double dt = 0, qlbd = 0, qlt = 0, upclear = 0;
            var day = "";
            AccountModel model = (AccountModel)Session["UserInfo"];
            var Point = data.PointHistories.Where(m => m.Active == true && m.AccountId == model.AccountId).GroupBy(m => m.ToDay).LastOrDefault();
            if(Point !=null)
            {
                foreach(var item in Point)
                {
                    dt += item.DTPoint.Value;
                    qlbd += item.QLBDPoint.Value;
                    qlt += item.QLTPoint.Value;
                    upclear += item.UPCLEARPoint.Value;
                }
                day = Point.LastOrDefault().ToDay.Value.ToString("dd/MM/yyyy");
            }
            return Json(new {date = day, qlt = qlt, qlbd = qlbd, dt = dt, upclear = upclear, }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetList()
        {
            AccountModel model = (AccountModel)Session["UserInfo"];
            var count = 1;
            var listmanga = data.Mangas.Where(m => m.Active == true).Select(m => new { m.MangaId, m.FullName }).ToList();
            var datatable = data.PointHistories.Where(m=>m.Active == true && m.AccountId == model.AccountId).ToList().Select(m => new IConvertible[]
              {
                count++,
                listmanga.FirstOrDefault(l=>l.MangaId == m.MangaId) != null ? listmanga.FirstOrDefault(l=>l.MangaId == m.MangaId).FullName : "N/A",
                m.QLTPoint,
                m.QLBDPoint,
                m.DTPoint,
                m.UPCLEARPoint,
                m.QLBDPoint + m.DTPoint + m.UPCLEARPoint + m.QLTPoint,
              });
            return Json(datatable, JsonRequestBehavior.AllowGet);
        }
        //public ActionResult GetListChapterbyMangaId(int Id)
        //{
        //    AccountModel model = (AccountModel)Session["UserInfo"];
        //    List<TotalPointModel> result = new List<TotalPointModel>();
        //    var manganame = data.Mangas.FirstOrDefault(m => m.MangaId == Id).FullName;
        //    var count = 1;
        //    var join = data.Manga_Detail.Where(m => m.Active == true && m.Status == (int)StatusMember.Accept && m.AccountId == model.AccountId && m.MangaId == Id).ToList();
        //    var tmpdetail = data.Chapters.Where(m => m.MangaId == Id && m.Active == true).Select(m => new { m.FullName, m.ChapterId }).ToList();
        //    foreach (var item in tmpdetail)
        //    {
        //        TotalPointModel tmp = new TotalPointModel();
        //        tmp.Count = count++;
        //        tmp.FullName = item.FullName;
        //        tmp.DtPoint = 0;
        //        tmp.QlbdPoint = 0;
        //        tmp.QltPoint = 0;
        //        tmp.UpclearPoint = 0;
        //        foreach (var role in join)
        //        {
        //            int roleid = role.RoleId;
        //            switch (roleid)
        //            {
        //                case (int)EnumRole.CM:
        //                    tmp.QltPoint += service.CalculateChapterMainPoint(item.ChapterId, (int)PointCode.QLT, model.AccountId);
        //                    break;
        //                case (int)EnumRole.TM:
        //                    tmp.QlbdPoint += service.CalculateChapterMainPoint(item.ChapterId, (int)PointCode.QLBD, model.AccountId);
        //                    break;
        //                case (int)EnumRole.TR:
        //                    tmp.DtPoint += service.CalculateChapterMainPoint(item.ChapterId, (int)PointCode.DT, model.AccountId);
        //                    break;
        //                case (int)EnumRole.UC:
        //                    tmp.UpclearPoint += service.CalculateTotalMainPoint(item.ChapterId, (int)PointCode.UPClear, model.AccountId);
        //                    break;
        //            }
        //        }
        //        result.Add(tmp);
        //    }
        //    var datatable = result.Select(m => new IConvertible[]
        //      {
        //        m.Count,
        //        m.FullName,
        //        m.QltPoint,
        //        m.QlbdPoint,
        //        m.DtPoint,
        //        m.UpclearPoint,
        //        m.QlbdPoint + m.QltPoint + m.UpclearPoint + m.DtPoint,
        //      });
        //    return Json(new { datatable = datatable,manganame = manganame }, JsonRequestBehavior.AllowGet);
        //}
    }
}