using Dapper;
using MyWebsite.Service.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyWebsite.Models;

namespace MyWebsite.Service.Role
{
    public static class RoleService
    {
        public static int GetRoleId(string role)
        {
            var param = new DynamicParameters();
            param.Add("@Role",role );
            return (int)DALHelpers.ExecuteScalarByStore("Role_GetRoldIdbyId", param);
        }
        public static Models.Role GetRoleInfo(int Roleid)
        {
            var param = new DynamicParameters();
            param.Add("@RoleId", Roleid);
            return DALHelpers.QueryByStored<Models.Role>("Role_GetRoleInfoById", param).FirstOrDefault();
        }
    }
}