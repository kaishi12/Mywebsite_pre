using MyWebsite.Models;
using MyWebsite.Service.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyWebsite.ViewModels.Notification;
using MyWebsite.ViewModels.Account;
using Microsoft.AspNet.SignalR;
using System.Threading.Tasks;

namespace MyWebsite.Controllers
{
    [AccountStatus]
    public class NotificationController : Controller
    {
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        // GET: Notification
        public ActionResult GetNotification()
        {
            AccountModel account = (AccountModel)Session["UserInfo"];
            
            List<NotificationModel> notificationModels = new List<NotificationModel>();
             var res = data.Notifications.Where(m => m.AccountId == account.AccountId).OrderByDescending(m => m.CreateAt);
            foreach(var item in res)
            {
                DateTime Tgcn = item.CreateAt;
                var month = new DateDifference(Tgcn, DateTime.Now);
                NotificationModel notification = new NotificationModel();
                notification.NotificationId = item.NotificationId;
                notification.Content = item.NContent;
                notification.CreateAt = month.ToString();
                notification.SeenStatus = item.SeenStatus;
                notification.Status = item.Status;
                notification.AccountId = item.AccountId;

                notificationModels.Add(notification);
            }
            return Json(notificationModels,JsonRequestBehavior.AllowGet);
        }
        public JsonResult Seen()
        {
            AccountModel account = (AccountModel)Session["UserInfo"];
          var res =  data.Notifications.Where(m => m.AccountId == account.AccountId && m.SeenStatus == false);
            foreach(var item in res)
            {
                item.SeenStatus = true;
                
            }
            data.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetNotifications()
        {

            AccountModel account = (AccountModel)Session["UserInfo"];
            var notificationRegisterTime =  Convert.ToDateTime(Session["LastUpdated"]);
            NotificationComponent NC = new NotificationComponent();
            var list = NC.GetData(account.AccountId,notificationRegisterTime);

            //update session here for get only new added contacts (notification)  
            Session["LastUpdated"] = DateTime.Now;
            return Json(list,JsonRequestBehavior.AllowGet);
        }
       
    }
}