using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Home.Chapter
{
    public class GetLastedChapter
    {
        public int ChapterId { get; set; }
        public int MangaId { get; set; }
        public string Alias { get; set; }
        public string LanguageId { get; set; }
        public string FullName { get; set; }
        public int OrderNumber { get; set; }
    }
}