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
    
    public partial class Point
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Point()
        {
            this.Account_Detail = new HashSet<Account_Detail>();
        }
    
        public int PointId { get; set; }
        public string Id { get; set; }
        public string FullName { get; set; }
        public Nullable<double> PointNumber { get; set; }
        public Nullable<int> StatusActive { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Account_Detail> Account_Detail { get; set; }
    }
}
