using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Language
{
    public class LanguageModel
    {
        public int LanguageId { get; set; }
        public string FullName { get; set; }
        public string Note { get; set; }
        public int StatusActive { get; set; }
        public string Id { get; set; }

    }
}