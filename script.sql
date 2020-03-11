USE [master]
GO
/****** Object:  Database [MyWebsite]    Script Date: 3/11/2020 8:04:25 AM ******/
CREATE DATABASE [MyWebsite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyWebsite', FILENAME = N'D:\Me\MyWebsite.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MyWebsite_log', FILENAME = N'D:\Me\MyWebsite_log.ldf' , SIZE = 7744KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MyWebsite] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyWebsite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyWebsite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyWebsite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyWebsite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyWebsite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyWebsite] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyWebsite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyWebsite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyWebsite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyWebsite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyWebsite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyWebsite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyWebsite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyWebsite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyWebsite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyWebsite] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyWebsite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyWebsite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyWebsite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyWebsite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyWebsite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyWebsite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyWebsite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyWebsite] SET RECOVERY FULL 
GO
ALTER DATABASE [MyWebsite] SET  MULTI_USER 
GO
ALTER DATABASE [MyWebsite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyWebsite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyWebsite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyWebsite] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyWebsite] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyWebsite', N'ON'
GO
ALTER DATABASE [MyWebsite] SET QUERY_STORE = OFF
GO
USE [MyWebsite]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [MyWebsite]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/11/2020 8:04:25 AM ******/
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
	[Active] [bit] NOT NULL,
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
/****** Object:  Table [dbo].[Account_Detail]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Detail](
	[AccountId] [int] NOT NULL,
	[PointId] [int] NOT NULL,
	[Total] [float] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Account_Detail] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC,
	[PointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookmark]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookmark](
	[AccountId] [int] NOT NULL,
	[MangaId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chapter](
	[ChapterId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[ViewNumber] [int] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
	[MangaId] [int] NOT NULL,
	[Alias] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Chapter] PRIMARY KEY CLUSTERED 
(
	[ChapterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Font]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Font](
	[FontId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[FontLink] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Font] PRIMARY KEY CLUSTERED 
(
	[FontId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Id] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Alias] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[LanguageId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Note] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manga]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manga](
	[MangaId] [int] IDENTITY(1,1) NOT NULL,
	[CoverLink] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[Author] [nvarchar](50) NULL,
	[Active] [bit] NOT NULL,
	[Alias] [nvarchar](max) NOT NULL,
	[StatusId] [int] NOT NULL,
	[UpdateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Manga] PRIMARY KEY CLUSTERED 
(
	[MangaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manga_Detail]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manga_Detail](
	[AccountId] [int] NOT NULL,
	[MangaId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[Type] [int] NOT NULL,
	[Language] [int] NULL,
	[CreateAt] [datetime] NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Manga_Detail] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC,
	[MangaId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manga_Genres]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manga_Genres](
	[MangaId] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Manga_Genres] PRIMARY KEY CLUSTERED 
(
	[MangaId] ASC,
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationId] [int] IDENTITY(1,1) NOT NULL,
	[NContent] [nvarchar](max) NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[AccountId] [int] NOT NULL,
	[NotifyTypeId] [int] NOT NULL,
	[SeenStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotifyType]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotifyType](
	[NotifyTypeId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Active] [bit] NOT NULL,
	[NTContent] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_NotifyType] PRIMARY KEY CLUSTERED 
(
	[NotifyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Page]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[PageId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](2000) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[PageLink] [nvarchar](2000) NOT NULL,
	[Active] [bit] NOT NULL,
	[ChapterId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[AccountId] [int] NOT NULL,
	[PageId_Fa] [int] NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED 
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Point]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Point](
	[PointId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[PointNumber] [float] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Point] PRIMARY KEY CLUSTERED 
(
	[PointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[Code] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Text]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Text](
	[TextId] [int] IDENTITY(1,1) NOT NULL,
	[TextContent] [nvarchar](max) NOT NULL,
	[ColorText] [nchar](10) NOT NULL,
	[ColorOutline] [nchar](10) NOT NULL,
	[Bold] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[Allow] [bit] NOT NULL,
	[TranslationId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[TextBoxId] [int] NOT NULL,
	[FontId] [int] NOT NULL,
	[FontSize] [int] NOT NULL,
	[Italic] [bit] NOT NULL,
 CONSTRAINT [PK_Text] PRIMARY KEY CLUSTERED 
(
	[TextId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TextBox]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextBox](
	[TextBoxId] [int] IDENTITY(1,1) NOT NULL,
	[Coordinate] [nvarchar](50) NOT NULL,
	[Witdh] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[PageId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[Degree] [int] NOT NULL,
 CONSTRAINT [PK_TextBox] PRIMARY KEY CLUSTERED 
(
	[TextBoxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Translation]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translation](
	[TransationId] [int] IDENTITY(1,1) NOT NULL,
	[MangaId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Translation] PRIMARY KEY CLUSTERED 
(
	[TransationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Translation_Detail]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translation_Detail](
	[ChapterId] [int] NOT NULL,
	[TranslationId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[UpdateAt] [datetime] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Translation_Detail] PRIMARY KEY CLUSTERED 
(
	[ChapterId] ASC,
	[TranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountId], [FullName], [Email], [PhoneNumber], [AvatarLink], [Active], [UserName], [PassWord], [ResetPasswordCode], [FacebookLink], [TwitterLink], [InstagramLink], [Status], [Note]) VALUES (1, N'Hikigaya Hachiman', N'kaishi.ga@gmail.com', N'0918325891', N'bfc5fa0d0f4055b678d6fbc56fcba8b8.jpg', 1, N'kaishi1', N'326C5F2A7FAC69A83432AA175DBBA2B2', NULL, N'facebook.com/Hachiman', N'TwitterLink.com/Hachiman', N'InstagramLink.com/Hachiman', NULL, N'I''m Hachiman')
INSERT [dbo].[Account] ([AccountId], [FullName], [Email], [PhoneNumber], [AvatarLink], [Active], [UserName], [PassWord], [ResetPasswordCode], [FacebookLink], [TwitterLink], [InstagramLink], [Status], [Note]) VALUES (2, N'Yukino', N'kaishi.ga2@gmail.com', N'0918325891', N'Yukino_S206.png', 1, N'kaishi2', N'326C5F2A7FAC69A83432AA175DBBA2B2', NULL, N'facebook.com/Yukino', N'Twitter.com/Yukino', N'Instagram.com/Yukino', NULL, N'I''m Yukino')
INSERT [dbo].[Account] ([AccountId], [FullName], [Email], [PhoneNumber], [AvatarLink], [Active], [UserName], [PassWord], [ResetPasswordCode], [FacebookLink], [TwitterLink], [InstagramLink], [Status], [Note]) VALUES (3, N'Saki', N'kaishi.ga3@gmail.com', N'0918325891', N'Saki_Zoku.png', 1, N'kaishi3', N'326C5F2A7FAC69A83432AA175DBBA2B2', NULL, N'facebook.com/Saki', N'Twitter.com/Saki', N'Instagram.com/Saki', NULL, N'I''m Saki')
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [FullName], [Active]) VALUES (1, N'Trang Raw', 1)
INSERT [dbo].[Category] ([CategoryId], [FullName], [Active]) VALUES (2, N'Trang Clear-text', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Chapter] ON 

INSERT [dbo].[Chapter] ([ChapterId], [FullName], [OrderNumber], [ViewNumber], [CreateAt], [Active], [MangaId], [Alias]) VALUES (7, N'DEMON OF RESPECT AND AFFECTION', 67, 0, CAST(N'2020-03-01T15:59:51.227' AS DateTime), 1, 10, N'DEMON-OF-RESPECT-AND-AFFECTION')
SET IDENTITY_INSERT [dbo].[Chapter] OFF
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [Active]) VALUES (1, N'Hành Động', N'Action', N'Đánh đấm các thứ', N'Action', 1)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [Active]) VALUES (2, N'Harem', N'Harem', N'Yêu đương các thứ', N'Harem', 1)
SET IDENTITY_INSERT [dbo].[Genre] OFF
SET IDENTITY_INSERT [dbo].[Manga] ON 

INSERT [dbo].[Manga] ([MangaId], [CoverLink], [FullName], [Description], [CreateAt], [Author], [Active], [Alias], [StatusId], [UpdateAt]) VALUES (10, N'1767-tensei_shitara_slime_datta_ken.jpg', N'Tensei Shitara Slime Datta Ken', N'A man is stabbed by a robber on the run after pushing his coworker and his coworker''s new fiance out of the way. As he lays dying, bleeding on the ground, he hears a voice. This voice is strange and interprets his dying regret of being a virgin by gives him the [Great Sage] unique skill! Is he being made fun of !?!', CAST(N'2020-02-29T20:51:10.790' AS DateTime), N'Fuse - Kawakami Taiki', 1, N'tensei-shitara-slime-datta-ken', 1, CAST(N'2020-02-29T20:27:58.953' AS DateTime))
SET IDENTITY_INSERT [dbo].[Manga] OFF
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [Active], [Type], [Language], [CreateAt], [Status]) VALUES (1, 10, 1, 1, 2, -1, CAST(N'2020-02-29T20:28:03.090' AS DateTime), 2)
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [Active], [Type], [Language], [CreateAt], [Status]) VALUES (2, 10, 3, 1, 0, 0, CAST(N'2020-03-01T02:53:13.580' AS DateTime), 2)
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [Active], [Type], [Language], [CreateAt], [Status]) VALUES (3, 10, 2, 1, 0, -1, CAST(N'2020-03-01T09:10:12.213' AS DateTime), 2)
INSERT [dbo].[Manga_Genres] ([MangaId], [GenreId], [Active]) VALUES (10, 1, 1)
INSERT [dbo].[Manga_Genres] ([MangaId], [GenreId], [Active]) VALUES (10, 2, 1)
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1, N'<strong>kaishi3 </strong>đã gửi yêu cầu tham gia truyện: Tensei Shitara Slime Datta Ken của bạn vị trí Tải lên bản clear-text.', CAST(N'2020-03-01T09:10:14.363' AS DateTime), 1, 1, 1, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (2, N'<strong>Lời mời tham gia </strong>truyện: Tensei Shitara Slime Datta Ken, vị trí RoleFullName tới kaishi3 đã được duyệt.', CAST(N'2020-03-01T09:55:06.817' AS DateTime), 1, 1, 4, 0)
SET IDENTITY_INSERT [dbo].[Notification] OFF
SET IDENTITY_INSERT [dbo].[NotifyType] ON 

INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [Active], [NTContent]) VALUES (1, N'Request', 1, N'<strong>UserName </strong>đã gửi yêu cầu tham gia truyện: MangaName của bạn vị trí RoleName.')
INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [Active], [NTContent]) VALUES (2, N'Invite', 1, N'<strong>UserName </strong>đã mời bạn tham gia truyện: MangaName vị trí RoleName.')
INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [Active], [NTContent]) VALUES (3, N'RequestRespone', 1, N'<strong>Yêu cầu tham gia </strong>truyện: MangaName, vị trí RoleName của bạn đã được duyệt.')
INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [Active], [NTContent]) VALUES (4, N'InviteReply', 1, N'<strong>Lời mời tham gia </strong>truyện: MangaName, vị trí RoleFullName tới UserName đã được duyệt.')
INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [Active], [NTContent]) VALUES (5, N'Trans', 1, N'<strong>Thoại dịch </strong>trang PageOrder chương ChapterOrder truyện: MangaName ngôn ngữ Language của bạn đã được duyệt.')
INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [Active], [NTContent]) VALUES (6, N'Upload', 1, N'<strong>Trang ChapterOrder clear-text </strong>chương ChapterOrder truyện: MangaName của bạn đã được duyệt.')
INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [Active], [NTContent]) VALUES (7, N'AddNew', 1, N'<strong>Truyện: MangaName </strong>đã thêm chương truyện ChapterOrder: ChapterName.')
SET IDENTITY_INSERT [dbo].[NotifyType] OFF
SET IDENTITY_INSERT [dbo].[Page] ON 

INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (14, N'trang 1-DEMON OF RESPECT AND AFFECTION', 1, N'trang 1-DEMON OF RESPECT AND AFFECTION.png', 1, 7, 1, CAST(N'2020-03-01T15:59:54.143' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (15, N'trang 2-DEMON OF RESPECT AND AFFECTION', 2, N'trang 2-DEMON OF RESPECT AND AFFECTION.png', 1, 7, 1, CAST(N'2020-03-01T15:59:57.937' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (16, N'trang 3-DEMON OF RESPECT AND AFFECTION', 3, N'trang 3-DEMON OF RESPECT AND AFFECTION.png', 1, 7, 1, CAST(N'2020-03-01T16:00:01.873' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (17, N'trang 1-DEMON OF RESPECT AND AFFECTION-Clear-text-', 1, N'1.jpg', 1, 7, 2, CAST(N'2020-03-01T16:01:53.683' AS DateTime), 3, 14, 2)
SET IDENTITY_INSERT [dbo].[Page] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [FullName], [Active], [Code]) VALUES (1, N'Quản lý truyện-chương', 1, N'CM        ')
INSERT [dbo].[Role] ([RoleId], [FullName], [Active], [Code]) VALUES (2, N'Tải lên bản clear-text', 1, N'UC        ')
INSERT [dbo].[Role] ([RoleId], [FullName], [Active], [Code]) VALUES (3, N'Dịch truyện', 1, N'TR        ')
INSERT [dbo].[Role] ([RoleId], [FullName], [Active], [Code]) VALUES (4, N'Quản lý bảm dịch toàn truyện theo ngôn ngữ', 1, N'TM        ')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusId], [FullName], [Active]) VALUES (1, N'Chưa hoàn thành', 1)
INSERT [dbo].[Status] ([StatusId], [FullName], [Active]) VALUES (2, N'Đã hoàn thành', 1)
INSERT [dbo].[Status] ([StatusId], [FullName], [Active]) VALUES (3, N'Tạm ngưng', 1)
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[TextBox] ON 

INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (8, N'80,1171', 51, 65, 14, 1, 0)
SET IDENTITY_INSERT [dbo].[TextBox] OFF
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
ALTER TABLE [dbo].[Translation_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Translation_Detail_Translation] FOREIGN KEY([TranslationId])
REFERENCES [dbo].[Translation] ([TransationId])
GO
ALTER TABLE [dbo].[Translation_Detail] CHECK CONSTRAINT [FK_Translation_Detail_Translation]
GO
/****** Object:  StoredProcedure [dbo].[Account_CheckUserName]    Script Date: 3/11/2020 8:04:25 AM ******/
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
	WHERE UPPER(Username)= UPPER(@Username) and Active = 1
	IF (@count=0)
			SET @res=0
	ELSE
		SET @res=1
	SELECT @res
