using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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
        public const string conStr = "Data Source=LAPTOP-UFP2PSK0;Initial Catalog=MyWebsite;Integrated Security=True";
        public const string sqlCommand = @"SELECT [NotificationId] from [dbo].[Notification] where [CreateAt] > @CreateAt";
    }
    //Cho table Manga_Detail
    //Trường dữ liệu Type
    public enum EnumTypeMember
    {
        [Display(Name = "Người ta xin tham gia")]
        Join = 0,
        [Display(Name = "Mình mời người ta tham gia")]
        Invite = 1,
        [Display(Name = "Người tạo truyện")]
        Create = 2
    }
    public static class ConsSuperAcc
    {
        public const string SuperAcc = "admin";
        public const string SuperPass = "1";
    }
    public enum EnumRole
    {
        [Display(Name = "Quản lý truyện-chương")]
        CM = 1,
        [Display(Name = "Tải lên bản clear-text")]
        UC = 2,
        [Display(Name = "Dịch truyện")]
        TR = 3,
        [Display(Name = "Quản lý bảm dịch toàn truyện theo ngôn ngữ")]
        TM = 4, 
    }
    public enum StatusMember
    {
        [Display(Name = "Không được duyệt")]
        Cancel = 0,
        [Display(Name = "Đang chờ duyệt")]
        Wait = 1,
        [Display(Name = "Đã được duyệt")]
        Accept = 2
    }
    public enum StatusPage
    {
        [Display(Name = "Không được duyệt")]
        Cancel = 0,
        [Display(Name = "Đang chờ duyệt")]
        Wait = 1,
        [Display(Name = "Đã được duyệt")]
        Accept = 2
    }
}