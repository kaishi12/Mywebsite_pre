using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Home.SearchManga
{
    public class ListName
    {
        public int MangaId { get; set; }
        public string FullName { get; set; }
        public string MangaAlias { get; set; }
        public string DefaultLang { get; set; }
    }
}