END











GO
/****** Object:  StoredProcedure [dbo].[Account_GetAccountIdbyUserName]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
CREATE PROCEDURE [dbo].[Account_GetAccountIdbyUserName] 
(
			@UserName nvarchar(50)
)
AS
BEGIN
	select AccountId from[dbo].[Account]
	WHERE Account.UserName = @UserName
END
GO
/****** Object:  StoredProcedure [dbo].[Account_GetAccountInfobyId]    Script Date: 3/11/2020 8:04:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Account_GetProfileByUserName]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
CREATE PROCEDURE [dbo].[Account_GetProfileByUserName] 
(
			@UserName nvarchar(50)
)
AS
BEGIN
	select * from[dbo].[Account]
	WHERE Account.UserName = @UserName
END
GO
/****** Object:  StoredProcedure [dbo].[Account_Login]    Script Date: 3/11/2020 8:04:25 AM ******/
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
	WHERE UPPER(a.Username)= UPPER(@Username) and a.Password=@Password and a.Active = 1
END











GO
/****** Object:  StoredProcedure [dbo].[Account_Register]    Script Date: 3/11/2020 8:04:25 AM ******/
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
	@StatusActive bit
)
AS
BEGIN
INSERT INTO [dbo].[Account]
           ([UserName]
           ,[PassWord]
           ,[Email]
		   ,[PhoneNumber]
           ,[Active])
     VALUES
           (@Username
           ,@Password
           ,@Email
		   ,@PhoneNumber
           ,@StatusActive)
