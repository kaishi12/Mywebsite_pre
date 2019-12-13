using MyWebsite.Service.Common;
using MyWebsite.Models;
using System.Linq;
using MyWebsite.ViewModels.Account;
using System;
using MyWebsite.Service.Notification;
using Dapper;
using System.Collections.Generic;
using MyWebsite.Service.Translation;
using MyWebsite.Service.Manga;
using MyWebsite.Service.Role;

namespace MyWebsite.Service.Account
{
    public class AccountService
    {
        readonly MyWebsiteEntities data = new MyWebsiteEntities();
        readonly MangaService MangaService = new MangaService();
        readonly HashMD5 hash = new HashMD5();
        public AccountModel Login(AccountModel model)
        {
            var Pass = hash.CreateMD5(model.PassWord);
            var param = new DynamicParameters();
            param.Add("@Username", model.UserName);
            param.Add("@Password", Pass);
           return  DALHelpers.QueryByStored<AccountModel>("Account_Login", param).FirstOrDefault();
        }
        public bool Register(AccountModel model)
        {
            try
            {
                if (CheckUserName(model.UserName))
                {
                    return false;
                }
                else
                {
                    HashMD5 hash = new HashMD5();
                    var Pass = hash.CreateMD5(model.PassWord);
                    var param = new DynamicParameters();
                    param.Add("@Username", model.UserName);
                    param.Add("@Password", Pass);
                    param.Add("@Email", model.Email);
                    param.Add("@PhoneNumber", model.PhoneNumber);
                    param.Add("@StatusActive", 0);
                    return DALHelpers.ExecuteByStored("Account_Register", param) > 0;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        /// <summary>
        /// Kiểm tra tài khoản khi đăng kí
        /// </summary>
        /// <param name="UserName"></param>
        /// <returns></returns>
        public bool CheckUserName(string UserName)
        {
            var param = new DynamicParameters();
            param.Add("@Username",UserName);
            bool result = (bool)DALHelpers.ExecuteScalarByStore("Account_CheckUserName", param);
            return result;
        }
        public bool UpdateAccount(UpdateAccountInfoModel model)
        {
            try
            {
                var param = new DynamicParameters();
                param.Add("@Id", model.AccountId);
                param.Add("@Fullname", model.FullName);
                param.Add("@PhoneNumber", model.PhoneNumber);
                param.Add("@Email", model.Email);
                param.Add("@FacebookLink", model.FacebookLink);
                param.Add("@TwitterLink", model.TwitterLink);
                param.Add("@InstagramLink", model.InstagramLink);
                param.Add("@Note", model.Note);
                var a = DALHelpers.ExecuteByStored("Account_UpdateAccountInfo", param);
                return a > 0;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public AccountModel GetAccountInfo(int id)
        {
            var param = new DynamicParameters();
            param.Add("@AccountId", id);
            return DALHelpers.QueryByStored<AccountModel>("Account_GetAccountInfobyId", param).FirstOrDefault();
        }
        public int ChangeStatusMangaDetail(string UserName, int MangaId, int RoleId, int Status, string language)
        {
            try
            {
                var AccountId = GetAccountIdbyUserName(UserName);
                string UserNameCreateManga = GetAccountInfo(MangaDetailService.GetAccountIdCreateManga(MangaId)).UserName;
                var Manga = MangaService.GetInfo(MangaId);
                var Role = RoleService.GetRoleInfo(RoleId);
                ViewModels.Manga.MangaDetail res0 = new ViewModels.Manga.MangaDetail();
                if (!string.IsNullOrWhiteSpace(language))
                {
                    MangaDetailService.ChangStatusMangadetail(MangaId, RoleId, AccountId, 1, language);
                     res0 = MangaDetailService.GetInfo(MangaId, RoleId, AccountId, 1, language);
                }
                else
                {
                    MangaDetailService.ChangStatusMangadetail(MangaId, RoleId, AccountId, 1, null);
                    res0 = MangaDetailService.GetInfo(MangaId, RoleId, AccountId, 1, language);
                }
                 if (RoleId == 4)
                {
                    var translation = TranslationService.CheckTranslationExist(MangaId, language);
                    if (translation == 0)
                    {
                        TranslationService.AddNew(MangaId,AccountId,0, language);
                    }
                    else
                    {
                        TranslationService.UpdateInfo(translation, AccountId, Status);
                    }
                }
                if (res0.StatusActive == 0)
                {
                    NotificationService notificationService = new NotificationService();
                    bool result = false;
                    if (res0.Type == 1)
                    {
                        result = notificationService.AddnewResponeNotification("RequestRespone", null, UserName, Role.FullName, Manga.FullName);
                    }
                    else
                    {
                        result = notificationService.AddnewResponeNotification("InviteReply", UserName, UserNameCreateManga, Role.FullName, Manga.FullName);
                    }
                }
                return 1;
            }
            catch (Exception ex)
            {
                return 3;
            }
        }
        public IEnumerable<AccountModel> Search(string UserName)
        {
            List<AccountModel> list1 = new List<AccountModel>();
            string name = UserName.Replace(" ", "%");
            var param = new DynamicParameters();
            param.Add("@UserName", name);
            return  DALHelpers.QueryByStored<AccountModel>("Account_Search", param);
        }
        public int GetAccountIdbyUserName(string UserName)
        {
            var param = new DynamicParameters();
            param.Add("@UserName", UserName);
            return (int) DALHelpers.ExecuteScalarByStore("Account_GetAccountIdbyUserName", param);
        }
        public bool UpdateAvatar(int AccountId,string Image)
        {
            var param = new DynamicParameters();
            param.Add("@Id", AccountId);
            param.Add("@Linkavatar", Image);
            return DALHelpers.ExecuteByStored("Account_UpdateAccountImg", param) > 0;
        }
        public bool UpdateStatus(int AccountId, string Status)
        {   
            var param = new DynamicParameters();
            param.Add("@Id", AccountId);
            param.Add("@Status", Status);
            return DALHelpers.ExecuteByStored("Account_UpdateAccountStatus", param) > 0;
        }
        public bool CheckPassWord(int AccountId, string Password)
        {
            var Pass = hash.CreateMD5(Password);
            var param = new DynamicParameters();
            param.Add("@PassWord", Pass);
            param.Add("@AccountId", AccountId);
            return (bool) DALHelpers.ExecuteScalarByStore("MangaDetail_CheckOldPassWord", param) ;
        }
        public bool UpdatePassWord(int AccountId, string Password)
        {
            var Pass = hash.CreateMD5(Password);
            var param = new DynamicParameters();
            param.Add("@Id", AccountId);
            param.Add("@PassWord", Pass);
            return DALHelpers.ExecuteByStored("Account_UpdateAccountPassWord", param) > 0;
        }
    }
}