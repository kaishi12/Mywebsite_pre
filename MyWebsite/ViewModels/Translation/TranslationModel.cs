using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Translation
{
    public class TranslationModel
    {
     public int TranslationId { get; set; }
        public int MangaId { get; set; }
        public int AccountId { get; set; }
        public int LanguageId { get; set; }
        public int StatusActive { get; set; }
    }
}