END











GO
/****** Object:  StoredProcedure [dbo].[Account_Search]    Script Date: 3/11/2020 8:04:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountImg]    Script Date: 3/11/2020 8:04:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountInfo]    Script Date: 3/11/2020 8:04:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountNote]    Script Date: 3/11/2020 8:04:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountPassWord]    Script Date: 3/11/2020 8:04:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountStatus]    Script Date: 3/11/2020 8:04:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Chapter_AddNewChapter]    Script Date: 3/11/2020 8:04:25 AM ******/
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
CREATE PROCEDURE [dbo].[Chapter_AddNewChapter]
(
	@Fullname nvarchar(50),
	@OrderNumber int,
	@MangaId int,
	@CreateAt datetime,
	@ViewNumber int,
	@StatusActive  bit,
	@Alias nvarchar(256)
)
AS
BEGIN
INSERT INTO [dbo].[Chapter]
           ([FullName]
		   ,[OrderNumber]
           ,[MangaId]
           ,[CreateAt]
           ,[ViewNumber]
		   ,[Active]
		    ,[Alias])
		  
     VALUES
           (@Fullname
		   ,@OrderNumber
           ,@MangaId
           ,@CreateAt
           ,@ViewNumber
		   ,@StatusActive
		   ,@Alias
		   )
