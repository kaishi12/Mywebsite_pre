using Microsoft.AspNet.SignalR;
using MyWebsite.Models;
using MyWebsite.Service.Common;
using MyWebsite.ViewModels.Account;
using MyWebsite.ViewModels.Notification;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MyWebsite
{
    public class NotificationComponent
    {
        AccountModel account = (AccountModel)HttpContext.Current.Session["UserInfo"];
        public void RegisterNotification(DateTime currentTime)
        {

            string conStr = Const.conStr;
            string sqlCommand = Const.sqlCommand;
            //you can notice here I have added table name like this [dbo].[Contacts] with [dbo], its mendatory when you use Sql Dependency  
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(sqlCommand, con);
                cmd.Parameters.AddWithValue("@CreateAt", currentTime);
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }
                cmd.Notification = null;
                SqlDependency sqlDep = new SqlDependency(cmd);
                sqlDep.OnChange += sqlDep_OnChange;
                //we must have to execute the command here
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    //nothing need to add here now
                }
            }
        }

        void sqlDep_OnChange(object sender, SqlNotificationEventArgs e)
        {
            //or you can also check => if (e.Info == SqlNotificationInfo.Insert) , if you want notification only for inserted record  
            if (e.Type == SqlNotificationType.Change)
            {
                SqlDependency sqlDep = sender as SqlDependency;
                sqlDep.OnChange -= sqlDep_OnChange;
                var notificationHub = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();
                //from here we will send notification message to client  
                notificationHub.Clients.Group("LoginGroup").notify("added");
                //re-register notification  
                RegisterNotification(DateTime.Now);
            }
        }

        public List<NotificationModel> GetData(int AccountId,DateTime afterDate)
        {
            using (MyWebsiteEntities dc = new MyWebsiteEntities())
            {
                List<NotificationModel> notificationModels = new List<NotificationModel>();
                var data= dc.Notifications.Where(a => a.CreateAt > afterDate && a.AccountId == AccountId).OrderByDescending(a => a.CreateAt);
                foreach(var item in data)
                {
                    DateTime Tgcn = item.CreateAt.Value;
                    var month = new DateDifference(Tgcn, DateTime.Now);
                    NotificationModel notification = new NotificationModel();
                    notification.NotificationId = item.NotificationId;
                    notification.Content = item.NContent;
                    notification.CreateAt = month.ToString();
                    notification.SeenStatus = item.SeenStatus.Value;
                    notification.Status = item.Status.Value;
                    notification.AccountId = item.AccountId.Value;

                    notificationModels.Add(notification);
                }
                return notificationModels;
            }
        }
    }
}