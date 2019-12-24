using Dapper;
using MyWebsite.Service.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyWebsite.ViewModels.Language;

namespace MyWebsite.Service.Language
{
    public static class LanguageService
    {
        public static IEnumerable<LanguageModel> GetListLanguage()
        {
           
            return DALHelpers.QueryByStored<LanguageModel>("Language_GetList", null);
        }
       
    }
}