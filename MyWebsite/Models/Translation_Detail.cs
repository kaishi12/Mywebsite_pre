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
    
    public partial class Translation_Detail
    {
        public int ChapterId { get; set; }
        public int TranslationId { get; set; }
        public bool Active { get; set; }
        public System.DateTime UpdateAt { get; set; }
        public System.DateTime CreateAt { get; set; }
    
        public virtual Chapter Chapter { get; set; }
        public virtual Translation Translation { get; set; }
    }
}
