using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Home.Slides
{
    public class Slides
    {
        public int MangaId { get; set; }
        public string FullName { get; set; }
        public string CoverLink { get; set; }
        public string Alias { get; set; }
        public int ViewNumber { get; set; }
        public string DefaultLang { get; set; }
    }
}