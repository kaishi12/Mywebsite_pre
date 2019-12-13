using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.TextBox
{
    public class TextBoxModel
    {
        public int TextBoxId { get; set; }
        public string Coordinate { get; set; }
        public int Witdh { get; set; }
        public int Height { get; set; }
        public int PageId { get; set; }
        public int Degrees { get; set; }
        public int StatusActive { get; set; }
       
    }
}