SELECT @@IDENTITY AS 'Identity';  
END











GO
/****** Object:  StoredProcedure [dbo].[Chapter_GetFirstChapter]    Script Date: 3/11/2020 8:04:25 AM ******/
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
Create PROCEDURE [dbo].[Chapter_GetFirstChapter]
(
	@MangaId int
)
AS
BEGIN
	select top(1) ChapterId from Chapter where MangaId = @MangaId
END










GO
/****** Object:  StoredProcedure [dbo].[Language_GetList]    Script Date: 3/11/2020 8:04:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Manga_AddnewManga]    Script Date: 3/11/2020 8:04:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Manga_ChangeStatusManga]    Script Date: 3/11/2020 8:04:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Manga_CheckNameManga]    Script Date: 3/11/2020 8:04:25 AM ******/
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
CREATE PROCEDURE [dbo].[Manga_CheckNameManga]
(
	@Fullname nvarchar(50)
)
AS
BEGIN
	declare @count int;
	declare @res bit;
	SELECT @count=count(*)
	FROM Manga
	WHERE FullName= @Fullname and Active = 1
	IF (@count=0)
			SET @res=0
	ELSE
		SET @res=1
	SELECT @res
END










GO
/****** Object:  StoredProcedure [dbo].[Manga_GetListJoined]    Script Date: 3/11/2020 8:04:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Manga_GetListManga]    Script Date: 3/11/2020 8:04:25 AM ******/
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
	@RoleId int
)
AS
BEGIN
	select Manga.MangaId,CoverLink,Manga.FullName,Author,Status.FullName as status,Manga.Description,Manga.CreateAt 
	from Manga_Detail
	Join Role on Manga_Detail.RoleId = Role.RoleId
	join Manga on Manga_Detail.MangaId = Manga.MangaId
	join dbo.Status on Manga.StatusId = Status.StatusId 
	where AccountId = @AccountId and Role.RoleId = @RoleId and Manga_Detail.Status = 2
