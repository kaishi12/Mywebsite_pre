using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Home.Bookmark
{
    public class Bookmark
    {
        public int MangaId { get; set; }
        public string MangaName { get; set; }
        public string MangaAlias { get; set; }
        public string CoverImg { get; set; }
        public int LastSeenChap { get; set; }
        public bool SeenStatus { get; set; }
        public int AllChapCount { get; set; }

    }
}