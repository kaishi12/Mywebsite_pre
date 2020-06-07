using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Home.Author
{
    public class MangaByAuthor
    {
        public int MangaId { get; set; }
        public string FullName { get; set; }
        public string CoverLink { get; set; }
        public string Description { get; set; }
        public string CreateAt { get; set; }
        public string Author { get; set; }
        public bool Active { get; set; }
        public string Alias { get; set; }
        public int StatusId { get; set; }
        public string UpdateAt { get; set; }
        public string DefaultLang { get; set; }

        public List<LastestChapter> Last2Chapter { get; set; }
    }

    public class LastestChapter
    {
        public int ChapterId { get; set; }
        public int MangaId { get; set; }
        public string Alias { get; set; }
        public int LanguageId { get; set; }
        public string FullName { get; set; }
        public int OrderNumber { get; set; }

    }
}