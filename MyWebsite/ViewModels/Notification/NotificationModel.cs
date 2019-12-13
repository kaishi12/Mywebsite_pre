using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Notification
{
    public class NotificationModel
    {
        public int NotificationId { get; set; }
        public string Content { get; set; }
        public int AccountId { get; set; }
        public int SeenStatus { get; set; }
        public int Status { get; set; }
        public string CreateAt { get; set; }

    }
}