//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyWebsite.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Notification
    {
        public int NotificationId { get; set; }
        public string NContent { get; set; }
        public Nullable<System.DateTime> CreateAt { get; set; }
        public Nullable<int> Status { get; set; }
        public Nullable<int> AccountId { get; set; }
        public Nullable<int> SeenStatus { get; set; }
        public Nullable<int> NotifyTypeId { get; set; }
    
        public virtual Account Account { get; set; }
        public virtual NotifyType NotifyType { get; set; }
    }
}
