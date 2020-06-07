using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Home.SearchManga
{
    public class SearchManga
    {
        public int MangaId { get; set; }
        public string FullName { get; set; }
        public string MangaAlias { get; set; }
        public string CoverLink { get; set; }
        public string DefaultLang { get; set; }
        public string Author { get; set; }
    }
}