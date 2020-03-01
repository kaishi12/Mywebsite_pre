using Dapper;
using MyWebsite.Service.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.Service.Translation
{
   
    public static class TranslationService
    {
        public static int CheckTranslationExist(int MangaId,int Language)
        {
            var param = new DynamicParameters();
            param.Add("@Language", Language);
            param.Add("@MangaId", MangaId);
            return (int)DALHelpers.ExecuteScalarByStore("Translation_CheckExist", param);
        }
        public static bool UpdateInfo(int TranslationId,int AccountId,int StatusActive)
        {
            var param = new DynamicParameters();
            param.Add("@TranslationId", TranslationId);
            param.Add("@AccountId", AccountId);
            param.Add("@StatusActive", StatusActive);
            return DALHelpers.ExecuteByStored("Translation_UpdateInfo", param) > 0;
        }
        public static bool AddNew(int MangaId,int AccountId,int StatusActive,int Language)
        {
            var param = new DynamicParameters();
            param.Add("@MangaId", MangaId);
            param.Add("@AccountId", AccountId);
            param.Add("@Language", Language);
            param.Add("@StatusActive", StatusActive);
            param.Add("@Status", (int)StatusMember.Wait);
            return DALHelpers.ExecuteByStored("Translation_AddnewTranslation", param) > 0;
        }
    }
}