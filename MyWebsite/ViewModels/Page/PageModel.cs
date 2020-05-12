using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Page
{
    public class PageViewModel
    {
        public int Id { get; set; }
        public int orderNumber { get; set; }
        public string link { get; set; }
        public List<TextBoxViewModel> textboxes { get; set; }

    }
    public class TextBoxViewModel
    {
        public int Id { get; set; }
        public string Cor { get; set; }
        public double witdh { get; set; }
        public double height { get; set; }
        public int degree { get; set; }
        public TextViewModel texts { get; set; }
    }
    public class TextViewModel
    {
        public int Id { get; set; }
        public string content { get; set; }
        public string color { get; set; }
        public bool bold { get; set; }
        public bool italic { get; set; }
        public string font { get; set; }
        public int size { get; set; }

    }
}