using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Text
{
    public class Text
    {
        public int CorX { get; set; }
        public int CorY { get; set; }
        public int Witdh { get; set; }
        public int Height { get; set; }
        public int Degrees { get; set; }
       public string text { get; set; }
        public bool Italic { get; set; }
        public bool Bold { get; set; }
        public string Font { get; set; }
        public int Size { get; set; }
        public string color { get; set; }
    }
}