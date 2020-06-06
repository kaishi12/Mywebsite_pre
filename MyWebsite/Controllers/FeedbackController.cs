using MyWebsite.Models;
using MyWebsite.Service.Common;
using MyWebsite.ViewModels.Account;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.Mvc;

namespace MyWebsite.Controllers
{
    public class FeedbackController : Controller
    {
        // GET: Feedback
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        [AccountStatus]
        public ActionResult Index()
        {
            return View();
        }
        [AdminStatus]
        public ActionResult List()
        {
            return View();
        }
        [AccountStatus]
        public ActionResult GetFeedBack(string des, string title)
        {
            try
            {
                AccountModel model = (AccountModel)Session["UserInfo"];
                Models.FeedBack fb = new FeedBack();
                fb.AccountId = model.AccountId;
                fb.active = true;
                fb.title = title;
                fb.date = DateTime.Now;
                fb.Description = des;
                fb.status = (int)FeebackStatus.await;
                data.FeedBacks.Add(fb);
                data.SaveChanges();
                return Json(true);
            }
            catch (Exception ex)
            {
                return Json(false);
            }

        }
        [AdminStatus]
        public ActionResult GetListFeedback()
        {
            var count = 1;
            var listacc = data.Accounts.Where(m => m.Active).ToList();
            var datatable1 = data.FeedBacks.Where(m => m.active == true).ToList();
            var datatable = data.FeedBacks.ToList().Select(m => new IConvertible[]
                {
                count++,
                listacc.FirstOrDefault(a=>a.AccountId == m.AccountId).UserName,
                m.title,
                m.date.Value.ToString("dd/MM/yyyy"),
                m.status,
                m.active == true ? "Đang hoạt động" : "Ngừng hoạt động",
                m.Id
                });
            return Json(datatable, JsonRequestBehavior.AllowGet);
        }
        public ActionResult PrepareEdit(int id)
        {
            var datas = data.FeedBacks.FirstOrDefault(m => m.Id == id);
            var tmpModel = new
            {
                id = datas.Id,
                title = datas.title,
                des = datas.Description,
                status = datas.status
                
            };
            return Json(tmpModel, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Save(int id, int status)
        {
            var datas = data.FeedBacks.FirstOrDefault(m => m.Id == id);
            datas.status = status;
            data.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }
    }
}