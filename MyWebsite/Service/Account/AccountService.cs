using MyWebsite.Service.Common;
using MyWebsite.Models;
using System.Linq;
using MyWebsite.ViewModels.Account;
using System;
using MyWebsite.Service.Notification;

namespace MyWebsite.Service.Account
{
    public class AccountService
    {
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        public AccountModel Login(AccountModel model)
        {
            HashMD5 hash = new HashMD5();
            var Pass = hash.CreateMD5(model.PassWord);
            var result = data.Accounts.FirstOrDefault(n => n.UserName == model.UserName && n.PassWord == Pass);
            if (result != null)
            {
                model.AccountId = result.AccountId;
                model.AvatarLink = result.AvatarLink;
                model.FullName = result.FullName;
                model.PhoneNumber = result.PhoneNumber;
                model.Email = result.Email;
                return model;
            }
            else
            {
                return null;
            }
        }
        public string Register(AccountModel model)
        {
            try
            {
                if (CheckUserName(model.UserName))
                {
                    return "Đã có tài khoản này";
                }
                else
                {
                    HashMD5 hash = new HashMD5();
                    Models.Account account = new Models.Account();
                    account.UserName = model.UserName;
                    account.PassWord = hash.CreateMD5(model.PassWord);
                    account.PhoneNumber = model.PhoneNumber;
                    account.Email = model.Email;
                    account.AvatarLink = model.AvatarLink;
                    account.StatusActive = 0;
                    data.Accounts.Add(account);
                    data.SaveChanges();
                    return "Sucess";
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }
        public bool CheckUserName(string UserName)
        {
            return data.Accounts.Count(n => n.UserName == UserName) > 0;
        }
        public bool UpdateAccount(AccountModel model)
        {
            try
            {
                HashMD5 hash = new HashMD5();
                Models.Account account = data.Accounts.SingleOrDefault(m => m.AccountId == model.AccountId);

                account.PassWord = hash.CreateMD5(model.PassWord);
                account.PhoneNumber = model.PhoneNumber;
                account.Email = model.Email;
                account.AvatarLink = model.AvatarLink;
                data.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public AccountModel GetAccountInfo(int id)
        {
            AccountModel model = new AccountModel();
            Models.Account account = data.Accounts.SingleOrDefault(m => m.AccountId == id);

            model.AccountId = account.AccountId;
            model.AvatarLink = account.AvatarLink;
            model.Email = account.Email;
            model.FullName = account.FullName;
            model.PassWord = account.PassWord;
            model.PhoneNumber = account.PhoneNumber;
            model.UserName = account.UserName;
            model.StatusActive = account.StatusActive.Value;
            return model;

        }
        public bool AddNewRole(int MangaId, int AccountId, int RoleId)
        {
            Models.Manga_Detail manga_Detail = new Models.Manga_Detail();
            manga_Detail.AccountId = AccountId;
            manga_Detail.MangaId = MangaId;
            manga_Detail.RoleId = RoleId;
            manga_Detail.StatusActive = 0;
            data.Manga_Detail.Add(manga_Detail);
            data.SaveChanges();
            return true;
        }
        public int ChangeStatusMangaDetail(string UserName, int MangaId, int RoleId, int Status, string language)
        {
            try
            {
                var res = data.Manga_Detail.Where(m => m.MangaId == MangaId && m.RoleId == RoleId);
                if (RoleId == 4)
                {
                    var translation = data.Translations.SingleOrDefault(m => m.Language.Id == language && m.MangaId == MangaId);
                    var AccountId = data.Accounts.SingleOrDefault(m => m.UserName == UserName).AccountId;
                    if (translation == null)
                    {

                        Translation Translation = new Translation();
                        Translation.MangaId = MangaId;
                        Translation.AccountId = AccountId;
                        Translation.LanguageId = data.Languages.SingleOrDefault(m => m.Id == language).LanguageId;
                        Translation.StatusActive = 0;
                        data.Translations.Add(Translation);
                    }
                    else
                    {
                        res.SingleOrDefault(m => m.AccountId == translation.AccountId).StatusActive = 1;
                        translation.AccountId = AccountId;
                        translation.StatusActive = Status;
                    }

                }
                Manga_Detail res0 = new Manga_Detail();
                if (!string.IsNullOrWhiteSpace(language))
                {
                    res0 = res.SingleOrDefault(m => m.Account.UserName == UserName && m.Language == language);
                }
                else
                    res0 = res.SingleOrDefault(m => m.Account.UserName == UserName);
                res0.StatusActive = Status;
                if (res0.StatusActive == 0)
                {
                    NotificationService notificationService = new NotificationService();
                    bool result = false;
                    if (res0.Type == 1)
                    {
                        result = notificationService.AddnewResponeNotification("RequestRespone", null, res0.Account.UserName, res0.Role.FullName, res0.Manga.FullName);
                    }
                    else
                    {
                        result = notificationService.AddnewResponeNotification("InviteReply", res0.Account.UserName, data.Manga_Detail.SingleOrDefault(m => m.MangaId == res0.MangaId && m.RoleId == 1).Account.UserName, res0.Role.FullName, res0.Manga.FullName);
                    }
                }
                data.SaveChanges();
                return 1;
            }
            catch (Exception ex)
            {
                return 3;
            }
        }
    }
}