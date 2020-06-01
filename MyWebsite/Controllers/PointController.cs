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
            var Point = data.PointHistories.Where(m => m.Active == true && m.AccountId == model.AccountId).GroupBy(m => m.ToDay).ToList().LastOrDefault();
            if (Point != null)
            {
                foreach (var item in Point)
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
            var datatable = data.PointHistories.Where(m=>m.Active == true && m.AccountId == model.AccountId).GroupBy(m => m.ToDay).ToList().LastOrDefault().Select(m => new IConvertible[]
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
        
    }
}