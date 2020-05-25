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
    
    public partial class Manga
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Manga()
        {
            this.Chapters = new HashSet<Chapter>();
            this.Manga_Detail = new HashSet<Manga_Detail>();
            this.Manga_Genres = new HashSet<Manga_Genres>();
            this.Translations = new HashSet<Translation>();
            this.Accounts = new HashSet<Account>();
            this.Accounts1 = new HashSet<Account>();
        }
    
        public int MangaId { get; set; }
        public string CoverLink { get; set; }
        public string FullName { get; set; }
        public string Description { get; set; }
        public System.DateTime CreateAt { get; set; }
        public string Author { get; set; }
        public bool Active { get; set; }
        public string Alias { get; set; }
        public int StatusId { get; set; }
        public System.DateTime UpdateAt { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Chapter> Chapters { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Manga_Detail> Manga_Detail { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Manga_Genres> Manga_Genres { get; set; }
        public virtual Status Status { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Translation> Translations { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Account> Accounts { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Account> Accounts1 { get; set; }
    }
}
