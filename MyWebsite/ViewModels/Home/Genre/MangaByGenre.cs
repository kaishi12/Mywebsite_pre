using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Home.Genre
{
    public class MangaByGenre
    {
        public int MangaId { get; set; }
        public string FullName { get; set; }
        public string CoverLink { get; set; }
        public string Author { get; set; }
        public string Description { get; set; }
        public string Alias { get; set; }
    }
}