END










GO
/****** Object:  StoredProcedure [dbo].[Manga_GetListNewManga]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KAISHI>
-- Create date: <13/6/2018>
-- Description:	<add discount>
-- EXEC Manga_GetListNewManga 1
-- =============================================
CREATE PROCEDURE [dbo].[Manga_GetListNewManga]

AS
BEGIN
SELECT  C2.FullName,C2.MangaId,C2.CoverLink,C2.Author,C2.Description,Account.AccountId,C2.CreateAt ,
    SUBSTRING(
        (
            SELECT ', '+Genre.FullName  
            FROM dbo.Manga C1 join Manga_Genres on C1.MangaId = Manga_Genres.MangaId join Genre on Manga_Genres.GenreId = Genre.GenreId
            WHERE C1.MangaId = C2.MangaId
            FOR XML PATH ('')
        ), 2, 1000) GenreList
FROM dbo.Manga C2 join Manga_Detail on C2.MangaId = Manga_Detail.MangaId join Account on Manga_Detail.AccountId = Account.AccountId where Manga_Detail.RoleId = 1 order by C2.CreateAt DESC
END










GO
/****** Object:  StoredProcedure [dbo].[Manga_GetMangaInfo]    Script Date: 3/11/2020 8:04:25 AM ******/
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
CREATE PROCEDURE [dbo].[Manga_GetMangaInfo]
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
/****** Object:  StoredProcedure [dbo].[Manga_GetMangaInfoById]    Script Date: 3/11/2020 8:04:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Manga_Search]    Script Date: 3/11/2020 8:04:25 AM ******/
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
	SELECT Manga_Genres.MangaId as MangaId,FullName,Alias,CoverLink,Description,Author,CreateAt,Manga.Active, 
    Genre = STUFF(
                 (SELECT ',' + Genre.FullName FROM Manga,Manga_Genres,Genre where Manga.MangaId = Manga_Genres.MangaId and Genre.GenreId = Manga_Genres.GenreId  FOR XML PATH ('')), 1, 1, ''
               ) 
