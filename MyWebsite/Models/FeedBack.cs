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
    
    public partial class FeedBack
    {
        public int Id { get; set; }
        public Nullable<int> AccountId { get; set; }
        public string Description { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public Nullable<int> status { get; set; }
        public Nullable<bool> active { get; set; }
        public string title { get; set; }
    
        public virtual Account Account { get; set; }
    }
}