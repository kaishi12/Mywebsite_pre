using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Home.MangaDetail
{
    public class ListChapter
    {
        public int ChapterId { get; set; }
        //[Display(Name = "Tên Chương Truyện")]
        public string FullName { get; set; }
        //[Display(Name = "Lượt Xem")]
        public int ViewNumber { get; set; }
        //[Display(Name = "Thời gian cập nhật")]
        public int MangaId { get; set; }
        public string CreateAt { get; set; }
        public string Alias { get; set; }
    }
}