FROM  Manga_Genres JOIN Manga  ON Manga.MangaId = Manga_Genres.MangaId where Manga.FullName like N'%'+@Fullname+'%'
GROUP BY Manga_Genres.MangaId, FullName,Alias,CoverLink,Description,Author,CreateAt,Manga.Active
END
GO
/****** Object:  StoredProcedure [dbo].[Manga_UpdateInfoManga]    Script Date: 3/11/2020 8:04:25 AM ******/
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
	@StatusActive bit
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
		   ,[Active] = @StatusActive
    where Manga.MangaId = @Id
END











GO
/****** Object:  StoredProcedure [dbo].[MangaDetail_AddNewRole]    Script Date: 3/11/2020 8:04:25 AM ******/
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
	@StatusActive bit,
	@Type int,
	@Language int,
	@Status int
)
AS
BEGIN
	INSERT INTO [dbo].[Manga_Detail]
           ([MangaId]
           ,[AccountId]
           ,[RoleId]
           ,[Active]
		   ,[Type]
		   ,[Language] 
		   ,[CreateAt]
		   ,[Status])
		  
     VALUES
           (@MangaId
           ,@AccountId
           ,@RoleId
           ,@StatusActive
		   ,@Type
		   ,@Language
		   ,GetDate()
		   ,@Status)
END
GO
/****** Object:  StoredProcedure [dbo].[MangaDetail_ChangeStatus]    Script Date: 3/11/2020 8:04:25 AM ******/
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
			@Language int
)
AS
BEGIN
	UPDATE [dbo].[Manga_Detail]
	SET [Status] = @StatusActive
	WHERE MangaId = @MangaId and RoleId = @RoleId and AccountId = @AccountId and Language = @Language 
END
GO
/****** Object:  StoredProcedure [dbo].[MangaDetail_CheckJoin]    Script Date: 3/11/2020 8:04:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MangaDetail_CheckOldPassWord]    Script Date: 3/11/2020 8:04:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MangaDetail_GetAccountCreateManga]    Script Date: 3/11/2020 8:04:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MangaDetail_GetInfo]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
CREATE PROCEDURE [dbo].[MangaDetail_GetInfo] 
(
			@MangaId int,
			@RoleId int,
			@AccountId int,
			@StatusActive int,
			@Language int
)
AS
BEGIN
if(@Language = NULL)
		select * from Manga_Detail
		WHERE AccountId = @AccountId and MangaId = @MangaId and RoleId = @RoleId
else
	select * from Manga_Detail
	WHERE MangaId = @MangaId and RoleId = @RoleId and AccountId = @AccountId and Language = @Language 
END
GO
/****** Object:  StoredProcedure [dbo].[MangaDetail_GetMangaJoin]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
Create PROCEDURE [dbo].[MangaDetail_GetMangaJoin] 
(
			@AccountId int
			
)
AS
BEGIN
	SELECT md.AccountId , a.UserName as UserName, md.MangaId, m.FullName as MangaFullName, md.RoleId, r.FullName as RoleFullName, md.StatusActive,md.Type, md.Language
	FROM dbo.Manga_Detail as md 
	JOIN TEMP as t ON t.MangaId = md.MangaId
	JOIN dbo.Account as a ON a.AccountId = md.AccountId
	JOIN dbo.Manga as m ON m.MangaId = md.MangaId
	JOIN dbo.Role as r ON r.RoleId = md.RoleId
	WHERE md.RoleId <>1 AND md.RoleId <>4 AND md.RoleId <>5
END
GO
/****** Object:  StoredProcedure [dbo].[MangaDetail_GetPeopleJoinmanga]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
CREATE PROCEDURE [dbo].[MangaDetail_GetPeopleJoinmanga] 
(
			@AccountId int
			
)
AS
BEGIN
	;With TEMP AS(
		SELECT *
		FROM dbo.Manga_Detail as md
		WHERE md.AccountId = @AccountId AND md.RoleId = 1
	)
	SELECT md.AccountId , a.UserName as UserName, md.MangaId, m.FullName as MangaFullName, md.RoleId, r.FullName as RoleFullName, md.Active,md.Type, md.Language
	FROM dbo.Manga_Detail as md 
	JOIN TEMP as t ON t.MangaId = md.MangaId
	JOIN dbo.Account as a ON a.AccountId = md.AccountId
	JOIN dbo.Manga as m ON m.MangaId = md.MangaId
	JOIN dbo.Role as r ON r.RoleId = md.RoleId
	WHERE md.RoleId <>1 AND md.RoleId <>4 
END
GO
/****** Object:  StoredProcedure [dbo].[MangaGenre_Addnew]    Script Date: 3/11/2020 8:04:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MangaGenre_GetListGenreId]    Script Date: 3/11/2020 8:04:25 AM ******/
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
	
	where MangaId = @MangaId and Active = 1
