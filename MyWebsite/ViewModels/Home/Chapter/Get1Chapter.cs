using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Home.Chapter
{
    public class Get1Chapter
    {
        public int MangaId { get; set; }
        public int ChapterId { get; set; }
        public string CoverLink { get; set; }
        public string Description { get; set; }
        public string FullNameManga { get; set; }
        public string FullNameChapter { get; set; }
        public string AliasManga { get; set; }
        public string AliasChapter { get; set; }
        public string LangId { get; set; }
        public int OrderNumber { get; set; }
    }
}