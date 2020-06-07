using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Home.Index
{
    public class LastUpdatedManga
    {
        public int MangaId { get; set; }
        public string CoverLink { get; set; }
        public string FullName { get; set; }
        public string Description { get; set; }
        public string Author { get; set; }
        public string Alias { get; set; }
        public string DefaultLang { get; set; }
        public int StatusActive { get; set; }
        public DateTime CreateAt { get; set; }
        public List<LastestChapter> Last3Chapter { get; set; }
    }

    public class LastestChapter
    {

        public int ChapterId { get; set; }
        public string Alias { get; set; }
        public int LanguageId { get; set; }
        public string FullName { get; set; }
        public string UpdateAt { get; set; }
        public string LanguageName { get; set; }


    }
}