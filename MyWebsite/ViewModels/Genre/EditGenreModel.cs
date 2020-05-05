using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Genre
{
    public class EditGenreModel
    {
        public int id { get; set; }
        public string name { get; set; }
        public string code { get; set; }
        public string des { get; set; }
        public string alias { get; set; }

    }
}