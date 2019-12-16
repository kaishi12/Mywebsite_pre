using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyWebsite.ViewModels.Manga;
using MyWebsite.Models;
using MyWebsite.Service.Notification;
using MyWebsite.Service.Account;
using MyWebsite.Service.Role;
using Dapper;
using MyWebsite.Service.Common;

namespace MyWebsite.Service.Manga
{
    public class MangaService
    {
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        public int AddnewManga(MangaModel model)
        {
            try
            {
                var param = new DynamicParameters();
                param.Add("@FullName", model.FullName);
                param.Add("@CoverLink", model.CoverLink);
                param.Add("@Alias", model.Alias);
                param.Add("@Author", model.Author);
                param.Add("@CreateAt", DateTime.Now);
                param.Add("@Description", model.Description);
                param.Add("@StatusId", model.StatusId);
                param.Add("@StatusActive",0);
                int MangaId = DALHelpers.QueryByStored<int>("Manga_AddnewManga", param).FirstOrDefault();
               for (int i = 0; i < model.ListGenre.Count(); i++)
                {
                    MangaGenreService.AddNewManga_Genres(MangaId, model.ListGenre.ToList()[i]);
                }
                return (int)MangaId;
            }
            catch (Exception ex)
            {
                return -1;
            }
        }
       
        public MangaModel GetMangaModel(int MangaId)
        {
            try
            {
                var param = new DynamicParameters();
                param.Add("@MangaId", MangaId);
                MangaModel manga = DALHelpers.QueryByStored<MangaModel>("Manga_GetMangaInfo", param).FirstOrDefault();
                manga.ListGenre = MangaGenreService.GetListGenreId(MangaId);

                return manga;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public IEnumerable<MangaModel> GetListMangaByAccountId(int AccountId, string roleid)
        {
            try
            {
                var param = new DynamicParameters();
                param.Add("@AccountId", AccountId);
                param.Add("@RoleId", roleid);
                return DALHelpers.QueryByStored<MangaModel>("Manga_GetListManga", param);
             }
            catch (Exception ex)
            {
                return null;
            }
        }
        public bool UpdateManga(MangaModel model)
        {
            try
            {
                var param = new DynamicParameters();
                param.Add("@Id", model.MangaId);
                param.Add("@FullName", model.FullName);
                param.Add("@CoverLink", model.CoverLink);
                param.Add("@Alias", model.Alias);
                param.Add("@Author", model.Author);
                param.Add("@CreateAt", DateTime.Now);
                param.Add("@Description", model.Description);
                param.Add("@StatusId", model.StatusId);
                param.Add("@StatusActive", 0);
                DALHelpers.ExecuteByStored("Manga_UpdateInfoManga", param);
               
                var listgenre = MangaGenreService.GetListGenreId(model.MangaId);
                var modellist = model.ListGenre.ToList();
                foreach (var item in listgenre)
                {
                    if (model.ListGenre.Contains(item))
                    {
                        MangaGenreService.ChangeStatus(model.MangaId, item, 1);
                        modellist.Remove(item);
                    }
                }
                foreach (var item in modellist)
                {
                    MangaGenreService.AddNewManga_Genres(model.MangaId, item);
                }

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public List<MangaJoin> GetListMangaJoinByAccountId(int AccountId)
        {
            try
            {

                List<ViewModels.Manga.MangaJoin> model = new List<ViewModels.Manga.MangaJoin>();
                List<int> MangaId = new List<int>();
                List<Manga_Detail> list = data.Manga_Detail.Where(m => m.AccountId == AccountId && m.StatusActive == 0 && m.RoleId != 1).ToList();
                foreach (var item in list)
                {
                    MangaJoin mangaJoin = new MangaJoin();
                    if (!MangaId.Contains(item.MangaId))
                    {

                        Models.Manga manga = data.Mangas.FirstOrDefault(m => m.MangaId == item.MangaId);
                        MangaId.Add(item.MangaId);
                        mangaJoin.MangaId = manga.MangaId;
                        mangaJoin.Alias = manga.Alias;
                        mangaJoin.CreatAt = manga.CreateAt.Value;
                        mangaJoin.Author = manga.Author;
                        mangaJoin.CoverLink = manga.CoverLink;
                        mangaJoin.Description = manga.Description;
                        mangaJoin.StatusName = manga.Status.FullName;
                        mangaJoin.StatusActive = manga.StatusActive.Value;
                        mangaJoin.FullName = manga.FullName;
                        mangaJoin.StatusActive = manga.StatusActive.Value;

                    }
                    else
                    {
                        mangaJoin = model.SingleOrDefault(m => m.MangaId == item.MangaId);
                    }
                    List<ViewModels.Manga.RoleModel> roles = new List<ViewModels.Manga.RoleModel>();
                    ViewModels.Manga.RoleModel role = new ViewModels.Manga.RoleModel();
                    role.RoleId = item.Role.RoleId;
                    role.FullName = item.Role.FullName;
                    roles.Add(role);
                    mangaJoin.roles = roles;
                    model.Add(mangaJoin);


                }
                return model;

            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public IEnumerable<MangaJoin> Search(int AccountId, string Name)
        {
            try
            {
                string name = Name.Replace(" ", "%");
                var param = new DynamicParameters();
                param.Add("@Fullname", name);
                return DALHelpers.QueryByStored<MangaJoin>("Manga_Search", param);
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public MangaModel GetInfo(int MangaId)
        {
           
                var param = new DynamicParameters();
                param.Add("@MangaId", MangaId);
                return DALHelpers.QueryByStored<MangaModel>("Manga_Search", param).FirstOrDefault();
        }
        public int Join(int AccountId, int MangaId, string Role, string language, int type)
        {
            try
            {
                NotificationService notificationService = new NotificationService();
                bool result = false;
                int AccountIdCreateManga = MangaDetailService.GetAccountIdCreateManga(MangaId);
                var RoleId = RoleService.GetRoleId(Role);
                MangaDetailService.AddNewRole(MangaId, AccountId, RoleId, type, language);
                if (type == 1)
                {
                    result = notificationService.AddnewRequestNotification("Request", AccountId, AccountIdCreateManga, RoleId, MangaId);
                }
                else
                {
                    result = notificationService.AddnewRequestNotification("Invite", AccountIdCreateManga, AccountId,RoleId, MangaId);
                }
                return 1;
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public bool CheckNameManga(string Fullname)
        {
            var param = new DynamicParameters();
            param.Add("@Fullname", Fullname);
            return DALHelpers.QueryByStored<int>("Manga_CheckNameManga", param).FirstOrDefault() >0;
        }
        public IEnumerable<MangaJoinedModel> GetListJoined(int AccountId)
        {
            var param = new DynamicParameters();
            param.Add("@AccountId", AccountId);
            return DALHelpers.QueryByStored<MangaJoinedModel>("Manga_GetListJoined", param);
        }
    }
}