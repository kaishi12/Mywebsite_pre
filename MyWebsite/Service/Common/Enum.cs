using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.Service.Common
{
    public enum DBName
    {
        Default = 1
    }
    public static class Const
    {
        public const string HEAR_BEAT_MSG = "I'm still alive, DO NOT KILL ME!";
        public const string conStr = "Data Source=DESKTOP-QU77M0A;Initial Catalog=MyWebsite;Integrated Security=True";
        public const string sqlCommand = @"SELECT [NotificationId] from [dbo].[Notification] where [CreateAt] > @CreateAt";
    }
    public enum TypeMember
    {
        Join = 0,
        Invite = 1
    }
    public static class ConsSuperAcc
    {
        public const string SuperAcc = "admin";
        public const string SuperPass = "1";
    }
}