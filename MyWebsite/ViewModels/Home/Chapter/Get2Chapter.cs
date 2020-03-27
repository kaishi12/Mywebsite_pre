using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Home.Chapter
{
    public class Get2Chapter
    {
        public int ChapterId { get; set; }
        public int MangaId { get; set; }
        public string FullName { get; set; }
        public string CreateAt { get; set; }
        public string Alias { get; set; }
        public int OrderNumber { get; set; }
        public string LangId { get; set; }
    }
}