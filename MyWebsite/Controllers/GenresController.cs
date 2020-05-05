using MyWebsite.Models;
using MyWebsite.ViewModels.Genre;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyWebsite.Controllers
{
    public class GenresController : Controller
    {
        // GET: Genre
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetAllListGenre()
        {
            var count = 1;
            var datatable = data.Genres.Where(m=>m.Active == true).ToList().Select(m => new IConvertible[]
              {
                count++,
                m.FullName,
                m.Id,
                m.Alias,
                m.Description,
                m.GenreId,
              });
            return Json(datatable, JsonRequestBehavior.AllowGet);
        }
        public ActionResult PrepareEdit(int id)
        {
            var model = data.Genres.Find(id);
            var tmpModel = new
            {
                id = model.GenreId,
                name = model.FullName,
                code = model.Id,
                des = model.Description,
                alias = model.Alias
            };
            return Json(tmpModel, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Edit(EditGenreModel editmodel)
        {
            try
            {
                var model = data.Genres.Find(editmodel.id);
                model.FullName = editmodel.name;
                model.Id = editmodel.code;
                model.Description = editmodel.des;
                model.Alias = editmodel.alias;
                data.SaveChanges();
                return Json(new { rs = true, mess = "Chỉnh sửa thành công" }, JsonRequestBehavior.AllowGet);
            }
          
            catch (Exception e)
            {
                var message = "Có lỗi trong quá trình xử lý, vui lòng liên hệ admin";
                return Json(new { rs = true, mess = message}, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult Add(EditGenreModel editmodel)
        {
            try
            {
                var model = new Genre();
                model.FullName = editmodel.name;
                model.Id = editmodel.code;
                model.Description = editmodel.des;
                model.Alias = editmodel.alias;
                data.Genres.Add(model);
                data.SaveChanges();
                return Json(new { rs = true, mess = "Thêm thành công" }, JsonRequestBehavior.AllowGet);
            }

            catch (Exception e)
            {
                var message = "Có lỗi trong quá trình xử lý, vui lòng liên hệ admin";
                return Json(new { rs = true, mess = message }, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult DeleteGen(int id)
        {
            try
            {
                var model = data.Genres.Find(id);
                model.Active = false;
                var list = data.Manga_Genres.Where(m => m.GenreId == id).ToList();
                foreach(var item in list)
                {
                    item.Active = false;
                }
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