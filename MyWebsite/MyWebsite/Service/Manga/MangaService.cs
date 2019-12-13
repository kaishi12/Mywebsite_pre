using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyWebsite.ViewModels.Manga;
using MyWebsite.Models;

namespace MyWebsite.Service.Manga
{
    public class MangaService
    {
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        public int AddnewManga(MangaModel model)
        {
            try
            {
                Models.Manga manga = new Models.Manga();
                manga.Alias = model.Alias;
                manga.CreateAt = DateTime.Now;
                manga.Author = model.Author;
                manga.CoverLink = model.CoverLink;
                manga.Description = model.Description;
                manga.StatusId = model.StatusId;
                manga.StatusActive = model.StatusActive;
                manga.FullName = model.FullName;
                manga.StatusActive = 0;
                data.Mangas.Add(manga);
                data.SaveChanges();
                for (int i = 0; i < model.ListGenre.Count(); i++)
                {
                    AddNewManga_Genres(manga.MangaId, model.ListGenre[i]);
                }
                return manga.MangaId;
            }
            catch (Exception ex)
            {
                return -1;
            }
        }
        public bool AddNewManga_Genres(int MangaId, int GenreId)
        {
            try
            {

                Models.Manga_Genres manga_Genres = new Models.Manga_Genres();
                manga_Genres.GenreId = GenreId;
                manga_Genres.MangaId = MangaId;
                manga_Genres.StatusActive = 0;
                data.Manga_Genres.Add(manga_Genres);
                data.SaveChanges();
                return true;

            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public MangaModel GetMangaModel(int MangaId)
        {
            try
            {
                Models.Manga manga = data.Mangas.FirstOrDefault(m => m.MangaId == MangaId);
                MangaModel model = new MangaModel();
                model.MangaId = MangaId;
                model.Alias = manga.Alias;
                model.CreatAt = manga.CreateAt.Value;
                model.Author = manga.Author;
                model.CoverLink = manga.CoverLink;
                model.Description = manga.Description;
                model.StatusId = manga.StatusId.Value;
                model.StatusActive = manga.StatusActive.Value;
                model.FullName = manga.FullName;
                model.StatusActive = manga.StatusActive.Value;
                model.ListGenre = (from row in manga.Manga_Genres.Where(m => m.StatusActive == 0) select row.GenreId).ToList();

                return model;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public List<int> GetListGenres(int MangaId)
        {
            try
            {
                List<int> list = new List<int>();
                List<Models.Manga_Genres> manga_Genres = data.Manga_Genres.Where(m => m.MangaId == MangaId && m.StatusActive == 0).ToList();
                foreach (var item in manga_Genres)
                {
                    list.Add(item.GenreId);
                }
                return list;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public List<Models.Manga> GetListMangaByAccountId(int AccountId, int roleid)
        {
            try
            {
                List<Models.Manga> mangas = new List<Models.Manga>();
                List<Manga_Detail> list = data.Manga_Detail.Where(m => m.AccountId == AccountId && m.RoleId == roleid && m.StatusActive == 0).ToList();
                foreach (var item in list)
                {
                    Models.Manga manga = data.Mangas.FirstOrDefault(m => m.MangaId == item.MangaId);
                    mangas.Add(manga);
                }
                return mangas;

            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public List<MangaDetail> GetListMangaDetailByAccountId(int AccountId)
        {
            try
            {
                List<Manga_Detail> list = new List<Manga_Detail>();

                list = data.Manga_Detail.Where(m => m.AccountId == AccountId).ToList();

                List<MangaDetail> manga_Details = new List<MangaDetail>();



                foreach (var trans in list)
                {

                    MangaDetail mangaDetail = new MangaDetail();
                    mangaDetail.MangaFullName = trans.Manga.FullName;
                    mangaDetail.UserName = trans.Account.UserName;
                    mangaDetail.MangaId = trans.MangaId;
                    mangaDetail.RoleFullName = trans.Role.FullName;
                    mangaDetail.RoleId = trans.RoleId;
                    mangaDetail.StatusActive = trans.StatusActive.Value;
                    if (trans.Type != null)
                    {
                        mangaDetail.Type = trans.Type.Value;
                    }
                    if (trans.Role.Id.Trim() == "TM")
                    {
                        List<Translation> translation = data.Translations.Where(m => m.MangaId == trans.MangaId && m.AccountId == trans.AccountId).ToList();
                        if (translation.Count > 1)
                        {
                            foreach (var language in translation)
                            {
                                MangaDetail mangaDetail1 = mangaDetail;
                                mangaDetail1.TranslationId = language.TransationId;
                                mangaDetail1.LanguageFullname = language.Language.FullName;
                                mangaDetail1.LanguageId = language.LanguageId.Value;
                                manga_Details.Add(mangaDetail1);
                            }
                        }
                        else
                        {
                            mangaDetail.TranslationId = translation[0].TransationId;
                            mangaDetail.LanguageFullname = translation[0].Language.FullName;
                            mangaDetail.LanguageId = translation[0].LanguageId.Value;
                            manga_Details.Add(mangaDetail);
                        }
                    }
                    else
                    {
                        manga_Details.Add(mangaDetail);
                    }

                }


                return manga_Details;


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
                Models.Manga manga = data.Mangas.SingleOrDefault(m => m.MangaId == model.MangaId);
                manga.Alias = model.Alias;
                manga.CreateAt = DateTime.Now;
                manga.Author = model.Author;
                manga.CoverLink = model.CoverLink;
                manga.Description = model.Description;
                manga.StatusId = model.StatusId;
                manga.StatusActive = model.StatusActive;
                manga.FullName = model.FullName;
                manga.StatusActive = 0;


                foreach (var item in manga.Manga_Genres)
                {
                    if (!model.ListGenre.Contains(item.GenreId))
                    {
                        item.StatusActive = 1;
                        model.ListGenre.Remove(item.GenreId);
                    }
                }
                data.SaveChanges();
                foreach (var item in model.ListGenre)
                {
                    AddNewManga_Genres(manga.MangaId, item);
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
        public List<MangaJoin> Search(int AccountId, string Name)
        {
            try
            {
                List<MangaJoin> mangaJoins = new List<MangaJoin>();
                string name = Name.Replace(" ", "%");
                var list = data.Mangas.SqlQuery("select* from Manga where FullName like '%" + name + "%'").ToList();
                if (list.Count > 0)
                {
                    foreach (var item in list)
                    {
                        MangaJoin mangaJoin = new MangaJoin();
                        mangaJoin.MangaId = item.MangaId;
                        mangaJoin.Author = item.Author;
                        mangaJoin.FullName = item.FullName;
                        mangaJoin.Description = item.Description;
                        mangaJoin.CoverLink = item.CoverLink;
                        mangaJoin.CreatAt = item.CreateAt.Value;
                        foreach (var chapter in item.Chapters)
                        {
                            mangaJoin.View += chapter.ViewNumber.Value;
                        }
                        foreach (var Genre in item.Manga_Genres)
                        {
                            mangaJoin.Genre += ";" + Genre.Genre.FullName;
                        }
                        mangaJoins.Add(mangaJoin);
                    }

                }
                return mangaJoins;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public int Join(int AccountId, int MangaId, string Role, int language, int type)
        {
            try
            {
                Manga_Detail manga_Detail = new Manga_Detail();
                manga_Detail.AccountId = AccountId;
                manga_Detail.MangaId = MangaId;
                manga_Detail.RoleId = data.Roles.SingleOrDefault(m => m.Id == Role).RoleId;
                manga_Detail.StatusActive = 1;
                manga_Detail.Type = type;
                if (Role.Trim() == "TM")
                {
                    Translation translation = new Translation();
                    translation.MangaId = MangaId;
                    translation.AccountId = AccountId;
                    translation.LanguageId = language;
                    translation.StatusActive = 1;
                    data.Translations.Add(translation);


                }
                data.Manga_Detail.Add(manga_Detail);
                data.SaveChanges();
                return 1;
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public bool CheckJoin(int AccountId, int MangaId, string Role)
        {
            int RoleId = data.Roles.SingleOrDefault(m => m.Id == Role).RoleId;
            if (data.Manga_Detail.Where(m => m.AccountId == AccountId && m.MangaId == MangaId && m.RoleId == RoleId).ToList().Count > 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
    }
}