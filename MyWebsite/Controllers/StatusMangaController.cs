using MyWebsite.Models;
using MyWebsite.Service.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyWebsite.Controllers
{
    [AdminStatus]
    public class StatusMangaController : Controller
    {
        // GET: StatusManga
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetAllListStatus()
        {
            var count = 1;
            var datatable = data.Status.Where(m => m.Active == true).ToList().Select(m => new IConvertible[]
                {
                count++,
                m.FullName,
                m.StatusId
                });
            return Json(datatable, JsonRequestBehavior.AllowGet);
        }
        public ActionResult PrepareEdit(int id)
        {
            var model = data.Status.Find(id);
            var tmpModel = new
            {
                id = model.StatusId,
                name = model.FullName,
                
            };
            return Json(tmpModel, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Edit(int id,string name)
        {
            try
            {
                var model = data.Status.Find(id);
                model.FullName = name;
              
                data.SaveChanges();
                return Json(new { rs = true, mess = "Chỉnh sửa thành công" }, JsonRequestBehavior.AllowGet);
            }

            catch (Exception e)
            {
                var message = "Có lỗi trong quá trình xử lý, vui lòng liên hệ admin";
                return Json(new { rs = true, mess = message }, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult Add( string name)
        {
            try
            {
                var model = new Status();
                model.FullName = name;
                model.Active = true;
                data.Status.Add(model);
                data.SaveChanges();
                return Json(new { rs = true, mess = "Thêm thành công" }, JsonRequestBehavior.AllowGet);
            }

            catch (Exception e)
            {
                var message = "Có lỗi trong quá trình xử lý, vui lòng liên hệ admin";
                return Json(new { rs = true, mess = message }, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult DeleteStatus(int id)
        {
            try
            {
                var list = data.Mangas.Where(m => m.StatusId == id).ToList();
                if (list.Count() > 0)
                {
                    return Json(new { rs = false, mess = "Có truyện đang sử dụng trạng thái này, không thể xóa" }, JsonRequestBehavior.AllowGet);
                }
                var model = data.Status.Find(id);
                model.Active = false;
                data.SaveChanges();
                return Json(new { rs = true, mess = "Xóa thành công" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                var message = "Có lỗi trong quá trình xử lý, vui lòng liên hệ admin";
                return Json(new { rs = true, mess = message }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}