using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dapper;
using MyWebsite.Service.Common;
using MyWebsite.Service.Role;
using MyWebsite.ViewModels.Manga;

namespace MyWebsite.Service.Manga
{
    public static class MangaDetailService
    {
        public static bool CheckJoin(int AccountId, int MangaId, int Role)
        {
            var param = new DynamicParameters();
            param.Add("@MangaId", MangaId);
            param.Add("@AccountId", AccountId);
            param.Add("@RoleId", Role);
            return (int)DALHelpers.QueryByStored<int>("MangaDetail_CheckJoin", param).FirstOrDefault() > 0;
        }
        public static int GetAccountIdCreateManga(int MangaId)
        {
            var param = new DynamicParameters();
            param.Add("@MangaId", MangaId);
            return (int)DALHelpers.ExecuteScalarByStore("MangaDetail_GetAccountCreateManga", param);
        }
        public static bool ChangStatusMangadetail(int MangaId, int RoleId, int AccountId, int StatusActive, int Language)
        {
            var param = new DynamicParameters();
            param.Add("@MangaId", MangaId);
            param.Add("@RoleId", RoleId);
            param.Add("@AccountId", AccountId);
            param.Add("@StatusActive", StatusActive);
            param.Add("@Language", Language);
            return DALHelpers.ExecuteByStored("MangaDetail_ChangeStatus", param) > 0;
        }
        public static MangaDetail GetInfo(int MangaId, int RoleId, int AccountId, int StatusActive, int Language)
        {
            var param = new DynamicParameters();
            param.Add("@MangaId", MangaId);
            param.Add("@RoleId", RoleId);
            param.Add("@AccountId", AccountId);
            param.Add("@StatusActive", StatusActive);
            param.Add("@Language", Language);
            return DALHelpers.QueryByStored<MangaDetail>("MangaDetail_GetInfo", param).FirstOrDefault();
        }
        public static bool AddNewRole(int MangaId, int AccountId, int RoleId, int type, int language,int status)
        {
            var param = new DynamicParameters();
            param.Add("@MangaId", MangaId);
            param.Add("@AccountId", AccountId);
            param.Add("@RoleId", RoleId);
            param.Add("@StatusActive", 1);
            param.Add("@Type", type);
            param.Add("@Language", language);
            param.Add("@Status", status);
            return DALHelpers.ExecuteByStored("MangaDetail_AddNewRole", param) > 0;
        }
        public static IEnumerable<MangaDetail> GetPeopleJoinManga(int AccountId)
        {
            var param = new DynamicParameters();
            param.Add("@AccountId", AccountId);
            return DALHelpers.QueryByStored<MangaDetail>("MangaDetail_GetPeopleJoinmanga", param);
        }
    }
}