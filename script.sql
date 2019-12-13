USE [MyWebsite]
GO
/****** Object:  StoredProcedure [dbo].[Translation_UpdateInfo]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Translation_UpdateInfo]
GO
/****** Object:  StoredProcedure [dbo].[Translation_CheckExist]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Translation_CheckExist]
GO
/****** Object:  StoredProcedure [dbo].[Translation_AddnewTranslation]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Translation_AddnewTranslation]
GO
/****** Object:  StoredProcedure [dbo].[Role_GetRoleInfoById]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Role_GetRoleInfoById]
GO
/****** Object:  StoredProcedure [dbo].[Role_GetRoldIdbyId]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Role_GetRoldIdbyId]
GO
/****** Object:  StoredProcedure [dbo].[MangaGenre_UpdateStatus]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[MangaGenre_UpdateStatus]
GO
/****** Object:  StoredProcedure [dbo].[MangaGenre_GetListGenreId]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[MangaGenre_GetListGenreId]
GO
/****** Object:  StoredProcedure [dbo].[MangaGenre_Addnew]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[MangaGenre_Addnew]
GO
/****** Object:  StoredProcedure [dbo].[MangaDetail_GetInfo]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[MangaDetail_GetInfo]
GO
/****** Object:  StoredProcedure [dbo].[MangaDetail_GetAccountCreateManga]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[MangaDetail_GetAccountCreateManga]
GO
/****** Object:  StoredProcedure [dbo].[MangaDetail_CheckOldPassWord]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[MangaDetail_CheckOldPassWord]
GO
/****** Object:  StoredProcedure [dbo].[MangaDetail_CheckJoin]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[MangaDetail_CheckJoin]
GO
/****** Object:  StoredProcedure [dbo].[MangaDetail_ChangeStatus]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[MangaDetail_ChangeStatus]
GO
/****** Object:  StoredProcedure [dbo].[MangaDetail_AddNewRole]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[MangaDetail_AddNewRole]
GO
/****** Object:  StoredProcedure [dbo].[Manga_UpdateInfoManga]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Manga_UpdateInfoManga]
GO
/****** Object:  StoredProcedure [dbo].[Manga_Search]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Manga_Search]
GO
/****** Object:  StoredProcedure [dbo].[Manga_GetMangaInfoById]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Manga_GetMangaInfoById]
GO
/****** Object:  StoredProcedure [dbo].[Manga_GetMangaInfo]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Manga_GetMangaInfo]
GO
/****** Object:  StoredProcedure [dbo].[Manga_GetListManga]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Manga_GetListManga]
GO
/****** Object:  StoredProcedure [dbo].[Manga_GetListJoined]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Manga_GetListJoined]
GO
/****** Object:  StoredProcedure [dbo].[Manga_CheckNameManga]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Manga_CheckNameManga]
GO
/****** Object:  StoredProcedure [dbo].[Manga_ChangeStatusManga]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Manga_ChangeStatusManga]
GO
/****** Object:  StoredProcedure [dbo].[Manga_AddnewManga]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Manga_AddnewManga]
GO
/****** Object:  StoredProcedure [dbo].[Language_GetList]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Language_GetList]
GO
/****** Object:  StoredProcedure [dbo].[Chapter_AddNewChapter]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Chapter_AddNewChapter]
GO
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountStatus]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Account_UpdateAccountStatus]
GO
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountPassWord]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Account_UpdateAccountPassWord]
GO
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountNote]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Account_UpdateAccountNote]
GO
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountInfo]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Account_UpdateAccountInfo]
GO
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountImg]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Account_UpdateAccountImg]
GO
/****** Object:  StoredProcedure [dbo].[Account_Search]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Account_Search]
GO
/****** Object:  StoredProcedure [dbo].[Account_Register]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Account_Register]
GO
/****** Object:  StoredProcedure [dbo].[Account_Login]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Account_Login]
GO
/****** Object:  StoredProcedure [dbo].[Account_GetAccountInfobyId]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Account_GetAccountInfobyId]
GO
/****** Object:  StoredProcedure [dbo].[Account_GetAccountIdbyUserName]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Account_GetAccountIdbyUserName]
GO
/****** Object:  StoredProcedure [dbo].[Account_CheckUserName]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP PROCEDURE [dbo].[Account_CheckUserName]
GO
ALTER TABLE [dbo].[Translation_Detail] DROP CONSTRAINT [FK_Translation_Detail_Translation]
GO
ALTER TABLE [dbo].[Translation_Detail] DROP CONSTRAINT [FK_Translation_Detail_Manga]
GO
ALTER TABLE [dbo].[Translation_Detail] DROP CONSTRAINT [FK_Translation_Detail_Chapter]
GO
ALTER TABLE [dbo].[Translation] DROP CONSTRAINT [FK_Translation_Manga]
GO
ALTER TABLE [dbo].[Translation] DROP CONSTRAINT [FK_Translation_Language]
GO
ALTER TABLE [dbo].[Translation] DROP CONSTRAINT [FK_Translation_Account]
GO
ALTER TABLE [dbo].[TextBox] DROP CONSTRAINT [FK_TextBox_Page]
GO
ALTER TABLE [dbo].[Text] DROP CONSTRAINT [FK_Text_Translation]
GO
ALTER TABLE [dbo].[Text] DROP CONSTRAINT [FK_Text_TextBox1]
GO
ALTER TABLE [dbo].[Text] DROP CONSTRAINT [FK_Text_Font]
GO
ALTER TABLE [dbo].[Text] DROP CONSTRAINT [FK_Text_Account]
GO
ALTER TABLE [dbo].[Page] DROP CONSTRAINT [FK_Page_Chapter]
GO
ALTER TABLE [dbo].[Page] DROP CONSTRAINT [FK_Page_Category]
GO
ALTER TABLE [dbo].[Page] DROP CONSTRAINT [FK_Page_Account]
GO
ALTER TABLE [dbo].[Notification] DROP CONSTRAINT [FK_Notification_NotifyType]
GO
ALTER TABLE [dbo].[Notification] DROP CONSTRAINT [FK_Notification_Account]
GO
ALTER TABLE [dbo].[Manga_Genres] DROP CONSTRAINT [FK_Manga_Genres_Manga]
GO
ALTER TABLE [dbo].[Manga_Genres] DROP CONSTRAINT [FK_Manga_Genres_Genre]
GO
ALTER TABLE [dbo].[Manga_Detail] DROP CONSTRAINT [FK_Manga_Detail_Role]
GO
ALTER TABLE [dbo].[Manga_Detail] DROP CONSTRAINT [FK_Manga_Detail_Manga1]
GO
ALTER TABLE [dbo].[Manga_Detail] DROP CONSTRAINT [FK_Manga_Detail_Account]
GO
ALTER TABLE [dbo].[Manga] DROP CONSTRAINT [FK_Manga_Status]
GO
ALTER TABLE [dbo].[Chapter] DROP CONSTRAINT [FK_Chapter_Manga]
GO
ALTER TABLE [dbo].[Bookmark] DROP CONSTRAINT [FK_Bookmark_Manga]
GO
ALTER TABLE [dbo].[Bookmark] DROP CONSTRAINT [FK_Bookmark_Account]
GO
ALTER TABLE [dbo].[Account_Detail] DROP CONSTRAINT [FK_Account_Detail_Point]
GO
ALTER TABLE [dbo].[Account_Detail] DROP CONSTRAINT [FK_Account_Detail_Account]
GO
/****** Object:  Table [dbo].[Translation_Detail]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Translation_Detail]
GO
/****** Object:  Table [dbo].[Translation]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Translation]
GO
/****** Object:  Table [dbo].[TextBox]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[TextBox]
GO
/****** Object:  Table [dbo].[Text]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Text]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Status]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Role]
GO
/****** Object:  Table [dbo].[Point]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Point]
GO
/****** Object:  Table [dbo].[Page]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Page]
GO
/****** Object:  Table [dbo].[NotifyType]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[NotifyType]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Notification]
GO
/****** Object:  Table [dbo].[Manga_Genres]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Manga_Genres]
GO
/****** Object:  Table [dbo].[Manga_Detail]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Manga_Detail]
GO
/****** Object:  Table [dbo].[Manga]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Manga]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Language]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Genre]
GO
/****** Object:  Table [dbo].[Font]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Font]
GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Chapter]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Category]
GO
/****** Object:  Table [dbo].[Bookmark]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Bookmark]
GO
/****** Object:  Table [dbo].[Account_Detail]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Account_Detail]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/13/2019 4:25:47 PM ******/
DROP TABLE [dbo].[Account]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/13/2019 4:25:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[AvatarLink] [nvarchar](50) NULL,
	[StatusActive] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[PassWord] [nvarchar](50) NULL,
	[ResetPasswordCode] [nvarchar](100) NULL,
	[FacebookLink] [nvarchar](50) NULL,
	[TwitterLink] [nvarchar](50) NULL,
	[InstagramLink] [nvarchar](50) NULL,
	[Status] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Detail]    Script Date: 12/13/2019 4:25:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Detail](
	[AccountId] [int] NOT NULL,
	[PointId] [int] NOT NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_Account_Detail] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC,
	[PointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookmark]    Script Date: 12/13/2019 4:25:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookmark](
	[AccountId] [int] NOT NULL,
	[MangaId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/13/2019 4:25:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[StatusActive] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 12/13/2019 4:25:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chapter](
	[ChapterId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[OrderNumber] [int] NULL,
	[ViewNumber] [int] NULL,
	[CreateAt] [datetime] NULL,
	[StatusActive] [int] NULL,
	[MangaId] [int] NULL,
	[Alias] [nvarchar](max) NULL,
 CONSTRAINT [PK_Chapter] PRIMARY KEY CLUSTERED 
(
	[ChapterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Font]    Script Date: 12/13/2019 4:25:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Font](
	[FontId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[FontLink] [nvarchar](200) NULL,
	[Description] [nvarchar](50) NULL,
	[StatusActive] [int] NULL,
	[Type] [nvarchar](100) NULL,
 CONSTRAINT [PK_Font] PRIMARY KEY CLUSTERED 
(
	[FontId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 12/13/2019 4:25:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Id] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Alias] [nvarchar](50) NULL,
	[StatusActive] [int] NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 12/13/2019 4:25:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[LanguageId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Note] [nvarchar](50) NULL,
	[StatusActive] [int] NULL,
	[Id] [nvarchar](50) NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manga]    Script Date: 12/13/2019 4:25:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manga](
	[MangaId] [int] IDENTITY(1,1) NOT NULL,
	[CoverLink] [nvarchar](50) NULL,
	[FullName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CreateAt] [datetime] NULL,
	[Author] [nvarchar](50) NULL,
	[StatusActive] [int] NULL,
	[Alias] [nvarchar](max) NULL,
	[StatusId] [int] NULL,
	[UpdateAt] [datetime] NULL,
 CONSTRAINT [PK_Manga] PRIMARY KEY CLUSTERED 
(
	[MangaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manga_Detail]    Script Date: 12/13/2019 4:25:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manga_Detail](
	[AccountId] [int] NOT NULL,
	[MangaId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[StatusActive] [int] NULL,
	[Type] [int] NULL,
	[Language] [nvarchar](50) NULL,
 CONSTRAINT [PK_Manga_Detail] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC,
	[MangaId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manga_Genres]    Script Date: 12/13/2019 4:25:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manga_Genres](
	[MangaId] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
	[StatusActive] [int] NULL,
 CONSTRAINT [PK_Manga_Genres] PRIMARY KEY CLUSTERED 
(
	[MangaId] ASC,
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 12/13/2019 4:25:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationId] [int] IDENTITY(1,1) NOT NULL,
	[NContent] [nvarchar](max) NULL,
	[CreateAt] [datetime] NULL,
	[Status] [int] NULL,
	[AccountId] [int] NULL,
	[NotifyTypeId] [int] NULL,
	[SeenStatus] [int] NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotifyType]    Script Date: 12/13/2019 4:25:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotifyType](
	[NotifyTypeId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[StatusActive] [int] NULL,
	[NTContent] [nvarchar](max) NULL,
 CONSTRAINT [PK_NotifyType] PRIMARY KEY CLUSTERED 
(
	[NotifyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Page]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[PageId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](2000) NULL,
	[OrderNumber] [int] NULL,
	[PageLink] [nvarchar](2000) NULL,
	[StatusActive] [int] NULL,
	[ChapterId] [int] NULL,
	[CategoryId] [int] NULL,
	[CreateAt] [datetime] NULL,
	[AccountId] [int] NULL,
	[PageId_Fa] [int] NULL,
 CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED 
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Point]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Point](
	[PointId] [int] IDENTITY(1,1) NOT NULL,
	[Id] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[PointNumber] [float] NULL,
	[StatusActive] [int] NULL,
 CONSTRAINT [PK_Point] PRIMARY KEY CLUSTERED 
(
	[PointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Id] [nchar](10) NULL,
	[StatusActive] [int] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[StatusActive] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Text]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Text](
	[TextId] [int] IDENTITY(1,1) NOT NULL,
	[TextContent] [nvarchar](max) NULL,
	[ColorText] [nchar](10) NULL,
	[ColorOutline] [nchar](10) NULL,
	[Bold] [int] NULL,
	[StatusActive] [int] NULL,
	[StatusAllow] [int] NULL,
	[TranslationId] [int] NULL,
	[AccountId] [int] NULL,
	[TextBoxId] [int] NULL,
	[FontId] [int] NULL,
	[FontSize] [int] NULL,
	[Italic] [nchar](10) NULL,
 CONSTRAINT [PK_Text] PRIMARY KEY CLUSTERED 
(
	[TextId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TextBox]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextBox](
	[TextBoxId] [int] IDENTITY(1,1) NOT NULL,
	[Coordinate] [nvarchar](50) NULL,
	[Witdh] [int] NULL,
	[Height] [int] NULL,
	[PageId] [int] NULL,
	[StatusActive] [int] NULL,
	[Degree] [int] NULL,
 CONSTRAINT [PK_TextBox] PRIMARY KEY CLUSTERED 
(
	[TextBoxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Translation]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translation](
	[TransationId] [int] IDENTITY(1,1) NOT NULL,
	[MangaId] [int] NULL,
	[AccountId] [int] NULL,
	[LanguageId] [int] NULL,
	[StatusActive] [int] NULL,
 CONSTRAINT [PK_Translation] PRIMARY KEY CLUSTERED 
(
	[TransationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Translation_Detail]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translation_Detail](
	[ChapterId] [int] NOT NULL,
	[TranslationId] [int] NOT NULL,
	[StatusActive] [int] NULL,
	[UpdateAt] [datetime] NULL,
	[MangaId] [int] NULL,
 CONSTRAINT [PK_Translation_Detail] PRIMARY KEY CLUSTERED 
(
	[ChapterId] ASC,
	[TranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountId], [FullName], [Email], [PhoneNumber], [AvatarLink], [StatusActive], [UserName], [PassWord], [ResetPasswordCode], [FacebookLink], [TwitterLink], [InstagramLink], [Status], [Note]) VALUES (1, N'Trung Hiếu', N'kaishi.ga@gmail.com', N'0918325891', N'2.jpg', 0, N'kaishi', N'28D4C424824275719BB9402659ADCBB2', NULL, N'a', N'b', N'c', N'I''m not feeling Good!', N'd')
INSERT [dbo].[Account] ([AccountId], [FullName], [Email], [PhoneNumber], [AvatarLink], [StatusActive], [UserName], [PassWord], [ResetPasswordCode], [FacebookLink], [TwitterLink], [InstagramLink], [Status], [Note]) VALUES (2, NULL, N'kaishi.ga@gmail.com', N'0918325891', NULL, 0, N'kaishi12', N'28D4C424824275719BB9402659ADCBB2', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccountId], [FullName], [Email], [PhoneNumber], [AvatarLink], [StatusActive], [UserName], [PassWord], [ResetPasswordCode], [FacebookLink], [TwitterLink], [InstagramLink], [Status], [Note]) VALUES (3, NULL, N'kaishi122134@gmail.com', N'0797634698', NULL, 0, N'kaishi123', N'326C5F2A7FAC69A83432AA175DBBA2B2', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccountId], [FullName], [Email], [PhoneNumber], [AvatarLink], [StatusActive], [UserName], [PassWord], [ResetPasswordCode], [FacebookLink], [TwitterLink], [InstagramLink], [Status], [Note]) VALUES (4, NULL, N'kaishitest@gmail.com', N'0918325891', N'11.jpg', 0, N'kaishitest', N'9537C788F8C2892783E8B048E5C86E10', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccountId], [FullName], [Email], [PhoneNumber], [AvatarLink], [StatusActive], [UserName], [PassWord], [ResetPasswordCode], [FacebookLink], [TwitterLink], [InstagramLink], [Status], [Note]) VALUES (5, NULL, N'trikiet60@yahoo.com.vn', N'0786687369', NULL, NULL, N'trikiet60', N'FED08F81537583F3004A3A46102656AB', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([AccountId], [FullName], [Email], [PhoneNumber], [AvatarLink], [StatusActive], [UserName], [PassWord], [ResetPasswordCode], [FacebookLink], [TwitterLink], [InstagramLink], [Status], [Note]) VALUES (6, NULL, N'song_la_chet_34@yahoo.com', N'012021211141', NULL, 0, N'ryuukais', N'28D4C424824275719BB9402659ADCBB2', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [FullName], [StatusActive]) VALUES (1, N'Raw', 0)
INSERT [dbo].[Category] ([CategoryId], [FullName], [StatusActive]) VALUES (2, N'Clear-Text', 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Chapter] ON 

INSERT [dbo].[Chapter] ([ChapterId], [FullName], [OrderNumber], [ViewNumber], [CreateAt], [StatusActive], [MangaId], [Alias]) VALUES (21, N'Level 1 Days Zuikaku - -Fairies', 1, 0, CAST(N'2019-11-17T12:52:01.080' AS DateTime), 0, 2, N'c1')
SET IDENTITY_INSERT [dbo].[Chapter] OFF
SET IDENTITY_INSERT [dbo].[Font] ON 

INSERT [dbo].[Font] ([FontId], [FullName], [FontLink], [Description], [StatusActive], [Type]) VALUES (8, N'Playfair_Display', N'/Playfair_Display/font.css', NULL, 0, N'400;700;900')
SET IDENTITY_INSERT [dbo].[Font] OFF
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (1, N'Action', NULL, NULL, N'action', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (2, N'Adventure', NULL, NULL, N'adventure', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (3, N'Comedy', NULL, NULL, N'comedy', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (4, N'Cooking', NULL, NULL, N'cooking', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (5, N'Doujinshi', NULL, NULL, N'doujinshi', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (6, N'Drama', NULL, NULL, N'drama', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (7, N'Ecchi', NULL, NULL, N'ecchi', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (8, N'Fantasy', NULL, NULL, N'fantasy', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (9, N'Gender bender', NULL, NULL, N'gender-bender', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (10, N'Harem', NULL, NULL, N'harem', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (11, N'Historical', NULL, NULL, N'historical', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (12, N'Horror', NULL, NULL, N'horror', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (13, N'Isekai', NULL, NULL, N'isekai', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (14, N'Josei', NULL, NULL, N'josei', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (15, N'Manhua', NULL, NULL, N'manhua', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (16, N'Manhwa', NULL, NULL, N'manhwa', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (17, N'Martial arts', NULL, NULL, N'martial-arts', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (18, N'Mature', NULL, NULL, N'mature', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (19, N'Mecha', NULL, NULL, N'mecha', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (20, N'Medical', NULL, NULL, N'medical', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (21, N'Mystery', NULL, NULL, N'mystery', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (22, N'One shot', NULL, NULL, N'one-shot', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (23, N'Psychological', NULL, NULL, N'psychological', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (24, N'Romance', NULL, NULL, N'romance', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (25, N'School life', NULL, NULL, N'school-life', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (26, N'Sci fi', NULL, NULL, N'sci-fi', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (27, N'Seinen', NULL, NULL, N'seinen', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (28, N'Shoujo', NULL, NULL, N'shoujo', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (29, N'Shoujo ai', NULL, NULL, N'shoijo-ai', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (30, N'Shounen', NULL, NULL, N'shounen', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (31, N'Shounen ai', NULL, NULL, N'shounen-ai', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (32, N'Slice of life', NULL, NULL, N'slice-of-life', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (33, N'Smut', NULL, NULL, N'smut', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (34, N'Sports', NULL, NULL, N'sports', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (35, N'Supernatural', NULL, NULL, N'supernatural', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (36, N'Tragedy', NULL, NULL, N'tragedy', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (37, N'Webtoons', NULL, NULL, N'webtoons', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (38, N'Yaoi', NULL, NULL, N'yaoi', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [StatusActive]) VALUES (39, N'Yuri', NULL, NULL, N'yuri', 0)
SET IDENTITY_INSERT [dbo].[Genre] OFF
SET IDENTITY_INSERT [dbo].[Language] ON 

INSERT [dbo].[Language] ([LanguageId], [FullName], [Note], [StatusActive], [Id]) VALUES (1, N'Tiếng Việt', NULL, 0, N'vn')
INSERT [dbo].[Language] ([LanguageId], [FullName], [Note], [StatusActive], [Id]) VALUES (2, N'Tiếng Anh', NULL, 0, N'en')
INSERT [dbo].[Language] ([LanguageId], [FullName], [Note], [StatusActive], [Id]) VALUES (3, N'Tiếng Pháp', NULL, 0, N'fr')
SET IDENTITY_INSERT [dbo].[Language] OFF
SET IDENTITY_INSERT [dbo].[Manga] ON 

INSERT [dbo].[Manga] ([MangaId], [CoverLink], [FullName], [Description], [CreateAt], [Author], [StatusActive], [Alias], [StatusId], [UpdateAt]) VALUES (2, N'3.jpg', N'Level 1 Days Zuikaku - -Fairies- ', N'Doujinshi về tàu biển.', CAST(N'2019-12-13T15:35:29.340' AS DateTime), N'Rika', 0, NULL, 2, CAST(N'2019-09-30T23:58:25.413' AS DateTime))
INSERT [dbo].[Manga] ([MangaId], [CoverLink], [FullName], [Description], [CreateAt], [Author], [StatusActive], [Alias], [StatusId], [UpdateAt]) VALUES (9, N'4.jpg', N'ádadasdada', N'ádadadasda', CAST(N'2019-12-13T15:42:58.217' AS DateTime), N'ádasdsada', 0, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Manga] OFF
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [StatusActive], [Type], [Language]) VALUES (1, 2, 1, 0, NULL, NULL)
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [StatusActive], [Type], [Language]) VALUES (1, 2, 3, 0, 0, N'vn')
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [StatusActive], [Type], [Language]) VALUES (1, 2, 4, 0, 0, N'vn')
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [StatusActive], [Type], [Language]) VALUES (1, 2, 5, 0, 0, N'vn')
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [StatusActive], [Type], [Language]) VALUES (1, 9, 1, 0, NULL, NULL)
INSERT [dbo].[Manga_Genres] ([MangaId], [GenreId], [StatusActive]) VALUES (2, 2, 1)
INSERT [dbo].[Manga_Genres] ([MangaId], [GenreId], [StatusActive]) VALUES (2, 3, 1)
INSERT [dbo].[Manga_Genres] ([MangaId], [GenreId], [StatusActive]) VALUES (2, 5, 1)
INSERT [dbo].[Manga_Genres] ([MangaId], [GenreId], [StatusActive]) VALUES (2, 6, 1)
INSERT [dbo].[Manga_Genres] ([MangaId], [GenreId], [StatusActive]) VALUES (9, 2, 1)
INSERT [dbo].[Manga_Genres] ([MangaId], [GenreId], [StatusActive]) VALUES (9, 3, 0)
INSERT [dbo].[Manga_Genres] ([MangaId], [GenreId], [StatusActive]) VALUES (9, 5, 0)
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (158, N'<strong>kaishi </strong>đã mời bạn tham gia truyện: Level 1 Days Zuikaku - -Fairies-  vị trí Upload Clear-text.', CAST(N'2019-11-17T12:48:01.773' AS DateTime), 0, 1, 2, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (159, N'<strong>kaishi </strong>đã mời bạn tham gia truyện: Level 1 Days Zuikaku - -Fairies-  vị trí Quản lí bản dịch.', CAST(N'2019-11-17T12:48:10.667' AS DateTime), 0, 1, 2, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (160, N'<strong>kaishi </strong>đã mời bạn tham gia truyện: Level 1 Days Zuikaku - -Fairies-  vị trí Dịch truyện.', CAST(N'2019-11-17T12:48:17.997' AS DateTime), 0, 1, 2, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (161, N'<strong>Lời mời tham gia </strong>truyện: Level 1 Days Zuikaku - -Fairies- , vị trí RoleFullName tới kaishi đã được duyệt.', CAST(N'2019-11-17T12:52:15.640' AS DateTime), 0, 1, 4, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (162, N'<strong>Lời mời tham gia </strong>truyện: Level 1 Days Zuikaku - -Fairies- , vị trí RoleFullName tới kaishi đã được duyệt.', CAST(N'2019-11-17T12:52:26.247' AS DateTime), 0, 1, 4, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (163, N'<strong>Lời mời tham gia </strong>truyện: Level 1 Days Zuikaku - -Fairies- , vị trí RoleFullName tới kaishi đã được duyệt.', CAST(N'2019-11-17T12:52:39.887' AS DateTime), 0, 1, 4, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (164, N'<strong>Trang 1 clear-text </strong>chương 1 truyện: Level 1 Days Zuikaku - -Fairies-  của bạn đã được duyệt.', CAST(N'2019-11-17T12:53:52.380' AS DateTime), 0, 1, 6, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (165, N'<strong>Trang 2 clear-text </strong>chương 2 truyện: Level 1 Days Zuikaku - -Fairies-  của bạn đã được duyệt.', CAST(N'2019-11-17T12:54:00.477' AS DateTime), 0, 1, 6, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (166, N'<strong>Thoại dịch </strong>trang 1 chương 1 truyện: Level 1 Days Zuikaku - -Fairies-  ngôn ngữ Tiếng Việt của bạn đã được duyệt.', CAST(N'2019-11-17T12:55:10.603' AS DateTime), 0, 1, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (167, N'<strong>Thoại dịch </strong>trang 1 chương 1 truyện: Level 1 Days Zuikaku - -Fairies-  ngôn ngữ Tiếng Việt của bạn đã được duyệt.', CAST(N'2019-11-17T12:55:15.703' AS DateTime), 0, 1, 5, 0)
SET IDENTITY_INSERT [dbo].[Notification] OFF
SET IDENTITY_INSERT [dbo].[NotifyType] ON 

INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [StatusActive], [NTContent]) VALUES (1, N'Request', 0, N'<strong>UserName </strong>đã gửi yêu cầu tham gia truyện: MangaName của bạn vị trí RoleName.')
INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [StatusActive], [NTContent]) VALUES (2, N'Invite', 0, N'<strong>UserName </strong>đã mời bạn tham gia truyện: MangaName vị trí RoleName.')
INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [StatusActive], [NTContent]) VALUES (3, N'RequestRespone', 0, N'<strong>Yêu cầu tham gia </strong>truyện: MangaName, vị trí RoleName của bạn đã được duyệt.')
INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [StatusActive], [NTContent]) VALUES (4, N'InviteReply', 0, N'<strong>Lời mời tham gia </strong>truyện: MangaName, vị trí RoleFullName tới UserName đã được duyệt.')
INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [StatusActive], [NTContent]) VALUES (5, N'Trans', 0, N'<strong>Thoại dịch </strong>trang PageOrder chương ChapterOrder truyện: MangaName ngôn ngữ Language của bạn đã được duyệt.')
INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [StatusActive], [NTContent]) VALUES (6, N'Upload', 0, N'<strong>Trang ChapterOrder clear-text </strong>chương ChapterOrder truyện: MangaName của bạn đã được duyệt.')
INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [StatusActive], [NTContent]) VALUES (7, N'AddNew', 0, N'<strong>Truyện: MangaName </strong>đã thêm chương truyện ChapterOrder: ChapterName.')
SET IDENTITY_INSERT [dbo].[NotifyType] OFF
SET IDENTITY_INSERT [dbo].[Page] ON 

INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [StatusActive], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa]) VALUES (31, N'trang 1-Level 1 Days Zuikaku - -Fairies', 1, N'1b.png', 0, 21, 1, CAST(N'2019-11-17T12:52:01.100' AS DateTime), 1, NULL)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [StatusActive], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa]) VALUES (32, N'trang 2-Level 1 Days Zuikaku - -Fairies', 2, N'1c.png', 0, 21, 1, CAST(N'2019-11-17T12:52:01.120' AS DateTime), 1, NULL)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [StatusActive], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa]) VALUES (33, N'trang 1-Level 1 Days Zuikaku - -Fairies-Clear-text-', 1, N'1b-cleartext.png', 0, 21, 2, CAST(N'2019-11-17T12:52:56.727' AS DateTime), 1, 31)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [StatusActive], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa]) VALUES (34, N'trang 2-Level 1 Days Zuikaku - -Fairies-Clear-text-', 2, N'1c-cleartext.png', 0, 21, 2, CAST(N'2019-11-17T12:53:02.537' AS DateTime), 1, 32)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [StatusActive], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa]) VALUES (35, N'Trang 0 Level 1 Days Zuikaku - -Fairies', 0, N'Capture.PNG', 1, 21, 1, CAST(N'2019-11-18T11:23:48.967' AS DateTime), 1, NULL)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [StatusActive], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa]) VALUES (36, N'Trang 2 Level 1 Days Zuikaku - -Fairies', 2, N'Capture.PNG', 1, 21, 1, CAST(N'2019-11-18T11:28:26.827' AS DateTime), 1, NULL)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [StatusActive], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa]) VALUES (37, N'Trang 3 Level 1 Days Zuikaku - -Fairies', 3, N'Capture.PNG', 1, 21, 1, CAST(N'2019-11-18T11:29:25.950' AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[Page] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [FullName], [Id], [StatusActive]) VALUES (1, N'Quản lí bản dịch', N'MC        ', 0)
INSERT [dbo].[Role] ([RoleId], [FullName], [Id], [StatusActive]) VALUES (2, N'Tải lên Raw', N'CC        ', 0)
INSERT [dbo].[Role] ([RoleId], [FullName], [Id], [StatusActive]) VALUES (3, N'Dịch truyện', N'Tr        ', 0)
INSERT [dbo].[Role] ([RoleId], [FullName], [Id], [StatusActive]) VALUES (4, N'Quản lí bản dịch', N'TM        ', 0)
INSERT [dbo].[Role] ([RoleId], [FullName], [Id], [StatusActive]) VALUES (5, N'Tải lên Clear-text', N'Ed        ', 0)
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusId], [FullName], [StatusActive]) VALUES (1, N'Hoàn thành', N'0')
INSERT [dbo].[Status] ([StatusId], [FullName], [StatusActive]) VALUES (2, N'Chưa hoàn thành', N'0')
INSERT [dbo].[Status] ([StatusId], [FullName], [StatusActive]) VALUES (3, N'Drop', N'0')
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[Text] ON 

INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [StatusActive], [StatusAllow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (7, N'Thế nào rồi, Zuikaku?', N'#000000   ', NULL, 400, 0, 0, 5, 1, 35, 8, 14, N'0         ')
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [StatusActive], [StatusAllow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (8, N'Em đã hiểu được những fairy nói gì chưa?', N'#000000   ', NULL, 400, 0, 0, 5, 1, 36, 8, 14, N'0         ')
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [StatusActive], [StatusAllow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (9, N'Em chẳng hiểu gì cả', N'#000000   ', NULL, 700, 0, 1, 5, 1, 37, 8, 18, N'0         ')
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [StatusActive], [StatusAllow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (10, N'Vậy cùng đi luyện tập thôi', N'#000000   ', NULL, 700, 0, 1, 5, 1, 38, 8, 18, N'0         ')
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [StatusActive], [StatusAllow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (11, N'Đi nào', N'#000000   ', NULL, 700, 0, 1, 5, 1, 39, 8, 18, N'0         ')
SET IDENTITY_INSERT [dbo].[Text] OFF
SET IDENTITY_INSERT [dbo].[TextBox] ON 

INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [StatusActive], [Degree]) VALUES (35, N'36,442', 78, 105, 31, 0, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [StatusActive], [Degree]) VALUES (36, N'184,81', 97, 120, 31, 0, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [StatusActive], [Degree]) VALUES (37, N'482,282', 71, 112, 31, 0, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [StatusActive], [Degree]) VALUES (38, N'177,274', 58, 98, 31, 0, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [StatusActive], [Degree]) VALUES (39, N'120,289', 45, 61, 31, 0, 0)
SET IDENTITY_INSERT [dbo].[TextBox] OFF
SET IDENTITY_INSERT [dbo].[Translation] ON 

INSERT [dbo].[Translation] ([TransationId], [MangaId], [AccountId], [LanguageId], [StatusActive]) VALUES (5, 2, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[Translation] OFF
INSERT [dbo].[Translation_Detail] ([ChapterId], [TranslationId], [StatusActive], [UpdateAt], [MangaId]) VALUES (21, 5, 0, CAST(N'2019-11-17T12:58:55.307' AS DateTime), 2)
ALTER TABLE [dbo].[Account_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Account_Detail_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Account_Detail] CHECK CONSTRAINT [FK_Account_Detail_Account]
GO
ALTER TABLE [dbo].[Account_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Account_Detail_Point] FOREIGN KEY([PointId])
REFERENCES [dbo].[Point] ([PointId])
GO
ALTER TABLE [dbo].[Account_Detail] CHECK CONSTRAINT [FK_Account_Detail_Point]
GO
ALTER TABLE [dbo].[Bookmark]  WITH CHECK ADD  CONSTRAINT [FK_Bookmark_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Bookmark] CHECK CONSTRAINT [FK_Bookmark_Account]
GO
ALTER TABLE [dbo].[Bookmark]  WITH CHECK ADD  CONSTRAINT [FK_Bookmark_Manga] FOREIGN KEY([MangaId])
REFERENCES [dbo].[Manga] ([MangaId])
GO
ALTER TABLE [dbo].[Bookmark] CHECK CONSTRAINT [FK_Bookmark_Manga]
GO
ALTER TABLE [dbo].[Chapter]  WITH CHECK ADD  CONSTRAINT [FK_Chapter_Manga] FOREIGN KEY([MangaId])
REFERENCES [dbo].[Manga] ([MangaId])
GO
ALTER TABLE [dbo].[Chapter] CHECK CONSTRAINT [FK_Chapter_Manga]
GO
ALTER TABLE [dbo].[Manga]  WITH CHECK ADD  CONSTRAINT [FK_Manga_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Manga] CHECK CONSTRAINT [FK_Manga_Status]
GO
ALTER TABLE [dbo].[Manga_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Manga_Detail_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Manga_Detail] CHECK CONSTRAINT [FK_Manga_Detail_Account]
GO
ALTER TABLE [dbo].[Manga_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Manga_Detail_Manga1] FOREIGN KEY([MangaId])
REFERENCES [dbo].[Manga] ([MangaId])
GO
ALTER TABLE [dbo].[Manga_Detail] CHECK CONSTRAINT [FK_Manga_Detail_Manga1]
GO
ALTER TABLE [dbo].[Manga_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Manga_Detail_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Manga_Detail] CHECK CONSTRAINT [FK_Manga_Detail_Role]
GO
ALTER TABLE [dbo].[Manga_Genres]  WITH CHECK ADD  CONSTRAINT [FK_Manga_Genres_Genre] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genre] ([GenreId])
GO
ALTER TABLE [dbo].[Manga_Genres] CHECK CONSTRAINT [FK_Manga_Genres_Genre]
GO
ALTER TABLE [dbo].[Manga_Genres]  WITH CHECK ADD  CONSTRAINT [FK_Manga_Genres_Manga] FOREIGN KEY([MangaId])
REFERENCES [dbo].[Manga] ([MangaId])
GO
ALTER TABLE [dbo].[Manga_Genres] CHECK CONSTRAINT [FK_Manga_Genres_Manga]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Account]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_NotifyType] FOREIGN KEY([NotifyTypeId])
REFERENCES [dbo].[NotifyType] ([NotifyTypeId])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_NotifyType]
GO
ALTER TABLE [dbo].[Page]  WITH CHECK ADD  CONSTRAINT [FK_Page_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Page] CHECK CONSTRAINT [FK_Page_Account]
GO
ALTER TABLE [dbo].[Page]  WITH CHECK ADD  CONSTRAINT [FK_Page_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Page] CHECK CONSTRAINT [FK_Page_Category]
GO
ALTER TABLE [dbo].[Page]  WITH CHECK ADD  CONSTRAINT [FK_Page_Chapter] FOREIGN KEY([ChapterId])
REFERENCES [dbo].[Chapter] ([ChapterId])
GO
ALTER TABLE [dbo].[Page] CHECK CONSTRAINT [FK_Page_Chapter]
GO
ALTER TABLE [dbo].[Text]  WITH CHECK ADD  CONSTRAINT [FK_Text_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Text] CHECK CONSTRAINT [FK_Text_Account]
GO
ALTER TABLE [dbo].[Text]  WITH CHECK ADD  CONSTRAINT [FK_Text_Font] FOREIGN KEY([FontId])
REFERENCES [dbo].[Font] ([FontId])
GO
ALTER TABLE [dbo].[Text] CHECK CONSTRAINT [FK_Text_Font]
GO
ALTER TABLE [dbo].[Text]  WITH CHECK ADD  CONSTRAINT [FK_Text_TextBox1] FOREIGN KEY([TextBoxId])
REFERENCES [dbo].[TextBox] ([TextBoxId])
GO
ALTER TABLE [dbo].[Text] CHECK CONSTRAINT [FK_Text_TextBox1]
GO
ALTER TABLE [dbo].[Text]  WITH CHECK ADD  CONSTRAINT [FK_Text_Translation] FOREIGN KEY([TranslationId])
REFERENCES [dbo].[Translation] ([TransationId])
GO
ALTER TABLE [dbo].[Text] CHECK CONSTRAINT [FK_Text_Translation]
GO
ALTER TABLE [dbo].[TextBox]  WITH CHECK ADD  CONSTRAINT [FK_TextBox_Page] FOREIGN KEY([PageId])
REFERENCES [dbo].[Page] ([PageId])
GO
ALTER TABLE [dbo].[TextBox] CHECK CONSTRAINT [FK_TextBox_Page]
GO
ALTER TABLE [dbo].[Translation]  WITH CHECK ADD  CONSTRAINT [FK_Translation_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Translation] CHECK CONSTRAINT [FK_Translation_Account]
GO
ALTER TABLE [dbo].[Translation]  WITH CHECK ADD  CONSTRAINT [FK_Translation_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([LanguageId])
GO
ALTER TABLE [dbo].[Translation] CHECK CONSTRAINT [FK_Translation_Language]
GO
ALTER TABLE [dbo].[Translation]  WITH CHECK ADD  CONSTRAINT [FK_Translation_Manga] FOREIGN KEY([MangaId])
REFERENCES [dbo].[Manga] ([MangaId])
GO
ALTER TABLE [dbo].[Translation] CHECK CONSTRAINT [FK_Translation_Manga]
GO
ALTER TABLE [dbo].[Translation_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Translation_Detail_Chapter] FOREIGN KEY([ChapterId])
REFERENCES [dbo].[Chapter] ([ChapterId])
GO
ALTER TABLE [dbo].[Translation_Detail] CHECK CONSTRAINT [FK_Translation_Detail_Chapter]
GO
ALTER TABLE [dbo].[Translation_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Translation_Detail_Manga] FOREIGN KEY([MangaId])
REFERENCES [dbo].[Manga] ([MangaId])
GO
ALTER TABLE [dbo].[Translation_Detail] CHECK CONSTRAINT [FK_Translation_Detail_Manga]
GO
ALTER TABLE [dbo].[Translation_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Translation_Detail_Translation] FOREIGN KEY([TranslationId])
REFERENCES [dbo].[Translation] ([TransationId])
GO
ALTER TABLE [dbo].[Translation_Detail] CHECK CONSTRAINT [FK_Translation_Detail_Translation]
GO
/****** Object:  StoredProcedure [dbo].[Account_CheckUserName]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAISHI>
-- Create date: <13/6/2018>
-- Description:	<add discount>
-- EXEC AddDiscountDetail 1,10,1
-- =============================================
CREATE PROCEDURE [dbo].[Account_CheckUserName]
(
	@Username nvarchar(50)
)
AS
BEGIN
	declare @count int;
	declare @res bit;
	SELECT @count=count(*)
	FROM Account
	WHERE UPPER(Username)= UPPER(@Username) and StatusActive = 0
	IF (@count=0)
			SET @res=0
	ELSE
		SET @res=1
	SELECT @res
END











GO
/****** Object:  StoredProcedure [dbo].[Account_GetAccountIdbyUserName]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
create PROCEDURE [dbo].[Account_GetAccountIdbyUserName] 
(
			@UserName int
)
AS
BEGIN
	select AccountId from[dbo].[Account]
	WHERE Account.UserName = @UserName
END
GO
/****** Object:  StoredProcedure [dbo].[Account_GetAccountInfobyId]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
Create PROCEDURE [dbo].[Account_GetAccountInfobyId] 
(
			@AccountId int
)
AS
BEGIN
	select* from[dbo].[Account]
	WHERE Account.AccountId = @AccountId
END
GO
/****** Object:  StoredProcedure [dbo].[Account_Login]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAISHI>
-- Create date: <13/6/2018>
-- Description:	<add discount>
-- EXEC AddDiscountDetail 1,10,1
-- =============================================
CREATE PROCEDURE [dbo].[Account_Login]
(
	@Username nvarchar(50),
	@Password nvarchar(50)
)
AS
BEGIN
	SELECT *
	FROM Account as a
	WHERE UPPER(a.Username)= UPPER(@Username) and a.Password=@Password and a.StatusActive = 0
END











GO
/****** Object:  StoredProcedure [dbo].[Account_Register]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAISHI>
-- Create date: <13/6/2018>
-- Description:	<add discount>
-- EXEC AddDiscountDetail 1,10,1
-- =============================================
CREATE PROCEDURE [dbo].[Account_Register]
(
	@Username nvarchar(50),
	@Password nvarchar(50),
	@Email nvarchar(50),
	@PhoneNumber nvarchar(50),
	@StatusActive int
)
AS
BEGIN
INSERT INTO [dbo].[Account]
           ([UserName]
           ,[PassWord]
           ,[Email]
		   ,[PhoneNumber]
           ,[StatusActive])
     VALUES
           (@Username
           ,@Password
           ,@Email
		   ,@PhoneNumber
           ,@StatusActive)
END











GO
/****** Object:  StoredProcedure [dbo].[Account_Search]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
CREATE PROCEDURE [dbo].[Account_Search] 
(
			@UserName nvarchar(50)
)
AS
BEGIN
	select* from[dbo].[Account]
	WHERE Account.UserName like N'%'+@UserName+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountImg]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
Create PROCEDURE [dbo].[Account_UpdateAccountImg] 
(
			@Id int,
			@Linkavatar varchar(200)
)
AS
BEGIN
	UPDATE [dbo].[Account]
	SET
			[AvatarLink] = @Linkavatar
	WHERE Account.AccountId = @Id 
END
GO
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountInfo]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
CREATE PROCEDURE [dbo].[Account_UpdateAccountInfo] 
(
			@Id int,
			@Fullname nvarchar(100),
			@PhoneNumber varchar(20),
			@Email varchar(100),
			@FacebookLink nvarchar(50),
			@TwitterLink nvarchar(50),
			@InstagramLink nvarchar(50),
			@Note nvarchar(max)
)
AS
BEGIN
	UPDATE [dbo].[Account]
	SET
			[Fullname] = @Fullname,
			[PhoneNumber] = @PhoneNumber,
			[Email] = @Email,
			[FacebookLink] = @FacebookLink,
			[TwitterLink] = @TwitterLink,
			[InstagramLink] = @InstagramLink,
			[Note] = @Note
	WHERE Account.AccountId = @Id 
END
GO
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountNote]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
Create PROCEDURE [dbo].[Account_UpdateAccountNote] 
(
			@Id int,
			@Note varchar(200)
)
AS
BEGIN
	UPDATE [dbo].[Account]
	SET
			[Note] = @Note
	WHERE Account.AccountId = @Id 
END
GO
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountPassWord]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
create PROCEDURE [dbo].[Account_UpdateAccountPassWord] 
(
			@Id int,
			@PassWord varchar(200)
)
AS
BEGIN
	UPDATE [dbo].[Account]
	SET
			[PassWord] = @PassWord
	WHERE Account.AccountId = @Id 
END
GO
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountStatus]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
CREATE PROCEDURE [dbo].[Account_UpdateAccountStatus] 
(
			@Id int,
			@Status varchar(200)
)
AS
BEGIN
	UPDATE [dbo].[Account]
	SET
			[Status] = @Status
	WHERE Account.AccountId = @Id 
END
GO
/****** Object:  StoredProcedure [dbo].[Chapter_AddNewChapter]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAISHI>
-- Create date: <13/6/2018>
-- Description:	<add discount>
-- EXEC AddDiscountDetail 1,10,1
-- =============================================
Create PROCEDURE [dbo].[Chapter_AddNewChapter]
(
	@Fullname nvarchar(50),
	@OrderNumber int,
	@MangaId int,
	@CreateAt datetime,
	@ViewNumber int,
	@StatusActive int
)
AS
BEGIN
INSERT INTO [dbo].[Chapter]
           ([FullName]
		   ,[OrderNumber]
           ,[MangaId]
           ,[CreateAt]
           ,[ViewNumber]
		   ,[StatusActive])
     VALUES
           (@Fullname
		   ,@OrderNumber
           ,@MangaId
           ,@CreateAt
           ,@ViewNumber
		   ,@StatusActive
		   )
SELECT @@IDENTITY AS 'Identity';  
END











GO
/****** Object:  StoredProcedure [dbo].[Language_GetList]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
Create PROCEDURE [dbo].[Language_GetList] 

AS
BEGIN
	select* from[dbo].[Language] 
END
GO
/****** Object:  StoredProcedure [dbo].[Manga_AddnewManga]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAISHI>
-- Create date: <13/6/2018>
-- Description:	<add discount>
-- EXEC AddDiscountDetail 1,10,1
-- =============================================
CREATE PROCEDURE [dbo].[Manga_AddnewManga]
(
	@Fullname nvarchar(50),
	@CoverLink nvarchar(50),
	@Alias nvarchar(50),
	@Author nvarchar(50),
	@CreateAt datetime,
	@Description nvarchar(max),
	@StatusId int,
	@StatusActive int
)
AS
BEGIN
INSERT INTO [dbo].[Manga]
           ([FullName]
		   ,[CoverLink]
           ,[Alias]
           ,[Author]
           ,[CreateAt]
		   ,[Description]
		   ,[StatusId]
		   ,[StatusActive])
     VALUES
           (@Fullname
		   ,@CoverLink
           ,@Alias
           ,@Author
           ,@CreateAt
		   ,@Description
		   ,@StatusId
		   ,@StatusActive)
SELECT @@IDENTITY AS 'Identity';  
END











GO
/****** Object:  StoredProcedure [dbo].[Manga_ChangeStatusManga]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAISHI>
-- Create date: <13/6/2018>
-- Description:	<add discount>
-- EXEC AddDiscountDetail 1,10,1
-- =============================================
Create PROCEDURE [dbo].[Manga_ChangeStatusManga]
(
@Id int,
	@StatusActive int
)
AS
BEGIN
Update  [dbo].[Manga]
set[StatusActive] = @StatusActive
    where Manga.MangaId = @Id
END











GO
/****** Object:  StoredProcedure [dbo].[Manga_CheckNameManga]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAISHI>
-- Create date: <13/6/2018>
-- Description:	<add discount>
-- EXEC AddDiscountDetail 1,10,1
-- =============================================
Create PROCEDURE [dbo].[Manga_CheckNameManga]
(
	@Fullname nvarchar(50)
)
AS
BEGIN
	declare @count int;
	declare @res bit;
	SELECT @count=count(*)
	FROM Manga
	WHERE FullName= @Fullname and StatusActive = 0
	IF (@count=0)
			SET @res=0
	ELSE
		SET @res=1
	SELECT @res
END










GO
/****** Object:  StoredProcedure [dbo].[Manga_GetListJoined]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
CREATE PROCEDURE [dbo].[Manga_GetListJoined] 
(
			@AccountId int
)
AS
BEGIN
	SELECT DISTINCT Manga.FullName as MangaName,Manga.CoverLink ,
    SUBSTRING(
        (
            SELECT ','+Role.FullName  
            FROM dbo.Manga_Detail C1 join Role on C1.RoleId = Role.RoleId
            WHERE C1.MangaId = C2.MangaId
            FOR XML PATH ('')
        ), 2, 1000) RoleList
FROM dbo.Manga_Detail C2 
join Manga on C2.MangaId = Manga.MangaId 
join Account on C2.AccountId = Account.AccountId 
where C2.AccountId = @AccountId
END
GO
/****** Object:  StoredProcedure [dbo].[Manga_GetListManga]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAISHI>
-- Create date: <13/6/2018>
-- Description:	<add discount>
-- EXEC Manga_GetListManga 1
-- =============================================
CREATE PROCEDURE [dbo].[Manga_GetListManga]
(
	@AccountId int,
	@RoleId nvarchar(50)
)
AS
BEGIN
	select Manga.MangaId,CoverLink,Manga.FullName,Author,Status.FullName as status,CreateAt 
	from Manga_Detail
	Join Role on Manga_Detail.RoleId = Role.RoleId
	join Manga on Manga_Detail.MangaId = Manga.MangaId
	join dbo.Status on Manga.StatusId = Status.StatusId 
	where AccountId = @AccountId and Role.Id = @RoleId
END










GO
/****** Object:  StoredProcedure [dbo].[Manga_GetMangaInfo]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAISHI>
-- Create date: <13/6/2018>
-- Description:	<add discount>
-- EXEC Manga_GetListManga 1
-- =============================================
Create PROCEDURE [dbo].[Manga_GetMangaInfo]
(
	@MangaId int
)
AS
BEGIN
	select *
	from Manga
	
	where MangaId = @MangaId
END










GO
/****** Object:  StoredProcedure [dbo].[Manga_GetMangaInfoById]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
Create PROCEDURE [dbo].[Manga_GetMangaInfoById] 
(
			@MangaId int
)
AS
BEGIN
		select * from Manga
		WHERE  MangaId = @MangaId and StatusId = 0
END
GO
/****** Object:  StoredProcedure [dbo].[Manga_Search]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
CREATE PROCEDURE [dbo].[Manga_Search] 
(
			@Fullname nvarchar(max)
)
AS
BEGIN
	SELECT Manga_Genres.MangaId as MangaId,FullName,Alias,CoverLink,Description,Author,CreateAt,Manga.StatusActive, 
    Genre = STUFF(
                 (SELECT ',' + Genre.FullName FROM Manga,Manga_Genres,Genre where Manga.MangaId = Manga_Genres.MangaId and Genre.GenreId = Manga_Genres.GenreId  FOR XML PATH ('')), 1, 1, ''
               ) 
FROM  Manga_Genres JOIN Manga  ON Manga.MangaId = Manga_Genres.MangaId where Manga.FullName like N'%'+@Fullname+'%'
GROUP BY Manga_Genres.MangaId, FullName,Alias,CoverLink,Description,Author,CreateAt,Manga.StatusActive
END
GO
/****** Object:  StoredProcedure [dbo].[Manga_UpdateInfoManga]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAISHI>
-- Create date: <13/6/2018>
-- Description:	<add discount>
-- EXEC AddDiscountDetail 1,10,1
-- =============================================
CREATE PROCEDURE [dbo].[Manga_UpdateInfoManga]
(
	@Id int,
	@Fullname nvarchar(50),
	@CoverLink nvarchar(50),
	@Alias nvarchar(50),
	@Author nvarchar(50),
	@CreateAt datetime,
	@Description nvarchar(max),
	@StatusId int,
	@StatusActive int
)
AS
BEGIN
Update  [dbo].[Manga]
set
           [FullName] = @Fullname
		   ,[CoverLink] = @CoverLink
           ,[Alias] = @Alias
           ,[Author] = @Author
           ,[CreateAt] = @CreateAt
		   ,[Description] = @Description
		   ,[StatusId] = @StatusId
		   ,[StatusActive] = @StatusActive
    where Manga.MangaId = @Id
END











GO
/****** Object:  StoredProcedure [dbo].[MangaDetail_AddNewRole]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
CREATE PROCEDURE [dbo].[MangaDetail_AddNewRole] 
(
	@MangaId int,
	@AccountId int,
	@RoleId int,
	@StatusActive int,
	@Type int,
	@Language nvarchar(50)
)
AS
BEGIN
	INSERT INTO [dbo].[Manga_Detail]
           ([MangaId]
           ,[AccountId]
           ,[RoleId]
           ,[StatusActive]
		   ,[Type]
		   ,[Language])
     VALUES
           (@MangaId
           ,@AccountId
           ,@RoleId
           ,@StatusActive
		   ,@Type
		   ,@Language)
END
GO
/****** Object:  StoredProcedure [dbo].[MangaDetail_ChangeStatus]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
CREATE PROCEDURE [dbo].[MangaDetail_ChangeStatus] 
(
			@MangaId int,
			@RoleId int,
			@AccountId int,
			@StatusActive int,
			@Language nvarchar(50)
)
AS
BEGIN
if(@Language = null)
		UPDATE [dbo].[Manga_Detail]
		SET [StatusActive] = @StatusActive
		WHERE AccountId = @AccountId and MangaId = @MangaId and RoleId = @RoleId
else
	UPDATE [dbo].[Manga_Detail]
	SET [StatusActive] = @StatusActive
	WHERE MangaId = @MangaId and RoleId = @RoleId and AccountId = @AccountId and Language = @Language 
END
GO
/****** Object:  StoredProcedure [dbo].[MangaDetail_CheckJoin]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
Create PROCEDURE [dbo].[MangaDetail_CheckJoin] 
(
	@MangaId int,
	@AccountId int,
	@RoleId int
)
AS
BEGIN
	declare @count int;
	declare @res bit;
	SELECT @count=count(*)
	FROM Manga_Detail
	WHERE MangaId= @MangaId and  AccountId= @AccountId and  RoleId= @RoleId 
	IF (@count=0)
			SET @res=0
	ELSE
		SET @res=1
	SELECT @res
END
GO
/****** Object:  StoredProcedure [dbo].[MangaDetail_CheckOldPassWord]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
Create PROCEDURE [dbo].[MangaDetail_CheckOldPassWord] 
(
	@PassWord nvarchar(max),
	@AccountId int
)
AS
BEGIN
	declare @count int;
	declare @res bit;
	SELECT @count=count(*)
	FROM Account
	WHERE AccountId= @AccountId and  PassWord = @PassWord 
	IF (@count=0)
			SET @res=0
	ELSE
		SET @res=1
	SELECT @res
END
GO
/****** Object:  StoredProcedure [dbo].[MangaDetail_GetAccountCreateManga]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
Create PROCEDURE [dbo].[MangaDetail_GetAccountCreateManga] 
(
			@MangaId int
)
AS
BEGIN
	select AccountId from[dbo].[Manga_Detail]
	WHERE Manga_Detail.MangaId = @MangaId and Manga_Detail.RoleId = 1
END
GO
/****** Object:  StoredProcedure [dbo].[MangaDetail_GetInfo]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
Create PROCEDURE [dbo].[MangaDetail_GetInfo] 
(
			@MangaId int,
			@RoleId int,
			@AccountId int,
			@StatusActive int,
			@Language nvarchar(50)
)
AS
BEGIN
if(@Language = null)
		select * from Manga_Detail
		WHERE AccountId = @AccountId and MangaId = @MangaId and RoleId = @RoleId
else
	select * from Manga_Detail
	WHERE MangaId = @MangaId and RoleId = @RoleId and AccountId = @AccountId and Language = @Language 
END
GO
/****** Object:  StoredProcedure [dbo].[MangaGenre_Addnew]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAISHI>
-- Create date: <13/6/2018>
-- Description:	<add discount>
-- EXEC AddDiscountDetail 1,10,1
-- =============================================
CREATE PROCEDURE [dbo].[MangaGenre_Addnew]
(
	@GenreId int,
	@MangaId int,
	@StatusActive int
)
AS
BEGIN
INSERT INTO [dbo].[Manga_Genres]
           ([MangaId]
           ,[GenreId]
           ,[StatusActive])
     VALUES
           (@MangaId
           ,@GenreId
           ,@StatusActive)
END











GO
/****** Object:  StoredProcedure [dbo].[MangaGenre_GetListGenreId]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAISHI>
-- Create date: <13/6/2018>
-- Description:	<add discount>
-- EXEC Manga_GetListManga 1
-- =============================================
CREATE PROCEDURE [dbo].[MangaGenre_GetListGenreId]
(
	@MangaId int
)
AS
BEGIN
	select GenreId
	from Manga_Genres
	
	where MangaId = @MangaId
END










GO
/****** Object:  StoredProcedure [dbo].[MangaGenre_UpdateStatus]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAISHI>
-- Create date: <13/6/2018>
-- Description:	<add discount>
-- EXEC AddDiscountDetail 1,10,1
-- =============================================
Create PROCEDURE [dbo].[MangaGenre_UpdateStatus]
(
	
	@MangaId int,
	@GenreId int,
	@StatusActive int
)
AS
BEGIN
Update  [dbo].[Manga_Genres]
set
           [StatusActive] = @StatusActive
    where Manga_Genres.MangaId = @MangaId and GenreId = @GenreId
END











GO
/****** Object:  StoredProcedure [dbo].[Role_GetRoldIdbyId]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
Create PROCEDURE [dbo].[Role_GetRoldIdbyId] 
(
			@Role int
)
AS
BEGIN
	select RoleId from[dbo].[Role]
	WHERE Role.Id = @Role
END
GO
/****** Object:  StoredProcedure [dbo].[Role_GetRoleInfoById]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
Create PROCEDURE [dbo].[Role_GetRoleInfoById] 
(
			@RoleId int
)
AS
BEGIN
		select * from Role
		WHERE  RoleId = @RoleId and StatusActive = 0
END
GO
/****** Object:  StoredProcedure [dbo].[Translation_AddnewTranslation]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAISHI>
-- Create date: <13/6/2018>
-- Description:	<add discount>
-- EXEC AddDiscountDetail 1,10,1
-- =============================================
Create PROCEDURE [dbo].[Translation_AddnewTranslation]
(
	@MangaId int,
	@AccountId int,
	@Language nvarchar(50),
	@StatusActive int
)
AS
BEGIN
declare @LanguageId int;
select @LanguageId = LanguageId from Language where Id = @Language
INSERT INTO [dbo].[Translation]
           ([MangaId]
           ,[AccountId]
           ,[LanguageId]
		   ,[StatusActive])
     VALUES
           (@MangaId
           ,@AccountId
           ,@LanguageId
		   ,@StatusActive)
END











GO
/****** Object:  StoredProcedure [dbo].[Translation_CheckExist]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Translation_CheckExist 'vn',2
-- =============================================
CREATE PROCEDURE [dbo].[Translation_CheckExist] 
(
	@Language nvarchar(max),
	@MangaId int
)
AS
BEGIN
	declare @id int;
	set @id = 0
	declare @count int;
	declare @res int;
	SELECT @id= TransationId
	FROM Translation join Language on Translation.LanguageId = Language.LanguageId 
	WHERE MangaId= @MangaId and  Language.Id = @Language
	if(@id=0)
	
			SET @res=0
			
	ELSE
	SET @res= @id
	select @res
END
GO
/****** Object:  StoredProcedure [dbo].[Translation_UpdateInfo]    Script Date: 12/13/2019 4:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
Create PROCEDURE [dbo].[Translation_UpdateInfo] 
(
			@TranslationId int,
			@AccountId int,
			@StatusActive int
)
AS
BEGIN
	UPDATE [dbo].[Translation]
	SET
			[AccountId] = @AccountId,
			[StatusActive] = @StatusActive
	WHERE TransationId = @TranslationId
END
GO
