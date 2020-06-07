using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Home.NewManga
{
    public class NewManga
    {
        public int MangaId { get; set; }
        public string FullName { get; set; }
        public string CoverLink { get; set; }
        public string MangaAlias { get; set; }
        public DateTime CreateAt { get; set; }
        public string DefaultLang { get; set; }
    }
}