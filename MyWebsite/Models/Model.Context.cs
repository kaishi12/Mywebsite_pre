﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MyWebsiteEntities : DbContext
    {
        public MyWebsiteEntities()
            : base("name=MyWebsiteEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Account> Accounts { get; set; }
        public virtual DbSet<Account_Detail> Account_Detail { get; set; }
        public virtual DbSet<Bookmark> Bookmarks { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Chapter> Chapters { get; set; }
        public virtual DbSet<Document> Documents { get; set; }
        public virtual DbSet<FeedBack> FeedBacks { get; set; }
        public virtual DbSet<Font> Fonts { get; set; }
        public virtual DbSet<Genre> Genres { get; set; }
        public virtual DbSet<Language> Languages { get; set; }
        public virtual DbSet<Manga> Mangas { get; set; }
        public virtual DbSet<Manga_Detail> Manga_Detail { get; set; }
        public virtual DbSet<Manga_Genres> Manga_Genres { get; set; }
        public virtual DbSet<Notification> Notifications { get; set; }
        public virtual DbSet<NotifyType> NotifyTypes { get; set; }
        public virtual DbSet<Page> Pages { get; set; }
        public virtual DbSet<Point> Points { get; set; }
        public virtual DbSet<PointHistory> PointHistories { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Status> Status { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Text> Texts { get; set; }
        public virtual DbSet<TextBox> TextBoxes { get; set; }
        public virtual DbSet<Translation> Translations { get; set; }
        public virtual DbSet<Translation_Detail> Translation_Detail { get; set; }
    }
}
