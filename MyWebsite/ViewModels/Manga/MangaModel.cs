using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyWebsite.ViewModels.Manga
{
    public class MangaModel
    {
       public string UserName { get; set; }
        public int MangaId { get; set; }
        [Required]
        public string FullName { get; set; }
        //[Required]
        public string Alias { get; set; }
        //[Required]
        public string CoverLink { get; set; }
        [Required]
        public string Description { get; set; }
        public string Author { get; set; }
        [Required]
        public int StatusId { get; set; }
        public string status { get; set; }
        public IEnumerable<int> ListGenre { get; set; }
        public DateTime CreatAt { get; set; }
        public int StatusActive { get; set; }
        public int FirstPage { get; set; }
        public int FirstChapter { get; set; }
        public string GenreList { get; set; }
    }
    public class MangaJoin
    {
        public int View { get; set; }
        public string Genre { get; set; }
        public int MangaId { get; set; }
        [Required]
        public string FullName { get; set; }
        //[Required]
        public string Alias { get; set; }
        //[Required]
        public string CoverLink { get; set; }
        [Required]
        public string Description { get; set; }
        public string Author { get; set; }
        [Required]
        public string StatusName { get; set; }
        public List<RoleModel> roles { get; set; }
       
        public DateTime CreatAt { get; set; }
        public int StatusActive { get; set; }
    }
    public class RoleModel
    {
        public int RoleId { get; set; }
        public string Id { get; set; }
        public string FullName { get; set; }
    }
    public class MangaDetail
    {
        public int Type { get; set; }
        public int MangaId { get; set; }
        public string MangaFullName { get; set; }
        public int RoleId { get; set; }
        public string RoleFullName { get; set; }
        public int StatusActive { get; set; }
        public string Language { get; set; }
        public string UserName { get; set; }
        public string LanguageFullname { get; set; }
       
    }
    public class MangaJoinedModel
    {
        public string CoverLink { get; set; }
        public string MangaName { get; set; }
        public string RoleList { get; set; }
    }

}