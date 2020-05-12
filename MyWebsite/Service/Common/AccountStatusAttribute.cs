using MyWebsite.Service.Account;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using System.Web.Routing;
using MyWebsite.ViewModels.Account;

namespace MyWebsite.Service.Common
{
    public class AccountStatusAttribute : AuthorizeAttribute
    {


        AccountService AccountService = new AccountService();
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            try
            {
                var userInfoSession = (AccountModel)HttpContext.Current.Session["UserInfo"];
                if (userInfoSession == null)
                {
                    return false;
                }
                var accInfo = GetAccountByID(userInfoSession.AccountId);
                if (accInfo == null)
                {
                    HttpContext.Current.Session.Clear();
                    return false;
                }
                HttpContext.Current.Session["UserInfo"] = accInfo;
                return accInfo.Active;
                
            }
            catch (Exception ex)
            {
                HttpContext.Current.Session.Clear();
                return false;
            }
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            var userInfoSession = filterContext.HttpContext.Session["UserInfo"];
            if (userInfoSession == null)
            {
                filterContext.Result = new RedirectToRouteResult(new
                    RouteValueDictionary(new { controller = "Account", action = "Login" }));
                return;
            }
            filterContext.Result = new ViewResult
            {
                ViewName = "~/Views/Shared/AccountStatusRestriction.cshtml"
            };
        }

        private AccountModel GetAccountByID(int id)
        {
            var acc = AccountService.GetAccountInfo(id);
            return acc;
        }
    }
}