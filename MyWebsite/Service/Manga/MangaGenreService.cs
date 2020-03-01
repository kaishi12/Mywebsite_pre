using Dapper;
using MyWebsite.Models;
using MyWebsite.Service.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.Service.Manga
{
    public static class MangaGenreService
    {
        public static bool AddNewManga_Genres(int MangaId, List<int> GenreId)
        {
            try
            {
                 MyWebsiteEntities data = new MyWebsiteEntities();
                var List = new List<Manga_Genres>();
                 foreach(var genre in GenreId)
                 {
                    var item = new Manga_Genres
                    {
                        MangaId = MangaId,
                        GenreId = genre,
                        Active = true,

                    };
                    List.Add(item);
                 }
                data.Manga_Genres.AddRange(List);
                data.SaveChanges();
                return true;
            }
            catch
            {
            return false;
            }
        }
        public static IEnumerable<int> GetListGenreId(int MangaId)
        {
            var param = new DynamicParameters();
            param.Add("@MangaId", MangaId);
            return DALHelpers.QueryByStored<int>("MangaGenre_GetListGenreId", param);
        }
        public static bool ChangeStatus(int MangaId, int GenreId, bool StatusActive)
        {
            var param = new DynamicParameters();
            param.Add("@MangaId", MangaId);
            param.Add("@GenreId", GenreId);
            param.Add("@StatusActive", StatusActive);
            return DALHelpers.ExecuteByStored("MangaGenre_UpdateStatus", param) > 0;
        }
    }
}