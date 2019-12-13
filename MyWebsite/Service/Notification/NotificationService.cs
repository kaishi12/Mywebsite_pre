using MyWebsite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.Service.Notification
{
    public class NotificationService
    {
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        public bool AddnewRequestNotification(string type, int SendId, int ReciveId, int RoleId, int MangaId)
        {
            var notifyType = data.NotifyTypes.SingleOrDefault(m => m.FullName == type);
            Models.Notification notification = new Models.Notification();
            string content = notifyType.NTContent;
            notification.AccountId = ReciveId;
            notification.CreateAt = DateTime.Now;
            notification.Status = 0;
            notification.NotifyTypeId = notifyType.NotifyTypeId;
            notification.SeenStatus = 1;
            content= content.Replace("UserName", data.Accounts.SingleOrDefault(m => m.AccountId == SendId).UserName);
             content = content.Replace("RoleName", data.Roles.SingleOrDefault(m => m.RoleId == RoleId).FullName);
            content = content.Replace("MangaName", data.Mangas.SingleOrDefault(m => m.MangaId == MangaId).FullName);
            notification.NContent = content;
            data.Notifications.Add(notification);
            data.SaveChanges();
            return true;
        }
        public bool AddnewResponeNotification(string type, string Send, string Recive, string RoleName, string MangaName)
        {
            var notifyType = data.NotifyTypes.SingleOrDefault(m => m.FullName == type);
            Models.Notification notification = new Models.Notification();
            string content = notifyType.NTContent;
            notification.AccountId = data.Accounts.SingleOrDefault(m => m.UserName == Recive).AccountId;
            notification.CreateAt = DateTime.Now;
            notification.Status = 0;
            notification.NotifyTypeId = notifyType.NotifyTypeId;
            notification.SeenStatus = 1;
            content = content.Replace("UserName", Send);
            content = content.Replace("RoleName", RoleName);
            content = content.Replace("MangaName", MangaName);
            notification.NContent = content;
            data.Notifications.Add(notification);
            data.SaveChanges();
            return true;
        }
        public bool AddnewNoticeSenpai(string type, int ChapterOrder, int PageOrder, string MangaName, int AccountId,string Language)
        {
            var notifyType = data.NotifyTypes.SingleOrDefault(m => m.FullName == type);
            Models.Notification notification = new Models.Notification();
            string content = notifyType.NTContent;
            notification.AccountId = AccountId;
            notification.CreateAt = DateTime.Now;
            notification.Status = 0;
            notification.NotifyTypeId = notifyType.NotifyTypeId;
            notification.SeenStatus = 1;
            content = content.Replace("ChapterOrder", ChapterOrder.ToString());
            content = content.Replace("PageOrder", PageOrder.ToString());
            content = content.Replace("MangaName", MangaName);
           if (type == "Trans")
            {
                content = content.Replace("MangaName", MangaName);
                content = content.Replace("Language", Language);
            }
            notification.NContent = content;
            data.Notifications.Add(notification);
            data.SaveChanges();
            return true;
        }
        public bool AddnewChapterNotification(int ChapterOrder, int PageOrder, string MangaName, int AccountId)
        {
            return true;
        }
        public void AddnewCTPageNotification(){ }
        public void AddnewTextNotification(){ }
    }
}