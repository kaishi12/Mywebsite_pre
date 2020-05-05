using MyWebsite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyWebsite.Controllers
{
    public class DocumentController : Controller
    {
        // GET: Document
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult LoadDocument()
        {
            var list = data.Documents.ToList();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        public ActionResult ListDocument()
        {
            return View();
        }
        public ActionResult LoadAllDocumentTable()
        {
            var datatable = data.Documents.Where(m => m.Active == true).ToList().OrderBy(m => m.Order).Select(m => new IConvertible[]
                  {
                m.Order,
                m.Name,
                m.Text,
                m.Id
                  });
            return Json(datatable, JsonRequestBehavior.AllowGet);
        }
        public ActionResult PrepareEdit(int id)
        {
            var model = data.Documents.Find(id);
            var tmpModel = new
            {
                id = model.Id,
                name = model.Name,
                text = model.Text,
                image = model.Image,
                order = model.Order

            };
            return Json(tmpModel, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Edit(int id, string name)
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
        public ActionResult Add(string name)
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
               
                
                var model = data.Documents.Find(id);
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