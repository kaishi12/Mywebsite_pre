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
    
    public partial class TextBox
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TextBox()
        {
            this.Texts = new HashSet<Text>();
        }
    
        public int TextBoxId { get; set; }
        public string Coordinate { get; set; }
        public Nullable<int> Witdh { get; set; }
        public Nullable<int> Height { get; set; }
        public Nullable<int> PageId { get; set; }
        public Nullable<int> StatusActive { get; set; }
        public Nullable<int> Degree { get; set; }
    
        public virtual Page Page { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Text> Texts { get; set; }
    }
}