END










GO
/****** Object:  StoredProcedure [dbo].[MangaGenre_UpdateStatus]    Script Date: 3/11/2020 8:04:25 AM ******/
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
CREATE PROCEDURE [dbo].[MangaGenre_UpdateStatus]
(
	
	@MangaId int,
	@GenreId int,
	@StatusActive bit
)
AS
BEGIN
Update  [dbo].[Manga_Genres]
set
           [Active] = @StatusActive
    where Manga_Genres.MangaId = @MangaId and GenreId = @GenreId
END











GO
/****** Object:  StoredProcedure [dbo].[Page_GetFirstPage]    Script Date: 3/11/2020 8:04:25 AM ******/
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
Create PROCEDURE [dbo].[Page_GetFirstPage]
(
	@MangaId int
)
AS
BEGIN
	select top(1) PageId from Page
	 join Chapter on Page.ChapterId = Chapter.ChapterId 
	 join Manga on Manga.MangaId = Chapter.MangaId
	 where Manga.MangaId = @MangaId
END










GO
/****** Object:  StoredProcedure [dbo].[Role_GetRoldIdbyId]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
CREATE PROCEDURE [dbo].[Role_GetRoldIdbyId] 
(
			@Role nvarchar(50)
)
AS
BEGIN
	select RoleId from[dbo].[Role]
	WHERE Role.Id = @Role
END
GO
/****** Object:  StoredProcedure [dbo].[Role_GetRoleInfoById]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
CREATE PROCEDURE [dbo].[Role_GetRoleInfoById] 
(
			@RoleId int
)
AS
BEGIN
		select * from Role
		WHERE  RoleId = @RoleId and Active = 1
END
GO
/****** Object:  StoredProcedure [dbo].[SqlQueryNotificationStoredProcedure-9dbca8f0-7ac8-4fcc-af06-71674dc93a5f]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SqlQueryNotificationStoredProcedure-9dbca8f0-7ac8-4fcc-af06-71674dc93a5f] AS BEGIN BEGIN TRANSACTION; RECEIVE TOP(0) conversation_handle FROM [SqlQueryNotificationService-9dbca8f0-7ac8-4fcc-af06-71674dc93a5f]; IF (SELECT COUNT(*) FROM [SqlQueryNotificationService-9dbca8f0-7ac8-4fcc-af06-71674dc93a5f] WHERE message_type_name = 'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer') > 0 BEGIN if ((SELECT COUNT(*) FROM sys.services WHERE name = 'SqlQueryNotificationService-9dbca8f0-7ac8-4fcc-af06-71674dc93a5f') > 0)   DROP SERVICE [SqlQueryNotificationService-9dbca8f0-7ac8-4fcc-af06-71674dc93a5f]; if (OBJECT_ID('SqlQueryNotificationService-9dbca8f0-7ac8-4fcc-af06-71674dc93a5f', 'SQ') IS NOT NULL)   DROP QUEUE [SqlQueryNotificationService-9dbca8f0-7ac8-4fcc-af06-71674dc93a5f]; DROP PROCEDURE [SqlQueryNotificationStoredProcedure-9dbca8f0-7ac8-4fcc-af06-71674dc93a5f]; END COMMIT TRANSACTION; END
GO
/****** Object:  StoredProcedure [dbo].[SqlQueryNotificationStoredProcedure-b626e18a-f398-4659-acaf-1967e08dfdff]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SqlQueryNotificationStoredProcedure-b626e18a-f398-4659-acaf-1967e08dfdff] AS BEGIN BEGIN TRANSACTION; RECEIVE TOP(0) conversation_handle FROM [SqlQueryNotificationService-b626e18a-f398-4659-acaf-1967e08dfdff]; IF (SELECT COUNT(*) FROM [SqlQueryNotificationService-b626e18a-f398-4659-acaf-1967e08dfdff] WHERE message_type_name = 'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer') > 0 BEGIN if ((SELECT COUNT(*) FROM sys.services WHERE name = 'SqlQueryNotificationService-b626e18a-f398-4659-acaf-1967e08dfdff') > 0)   DROP SERVICE [SqlQueryNotificationService-b626e18a-f398-4659-acaf-1967e08dfdff]; if (OBJECT_ID('SqlQueryNotificationService-b626e18a-f398-4659-acaf-1967e08dfdff', 'SQ') IS NOT NULL)   DROP QUEUE [SqlQueryNotificationService-b626e18a-f398-4659-acaf-1967e08dfdff]; DROP PROCEDURE [SqlQueryNotificationStoredProcedure-b626e18a-f398-4659-acaf-1967e08dfdff]; END COMMIT TRANSACTION; END
GO
/****** Object:  StoredProcedure [dbo].[Test]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Test] 
(
	@AccountId int
)
AS
BEGIN
	;With TEMP AS(
		SELECT *
		FROM dbo.Manga_Detail as md
		WHERE md.AccountId = @AccountId AND md.RoleId = 1
	)
	SELECT md.AccountId, a.UserName, md.MangaId, m.FullName, md.RoleId, r.FullName, md.StatusActive,md.Type, md.Language
	FROM dbo.Manga_Detail as md 
	JOIN TEMP as t ON t.MangaId = md.MangaId
	JOIN dbo.Account as a ON a.AccountId = md.AccountId
	JOIN dbo.Manga as m ON m.MangaId = md.MangaId
	JOIN dbo.Role as r ON r.RoleId = md.RoleId
	WHERE md.RoleId <>1 AND md.RoleId <>4 AND md.RoleId <>5
END
GO
/****** Object:  StoredProcedure [dbo].[Translation_AddnewTranslation]    Script Date: 3/11/2020 8:04:25 AM ******/
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
CREATE PROCEDURE [dbo].[Translation_AddnewTranslation]
(
	@MangaId int,
	@AccountId int,
	@Language int,
	@StatusActive bit,
	@Status int
)
AS
BEGIN
declare @LanguageId int;
select @LanguageId = LanguageId from Language where LanguageId = @Language
INSERT INTO [dbo].[Translation]
           ([MangaId]
           ,[AccountId]
           ,[LanguageId]
		   ,[Active]
		   ,[Status])
     VALUES
           (@MangaId
           ,@AccountId
           ,@LanguageId
		   ,@StatusActive
		   ,@Status)
END











GO
/****** Object:  StoredProcedure [dbo].[Translation_CheckExist]    Script Date: 3/11/2020 8:04:25 AM ******/
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
	WHERE MangaId= @MangaId and  Language.LanguageId = @Language and Translation.Active = 1
	if(@id=0)
	
			SET @res=0
			
	ELSE
	SET @res= @id
	select @res
END
GO
/****** Object:  StoredProcedure [dbo].[Translation_UpdateInfo]    Script Date: 3/11/2020 8:04:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tuan>
-- Description:	<Update new UserAccount Info>
-- Exec dbo.Account_UpdateAccountInfo 2,'test','test','test','test','test','11/11/2011','test'
-- =============================================
CREATE PROCEDURE [dbo].[Translation_UpdateInfo] 
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
			[Status] = @StatusActive
	WHERE TransationId = @TranslationId
END
GO
USE [master]
GO
ALTER DATABASE [MyWebsite] SET  READ_WRITE 
GO
