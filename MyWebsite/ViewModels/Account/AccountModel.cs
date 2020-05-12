using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Account
{
    public class AccountModel
    {
        public int AccountId { get; set; }
        [Display(Name = "Tài Khoản")]
        [Required(ErrorMessage = "Yêu cầu nhâp tài khoản")]
        [StringLength(32, ErrorMessage = "Tài khoản có độ dài từ 6 - 32 kí tự", MinimumLength = 6)]
        public string UserName { get; set; }
        [Display(Name = "Mật Khẩu")]
        [Required(ErrorMessage = "Yêu cầu nhâp mật khẩu ")]
        [StringLength(32, ErrorMessage = "Mật khẩu có độ dài từ 6 - 32 kí tự", MinimumLength = 6)]
        public string PassWord { get; set; }
        [Display(Name = "Ảnh đại diện")]
        public string AvatarLink { get; set; }
        [Display(Name = "Email")]
        public string Email { get; set; }
        [Display(Name = "Số Điện Thoại")]
        public string PhoneNumber { get; set; }
        public string FullName { get; set; }
        public bool Active { get; set; }
        public string Status { get; set; }
        public string FacebookLink { get; set; }
        public string TwitterLink { get; set; }
        public string InstagramLink { get; set; }
        public string Note { get; set; }
        public int Type { get; set; }
    }
    public class UpdateAccountInfoModel
    {
        public int AccountId { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string FullName { get; set; }
        public string FacebookLink { get; set; }
        public string TwitterLink { get; set; }
        public string InstagramLink { get; set; }
        public string Note { get; set; }
    }
}