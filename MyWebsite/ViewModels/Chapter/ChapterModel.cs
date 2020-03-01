using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Chapter
{
    public class ChapterModel
    {
        public int OrderNumber { get; set; }
        public int ChapterId { get; set; }
        public string FullName { get; set; }
        public DateTime CreateAt { get; set; }
        public int ViewNumber { get; set; }
        public bool StatusActive { get; set; }
        public int MangaId { get; set; }
        public List<PageModel> pageModels { get; set; }
        public string Alias { get; set; }
    }
    public class PageModel
    {
        public int PageId { get; set; }
        public string FullName { get; set; }
        public int OrderNumber { get; set; }

        public string PageLink { get; set; }
        public int StatusActive { get; set; }
        public int ChapterId { get; set; }
        public int CategoryId { get; set; }
        public DateTime CreateAt { get; set; }
        public int AccountId { get; set; }
    }
    public class ListPage
    {
        public int OrderNumber { get; set; }
        public string FullName { get; set; }
    }
}