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
            AccountModel model = (AccountModel)Session["UserInfo"];
            var Roles = data.Manga_Detail.Where(m => m.Active == true && m.AccountId == model.AccountId && m.Status == (int)StatusMember.Accept).ToList();
            foreach (var role in Roles)
            {
                int mangaid = role.MangaId, roleid = role.RoleId;
                switch (roleid)
                {
                    case (int)EnumRole.CM:
                        qlt += service.CalculateTotalMainPoint(mangaid, (int)PointCode.QLT, model.AccountId);
                        break;
                    case (int)EnumRole.TM:
                        qlbd += service.CalculateTotalMainPoint(mangaid, (int)PointCode.QLBD, model.AccountId);
                        break;
                    case (int)EnumRole.TR:
                        dt += service.CalculateTotalMainPoint(mangaid, (int)PointCode.DT, model.AccountId);
                        break;
                    case (int)EnumRole.UC:
                        upclear += service.CalculateTotalMainPoint(mangaid, (int)PointCode.UPClear, model.AccountId);
                        break;
                }
            }

            return Json(new { qlt = qlt, qlbd = qlbd, dt = dt, upclear = upclear, }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetList()
        {
            AccountModel model = (AccountModel)Session["UserInfo"];
            List<TotalPointModel> result = new List<TotalPointModel>();
            var count = 1;
            var join = data.Manga_Detail.Where(m => m.Active == true && m.Status == (int)StatusMember.Accept && m.AccountId == model.AccountId).ToList();
            var mangadetail = data.Manga_Detail
                              .Where(m => m.Active == true && m.RoleId == (int)EnumRole.CM)
                              .Select(m => m.MangaId).ToList();
            var tmpdetail = data.Mangas.Where(m => mangadetail.Any(d => d == m.MangaId)).Select(m => new { m.FullName, m.MangaId }).ToList();
            foreach (var item in mangadetail)
            {
                TotalPointModel tmp = new TotalPointModel();
                tmp.Count = count++;
                tmp.FullName = tmpdetail.FirstOrDefault(m => m.MangaId == item).FullName;
                tmp.DtPoint = 0;
                tmp.QlbdPoint = 0;
                tmp.QltPoint = 0;
                tmp.UpclearPoint = 0;
                tmp.MangaId = item;
                foreach (var role in join.Where(m => m.MangaId == item))
                {
                    int mangaid = role.MangaId, roleid = role.RoleId;
                    switch (roleid)
                    {
                        case (int)EnumRole.CM:
                            tmp.QltPoint += service.CalculateTotalMainPoint(mangaid, (int)PointCode.QLT, model.AccountId);
                            break;
                        case (int)EnumRole.TM:
                            tmp.QlbdPoint += service.CalculateTotalMainPoint(mangaid, (int)PointCode.QLBD, model.AccountId);
                            break;
                        case (int)EnumRole.TR:
                            tmp.DtPoint += service.CalculateTotalMainPoint(mangaid, (int)PointCode.DT, model.AccountId);
                            break;
                        case (int)EnumRole.UC:
                            tmp.UpclearPoint += service.CalculateTotalMainPoint(mangaid, (int)PointCode.UPClear, model.AccountId);
                            break;
                    }
                }
                result.Add(tmp);
            }
            var datatable = result.Select(m => new IConvertible[]
              {
                m.Count,
                m.FullName,
                m.QltPoint,
                m.QlbdPoint,
                m.DtPoint,
                m.UpclearPoint,
                m.QlbdPoint + m.QltPoint + m.UpclearPoint + m.DtPoint,
                m.MangaId
              });
            return Json(datatable, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetListChapterbyMangaId(int Id)
        {
            AccountModel model = (AccountModel)Session["UserInfo"];
            List<TotalPointModel> result = new List<TotalPointModel>();
            var manganame = data.Mangas.FirstOrDefault(m => m.MangaId == Id).FullName;
            var count = 1;
            var join = data.Manga_Detail.Where(m => m.Active == true && m.Status == (int)StatusMember.Accept && m.AccountId == model.AccountId && m.MangaId == Id).ToList();
            var tmpdetail = data.Chapters.Where(m => m.MangaId == Id && m.Active == true).Select(m => new { m.FullName, m.ChapterId }).ToList();
            foreach (var item in tmpdetail)
            {
                TotalPointModel tmp = new TotalPointModel();
                tmp.Count = count++;
                tmp.FullName = item.FullName;
                tmp.DtPoint = 0;
                tmp.QlbdPoint = 0;
                tmp.QltPoint = 0;
                tmp.UpclearPoint = 0;
                foreach (var role in join)
                {
                    int roleid = role.RoleId;
                    switch (roleid)
                    {
                        case (int)EnumRole.CM:
                            tmp.QltPoint += service.CalculateChapterMainPoint(item.ChapterId, (int)PointCode.QLT, model.AccountId);
                            break;
                        case (int)EnumRole.TM:
                            tmp.QlbdPoint += service.CalculateChapterMainPoint(item.ChapterId, (int)PointCode.QLBD, model.AccountId);
                            break;
                        case (int)EnumRole.TR:
                            tmp.DtPoint += service.CalculateChapterMainPoint(item.ChapterId, (int)PointCode.DT, model.AccountId);
                            break;
                        case (int)EnumRole.UC:
                            tmp.UpclearPoint += service.CalculateTotalMainPoint(item.ChapterId, (int)PointCode.UPClear, model.AccountId);
                            break;
                    }
                }
                result.Add(tmp);
            }
            var datatable = result.Select(m => new IConvertible[]
              {
                m.Count,
                m.FullName,
                m.QltPoint,
                m.QlbdPoint,
                m.DtPoint,
                m.UpclearPoint,
                m.QlbdPoint + m.QltPoint + m.UpclearPoint + m.DtPoint,
              });
            return Json(new { datatable = datatable,manganame = manganame }, JsonRequestBehavior.AllowGet);
        }
    }
}