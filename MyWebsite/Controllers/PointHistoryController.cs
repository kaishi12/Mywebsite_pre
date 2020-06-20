using MyWebsite.Models;
using MyWebsite.Service.Common;
using MyWebsite.Service.Point;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyWebsite.Controllers
{
    public class PointHistoryController : Controller
    {
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        readonly PointService service = new PointService();
        // GET: PointHistory
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult AllMemberHistory()
        {
            return View();
        }
        public ActionResult MemberHistory()
        {
            return View();
        }
        public ActionResult GetAllHistory()
        {
            var count = 1;
            var listacc = data.Accounts.Where(m => m.Active == true).Select(m => new { m.AccountId, m.UserName }).ToList();
            var listmanga = data.Mangas.Where(m => m.Active == true).Select(m => new { m.MangaId, m.FullName }).ToList();
            var datatable = data.PointHistories.Where(m => m.Active == true).OrderByDescending(m=>m.ToDay).ToList().Select(m => new IConvertible[] {
                count++,
                listacc.FirstOrDefault(l=>l.AccountId == m.AccountId) != null ? listacc.FirstOrDefault(l=>l.AccountId == m.AccountId).UserName : "N/A",
                m.ToDay != null ? m.ToDay.Value.ToString("dd/MM/yyyy") : "N/A",
                listmanga.FirstOrDefault(l=>l.MangaId == m.MangaId) != null ? listmanga.FirstOrDefault(l=>l.MangaId == m.MangaId).FullName : "N/A",
                m.QLTPoint,
                m.DTPoint,
                m.UPCLEARPoint,
                m.QLBDPoint,
                m.QLBDPoint + m.DTPoint + m.UPCLEARPoint + m.QLTPoint,
            });
            return Json(datatable, JsonRequestBehavior.AllowGet);
        }
        public ActionResult CalPoint()
        {
            try
            {
                var today = DateTime.Now;
                var listacc = data.Accounts.Where(m => m.Active == true).Select(m => m.AccountId);
                foreach (var item in listacc)
                {
                    var join = data.Manga_Detail.Where(m => m.Active == true && m.Status == (int)StatusMember.Accept && m.AccountId == item).ToList();
                    var mangadetail = data.Manga_Detail
                                      .Where(m => m.Active == true && m.RoleId == (int)EnumRole.CM)
                                      .Select(m => m.MangaId).ToList();
                    foreach (var manga in mangadetail)
                    {
                        PointHistory model = new PointHistory();
                        model.Active = true;
                        model.ToDay = today;
                        model.MangaId = manga;
                        model.AccountId = item;
                        double dt = 0, qlbd = 0, qlt = 0, upclear = 0;
                        foreach (var role in join.Where(m => m.MangaId == manga))
                        {
                            int mangaid = role.MangaId, roleid = role.RoleId;
                            switch (roleid)
                            {
                                case (int)EnumRole.CM:
                                    qlt += service.CalculateTotalMainPoint(mangaid, (int)PointCode.QLT, item);
                                    break;
                                case (int)EnumRole.TM:
                                    qlbd += service.CalculateTotalMainPoint(mangaid, (int)PointCode.QLBD, item);
                                    break;
                                case (int)EnumRole.TR:
                                    dt += service.CalculateTotalMainPoint(mangaid, (int)PointCode.DT, item);
                                    break;
                                case (int)EnumRole.UC:
                                    upclear += service.CalculateTotalMainPoint(mangaid, (int)PointCode.UPClear, item);
                                    break;
                            }
                        }
                        model.DTPoint = dt;
                        model.QLBDPoint = qlbd;
                        model.QLTPoint = qlt;
                        model.UPCLEARPoint = upclear;
                        var view = data.PointHistories.Where(m => m.MangaId == manga).ToList().LastOrDefault(); 
                        if(view != null)
                        {
                            if(data.Chapters.Where(m => m.MangaId == manga).Count() == 0)
                            {
                                model.Views = view.Views;
                            }
                            else
                            model.Views = data.Chapters.Where(m => m.MangaId == manga).Sum(m => m.ViewNumber) - view.Views ;
                        }
                        else
                        {
                            if(data.Chapters.Where(m => m.MangaId == manga).Count() ==  0)
                            {
                                model.Views = 0;
                            }   
                            else
                            model.Views = data.Chapters.Where(m => m.MangaId == manga).Sum(m => m.ViewNumber);
                        }
                        data.PointHistories.Add(model);
                       
                    }
                }
                data.SaveChanges();
                return Json(new { rs = true, mess = "Cập nhật điểm thành công" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { rs = false, mess = "Có lỗi xảy ra, vui lòng liên hệ admin" }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}