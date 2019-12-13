using MyWebsite.Service.Common;
using MyWebsite.Models;
using System.Linq;
using MyWebsite.ViewModels.Account;
using System;

namespace MyWebsite.Service.Account
{
    public class AccountService
    {
       readonly  MyWebsiteEntities data = new MyWebsiteEntities();
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
                    data.Accounts.Add(account);
                    data.SaveChanges();
                    return "Sucess";
                }
            }
            catch(Exception ex)
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
            catch(Exception ex)
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
            return model;

        }
        public bool AddNewRole(int MangaId,int AccountId,int RoleId)
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
    }
}