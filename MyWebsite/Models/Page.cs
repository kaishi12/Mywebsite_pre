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
    
    public partial class Page
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Page()
        {
            this.TextBoxes = new HashSet<TextBox>();
        }
    
        public int PageId { get; set; }
        public string FullName { get; set; }
        public int OrderNumber { get; set; }
        public string PageLink { get; set; }
        public bool Active { get; set; }
        public int ChapterId { get; set; }
        public int CategoryId { get; set; }
        public System.DateTime CreateAt { get; set; }
        public int AccountId { get; set; }
        public int PageId_Fa { get; set; }
        public Nullable<int> Status { get; set; }
    
        public virtual Account Account { get; set; }
        public virtual Category Category { get; set; }
        public virtual Chapter Chapter { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TextBox> TextBoxes { get; set; }
    }
}
