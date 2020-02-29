using Dapper;
using MyWebsite.Service.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.Service.Manga
{
    public static class MangaGenreService
    {
        public static bool AddNewManga_Genres(int MangaId, int GenreId)
        {       var param = new DynamicParameters();
                param.Add("@GenreId", GenreId);
                param.Add("@MangaId", MangaId);
                param.Add("@StatusActive", 1);
                return DALHelpers.ExecuteByStored("MangaGenre_Addnew", param) > 0;
        }
        public static IEnumerable<int> GetListGenreId(int MangaId)
        {
            var param = new DynamicParameters();
            param.Add("@MangaId", MangaId);
            return DALHelpers.QueryByStored<int>("MangaGenre_GetListGenreId", param) ;
        }
        public static bool ChangeStatus(int MangaId,int GenreId,int StatusActive)
        {
            var param = new DynamicParameters();
            param.Add("@MangaId", MangaId);
            param.Add("@GenreId", GenreId);
            param.Add("@StatusActive", StatusActive);
            return DALHelpers.ExecuteByStored("MangaGenre_UpdateStatus", param) > 0;
        }
    }
}