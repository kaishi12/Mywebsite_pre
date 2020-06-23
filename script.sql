USE [master]
GO
/****** Object:  Database [MyWebsite]    Script Date: 6/23/2020 11:04:26 AM ******/
CREATE DATABASE [MyWebsite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyWebsite', FILENAME = N'F:\MyWebsite.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MyWebsite_log', FILENAME = N'F:\MyWebsite_log.ldf' , SIZE = 8512KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
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
/****** Object:  Table [dbo].[Account]    Script Date: 6/23/2020 11:04:26 AM ******/
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
	[Type] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Detail]    Script Date: 6/23/2020 11:04:26 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookmark]    Script Date: 6/23/2020 11:04:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookmark](
	[MangaId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[LastSeenChap] [int] NOT NULL,
	[SeenStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Bookmark] PRIMARY KEY CLUSTERED 
(
	[MangaId] ASC,
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/23/2020 11:04:26 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 6/23/2020 11:04:26 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document]    Script Date: 6/23/2020 11:04:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Order] [int] NULL,
	[Text] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Active] [bit] NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 6/23/2020 11:04:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[Description] [text] NULL,
	[date] [datetime] NULL,
	[status] [int] NULL,
	[active] [bit] NULL,
	[title] [nvarchar](255) NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Font]    Script Date: 6/23/2020 11:04:26 AM ******/
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
 CONSTRAINT [PK_Font] PRIMARY KEY CLUSTERED 
(
	[FontId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 6/23/2020 11:04:26 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 6/23/2020 11:04:26 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manga]    Script Date: 6/23/2020 11:04:26 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manga_Detail]    Script Date: 6/23/2020 11:04:26 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manga_Genres]    Script Date: 6/23/2020 11:04:26 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 6/23/2020 11:04:26 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotifyType]    Script Date: 6/23/2020 11:04:26 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Page]    Script Date: 6/23/2020 11:04:26 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Point]    Script Date: 6/23/2020 11:04:26 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointHistory]    Script Date: 6/23/2020 11:04:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointHistory](
	[HistoryId] [int] IDENTITY(1,1) NOT NULL,
	[ToDay] [datetime] NULL,
	[AccountId] [int] NULL,
	[DTPoint] [float] NULL,
	[QLBDPoint] [float] NULL,
	[QLTPoint] [float] NULL,
	[UPCLEARPoint] [float] NULL,
	[Active] [bit] NULL,
	[MangaId] [int] NULL,
	[Views] [int] NULL,
 CONSTRAINT [PK_PointHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/23/2020 11:04:26 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/23/2020 11:04:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[Alias] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Text]    Script Date: 6/23/2020 11:04:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Text](
	[TextId] [int] IDENTITY(1,1) NOT NULL,
	[TextContent] [nvarchar](max) NULL,
	[ColorText] [nchar](10) NULL,
	[ColorOutline] [nchar](10) NULL,
	[Bold] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[Allow] [bit] NULL,
	[TranslationId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[TextBoxId] [int] NOT NULL,
	[FontId] [int] NOT NULL,
	[FontSize] [int] NOT NULL,
	[Italic] [bit] NOT NULL,
 CONSTRAINT [PK_Text] PRIMARY KEY CLUSTERED 
(
	[TextId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TextBox]    Script Date: 6/23/2020 11:04:26 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Translation]    Script Date: 6/23/2020 11:04:26 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Translation_Detail]    Script Date: 6/23/2020 11:04:26 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountId], [FullName], [Email], [PhoneNumber], [AvatarLink], [Active], [UserName], [PassWord], [ResetPasswordCode], [FacebookLink], [TwitterLink], [InstagramLink], [Status], [Note], [Type]) VALUES (1, N'Hikigaya Hachiman', N'kaishi.ga@gmail.com', N'0918325891', N'bfc5fa0d0f4055b678d6fbc56fcba8b8.jpg', 1, N'kaishi1', N'326C5F2A7FAC69A83432AA175DBBA2B2', NULL, N'facebook.com/Hachiman', N'TwitterLink.com/Hachiman', N'InstagramLink.com/Hachiman', NULL, N'I''m Hachiman', 2)
INSERT [dbo].[Account] ([AccountId], [FullName], [Email], [PhoneNumber], [AvatarLink], [Active], [UserName], [PassWord], [ResetPasswordCode], [FacebookLink], [TwitterLink], [InstagramLink], [Status], [Note], [Type]) VALUES (2, N'Yukino', N'kaishi.ga2@gmail.com', N'0918325891', N'Yukino_S206.png', 1, N'kaishi2', N'326C5F2A7FAC69A83432AA175DBBA2B2', NULL, N'facebook.com/Yukino', N'Twitter.com/Yukino', N'Instagram.com/Yukino', NULL, N'I''m Yukino', 1)
INSERT [dbo].[Account] ([AccountId], [FullName], [Email], [PhoneNumber], [AvatarLink], [Active], [UserName], [PassWord], [ResetPasswordCode], [FacebookLink], [TwitterLink], [InstagramLink], [Status], [Note], [Type]) VALUES (3, N'Saki', N'kaishi.ga3@gmail.com', N'0918325891', N'Saki_Zoku.png', 1, N'kaishi3', N'326C5F2A7FAC69A83432AA175DBBA2B2', NULL, N'facebook.com/Saki', N'Twitter.com/Saki', N'Instagram.com/Saki', NULL, N'I''m Saki', 1)
INSERT [dbo].[Account] ([AccountId], [FullName], [Email], [PhoneNumber], [AvatarLink], [Active], [UserName], [PassWord], [ResetPasswordCode], [FacebookLink], [TwitterLink], [InstagramLink], [Status], [Note], [Type]) VALUES (4, NULL, N'kaishi4@gmail.com', NULL, NULL, 1, N'kaishi4', N'326C5F2A7FAC69A83432AA175DBBA2B2', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Account] ([AccountId], [FullName], [Email], [PhoneNumber], [AvatarLink], [Active], [UserName], [PassWord], [ResetPasswordCode], [FacebookLink], [TwitterLink], [InstagramLink], [Status], [Note], [Type]) VALUES (5, NULL, N'kaishi@gmail.com', NULL, NULL, 1, N'adminkaishi', N'FD4DB960BA51C68B0693326DB1B84B28', NULL, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[Account] ([AccountId], [FullName], [Email], [PhoneNumber], [AvatarLink], [Active], [UserName], [PassWord], [ResetPasswordCode], [FacebookLink], [TwitterLink], [InstagramLink], [Status], [Note], [Type]) VALUES (6, NULL, N'asda@gmail.com', NULL, NULL, 0, N'ádsad', N'5E29F274D4259211DA0D588D328266FA', NULL, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[Account] ([AccountId], [FullName], [Email], [PhoneNumber], [AvatarLink], [Active], [UserName], [PassWord], [ResetPasswordCode], [FacebookLink], [TwitterLink], [InstagramLink], [Status], [Note], [Type]) VALUES (7, NULL, N'ádasda@gmail.com', NULL, NULL, 1, N'ádada', N'AAA36311925B88EECCAA0F6543328AF7', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Account] ([AccountId], [FullName], [Email], [PhoneNumber], [AvatarLink], [Active], [UserName], [PassWord], [ResetPasswordCode], [FacebookLink], [TwitterLink], [InstagramLink], [Status], [Note], [Type]) VALUES (1007, NULL, N'kaishi1234.ga@gmail.com', NULL, NULL, 1, N'kaishi12341', N'326C5F2A7FAC69A83432AA175DBBA2B2', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [FullName], [Active]) VALUES (1, N'Trang Raw', 1)
INSERT [dbo].[Category] ([CategoryId], [FullName], [Active]) VALUES (2, N'Trang Clear-text', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Chapter] ON 

INSERT [dbo].[Chapter] ([ChapterId], [FullName], [OrderNumber], [ViewNumber], [CreateAt], [Active], [MangaId], [Alias]) VALUES (7, N'DEMON OF RESPECT AND AFFECTION', 67, 245, CAST(N'2020-03-01T15:59:51.227' AS DateTime), 1, 10, N'DEMON-OF-RESPECT-AND-AFFECTION')
SET IDENTITY_INSERT [dbo].[Chapter] OFF
GO
SET IDENTITY_INSERT [dbo].[Document] ON 

INSERT [dbo].[Document] ([Id], [Order], [Text], [Image], [Active], [Name]) VALUES (1, 4, N'Dịch truyện như thế nào?', N'/RootPicture/img_mountains_wide.jpg;/RootPicture/img_mountains_wide.jpg;/RootPicture/img_mountains_wide.jpg', 1, N'Dịch Truyện')
INSERT [dbo].[Document] ([Id], [Order], [Text], [Image], [Active], [Name]) VALUES (2, 2, N'Quản lý truyện như thế nào?', N'/RootPicture/Capture.PNG;/RootPicture/img_mountains_wide.jpg;/RootPicture/img_mountains_wide.jpg;/RootPicture/img_mountains_wide.jpg', 1, N'Quản Lý Truyện')
INSERT [dbo].[Document] ([Id], [Order], [Text], [Image], [Active], [Name]) VALUES (3, 3, N'Up clear-text như thế nào? ', NULL, 1, N'Upload Clear-text')
INSERT [dbo].[Document] ([Id], [Order], [Text], [Image], [Active], [Name]) VALUES (4, 1, N'Quản lý bản dịch như thế nào?', NULL, 1, N'Quản lý bản dịch')
SET IDENTITY_INSERT [dbo].[Document] OFF
GO
SET IDENTITY_INSERT [dbo].[FeedBack] ON 

INSERT [dbo].[FeedBack] ([Id], [AccountId], [Description], [date], [status], [active], [title]) VALUES (2, 1, N'test2', CAST(N'2020-06-05T13:56:45.133' AS DateTime), 2, 1, N'test1 ')
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
GO
SET IDENTITY_INSERT [dbo].[Font] ON 

INSERT [dbo].[Font] ([FontId], [FullName], [FontLink], [Description], [Active]) VALUES (1, N'MTO augie', N'/MTO augie/font.css', N'nothing', 1)
SET IDENTITY_INSERT [dbo].[Font] OFF
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [Active]) VALUES (1, N'Hành Động', N'Action', N'Đánh đấm các thứ', N'Action', 1)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [Active]) VALUES (2, N'Harem', N'Harem', N'Yêu đương các thứa', N'Harem', 1)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [Active]) VALUES (3, N'Isekai', N'Isekai', N'Isekai', N'Isekai', 1)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [Active]) VALUES (4, N'lịch sử', N'history', N'Lịch sử', N'history', 1)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [Active]) VALUES (5, N'ádasd', N'ádad', N'ádada', N'ádad', 0)
INSERT [dbo].[Genre] ([GenreId], [FullName], [Id], [Description], [Alias], [Active]) VALUES (6, N'ádada', N'ádad', N'ádada', N'ádasd', 0)
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
SET IDENTITY_INSERT [dbo].[Language] ON 

INSERT [dbo].[Language] ([LanguageId], [FullName], [Note], [Active], [Code]) VALUES (1, N'Tiếng việt', N'nothing', 1, N'vn')
SET IDENTITY_INSERT [dbo].[Language] OFF
GO
SET IDENTITY_INSERT [dbo].[Manga] ON 

INSERT [dbo].[Manga] ([MangaId], [CoverLink], [FullName], [Description], [CreateAt], [Author], [Active], [Alias], [StatusId], [UpdateAt]) VALUES (10, N'1767-tensei_shitara_slime_datta_ken.jpg', N'Tensei Shitara Slime Datta Ken', N'A man is stabbed by a robber on the run after pushing his coworker and his coworker''s new fiance out of the way. As he lays dying, bleeding on the ground, he hears a voice. This voice is strange and interprets his dying regret of being a virgin by gives him the [Great Sage] unique skill! Is he being made fun of !?!', CAST(N'2020-02-29T20:51:10.790' AS DateTime), N'Fuse - Kawakami Taiki', 1, N'tensei-shitara-slime-datta-ken', 1, CAST(N'2020-02-29T20:27:58.953' AS DateTime))
INSERT [dbo].[Manga] ([MangaId], [CoverLink], [FullName], [Description], [CreateAt], [Author], [Active], [Alias], [StatusId], [UpdateAt]) VALUES (11, N'black-clover.png', N'Black Clover', N'asdadada', CAST(N'2020-04-30T15:46:35.987' AS DateTime), N'sadada', 1, N'black-clover', 1, CAST(N'2020-04-30T15:46:35.987' AS DateTime))
SET IDENTITY_INSERT [dbo].[Manga] OFF
GO
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [Active], [Type], [Language], [CreateAt], [Status]) VALUES (1, 10, 1, 1, 2, -1, CAST(N'2020-02-29T20:28:03.090' AS DateTime), 2)
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [Active], [Type], [Language], [CreateAt], [Status]) VALUES (1, 10, 2, 1, 0, 1, CAST(N'2020-05-20T15:52:46.503' AS DateTime), 2)
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [Active], [Type], [Language], [CreateAt], [Status]) VALUES (1, 10, 3, 1, 0, 1, CAST(N'2020-05-11T08:34:04.240' AS DateTime), 2)
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [Active], [Type], [Language], [CreateAt], [Status]) VALUES (1, 10, 4, 1, 0, 1, CAST(N'2020-06-04T13:38:46.930' AS DateTime), 2)
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [Active], [Type], [Language], [CreateAt], [Status]) VALUES (1, 11, 1, 1, 2, -1, CAST(N'2020-04-30T15:46:36.373' AS DateTime), 2)
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [Active], [Type], [Language], [CreateAt], [Status]) VALUES (1, 11, 2, 1, 0, 1, CAST(N'2020-05-20T15:49:23.687' AS DateTime), 2)
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [Active], [Type], [Language], [CreateAt], [Status]) VALUES (1, 11, 4, 1, 0, 1, CAST(N'2020-06-03T19:05:44.397' AS DateTime), 2)
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [Active], [Type], [Language], [CreateAt], [Status]) VALUES (2, 10, 3, 1, 0, 0, CAST(N'2020-03-01T02:53:13.580' AS DateTime), 2)
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [Active], [Type], [Language], [CreateAt], [Status]) VALUES (2, 10, 4, 1, 0, 1, CAST(N'2020-05-03T17:49:47.220' AS DateTime), 2)
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [Active], [Type], [Language], [CreateAt], [Status]) VALUES (3, 10, 2, 1, 0, -1, CAST(N'2020-03-01T09:10:12.213' AS DateTime), 2)
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [Active], [Type], [Language], [CreateAt], [Status]) VALUES (4, 10, 2, 1, 0, 1, CAST(N'2020-05-11T08:11:10.403' AS DateTime), 2)
INSERT [dbo].[Manga_Detail] ([AccountId], [MangaId], [RoleId], [Active], [Type], [Language], [CreateAt], [Status]) VALUES (1007, 10, 3, 1, 0, 1, CAST(N'2020-06-05T13:17:33.233' AS DateTime), 2)
GO
INSERT [dbo].[Manga_Genres] ([MangaId], [GenreId], [Active]) VALUES (10, 1, 1)
INSERT [dbo].[Manga_Genres] ([MangaId], [GenreId], [Active]) VALUES (10, 2, 1)
INSERT [dbo].[Manga_Genres] ([MangaId], [GenreId], [Active]) VALUES (11, 1, 1)
INSERT [dbo].[Manga_Genres] ([MangaId], [GenreId], [Active]) VALUES (11, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1, N'<strong>kaishi3 </strong>đã gửi yêu cầu tham gia truyện: Tensei Shitara Slime Datta Ken của bạn vị trí Tải lên bản clear-text.', CAST(N'2020-03-01T09:10:14.363' AS DateTime), 1, 1, 1, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (2, N'<strong>Lời mời tham gia </strong>truyện: Tensei Shitara Slime Datta Ken, vị trí RoleFullName tới kaishi3 đã được duyệt.', CAST(N'2020-03-01T09:55:06.817' AS DateTime), 1, 1, 4, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (3, N'<strong>kaishi2 </strong>đã gửi yêu cầu tham gia truyện: Tensei Shitara Slime Datta Ken của bạn vị trí Quản lý bảm dịch toàn truyện theo ngôn ngữ.', CAST(N'2020-05-03T17:49:47.357' AS DateTime), 1, 1, 1, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (4, N'<strong>Lời mời tham gia </strong>truyện: Tensei Shitara Slime Datta Ken, vị trí RoleFullName tới kaishi2 đã được duyệt.', CAST(N'2020-05-03T17:50:28.340' AS DateTime), 1, 1, 4, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (5, N'<strong>Thoại dịch </strong>trang 1 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-05-03T19:16:08.890' AS DateTime), 1, 2, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (6, N'<strong>Thoại dịch </strong>trang 1 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-05-03T19:24:35.833' AS DateTime), 1, 2, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1005, N'<strong>kaishi4 </strong>đã gửi yêu cầu tham gia truyện: Tensei Shitara Slime Datta Ken của bạn vị trí Tải lên bản clear-text.', CAST(N'2020-05-11T08:11:10.457' AS DateTime), 1, 1, 1, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1006, N'<strong>Lời mời tham gia </strong>truyện: Tensei Shitara Slime Datta Ken, vị trí RoleFullName tới kaishi4 đã được duyệt.', CAST(N'2020-05-11T08:14:05.560' AS DateTime), 1, 1, 4, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1007, N'<strong>Lời mời tham gia </strong>truyện: Tensei Shitara Slime Datta Ken, vị trí RoleFullName tới kaishi4 đã được duyệt.', CAST(N'2020-05-11T08:22:12.250' AS DateTime), 1, 1, 4, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1008, N'<strong>Lời mời tham gia </strong>truyện: Tensei Shitara Slime Datta Ken, vị trí RoleFullName tới kaishi4 đã được duyệt.', CAST(N'2020-05-11T08:23:43.077' AS DateTime), 1, 1, 4, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1009, N'<strong>Lời mời tham gia </strong>truyện: Tensei Shitara Slime Datta Ken, vị trí RoleFullName tới kaishi4 đã được duyệt.', CAST(N'2020-05-11T08:25:51.513' AS DateTime), 1, 1, 4, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1010, N'<strong>kaishi1 </strong>đã gửi yêu cầu tham gia truyện: Tensei Shitara Slime Datta Ken của bạn vị trí Dịch truyện.', CAST(N'2020-05-11T08:34:04.247' AS DateTime), 1, 1, 1, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1011, N'<strong>Lời mời tham gia </strong>truyện: Tensei Shitara Slime Datta Ken, vị trí RoleFullName tới kaishi1 đã được duyệt.', CAST(N'2020-05-11T08:34:37.303' AS DateTime), 1, 1, 4, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1012, N'<strong>Lời mời tham gia </strong>truyện: Tensei Shitara Slime Datta Ken, vị trí RoleFullName tới kaishi4 đã được duyệt.', CAST(N'2020-05-11T08:34:40.190' AS DateTime), 1, 1, 4, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1013, N'<strong>kaishi1 </strong>đã gửi yêu cầu tham gia truyện: Black Clover của bạn vị trí Tải lên bản clear-text.', CAST(N'2020-05-20T15:49:23.767' AS DateTime), 1, 1, 1, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1014, N'<strong>Lời mời tham gia </strong>truyện: Black Clover, vị trí RoleFullName tới kaishi1 đã được duyệt.', CAST(N'2020-05-20T15:49:39.410' AS DateTime), 1, 1, 4, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1015, N'<strong>kaishi1 </strong>đã gửi yêu cầu tham gia truyện: Tensei Shitara Slime Datta Ken của bạn vị trí Tải lên bản clear-text.', CAST(N'2020-05-20T15:52:46.510' AS DateTime), 1, 1, 1, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1016, N'<strong>Lời mời tham gia </strong>truyện: Tensei Shitara Slime Datta Ken, vị trí RoleFullName tới kaishi1 đã được duyệt.', CAST(N'2020-05-20T15:52:52.643' AS DateTime), 1, 1, 4, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1017, N'<strong>kaishi1 </strong>đã gửi yêu cầu tham gia truyện: Black Clover của bạn vị trí Translate Manager.', CAST(N'2020-06-03T19:05:44.503' AS DateTime), 1, 1, 1, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1018, N'<strong>Lời mời tham gia </strong>truyện: Black Clover, vị trí RoleFullName tới kaishi1 đã được duyệt.', CAST(N'2020-06-03T19:05:53.033' AS DateTime), 1, 1, 4, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1019, N'<strong>kaishi1 </strong>đã gửi yêu cầu tham gia truyện: Tensei Shitara Slime Datta Ken của bạn vị trí Translate Manager.', CAST(N'2020-06-04T13:38:47.067' AS DateTime), 1, 1, 1, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1020, N'<strong>Lời mời tham gia </strong>truyện: Tensei Shitara Slime Datta Ken, vị trí RoleFullName tới kaishi1 đã được duyệt.', CAST(N'2020-06-04T13:39:23.353' AS DateTime), 1, 1, 4, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1021, N'<strong>Thoại dịch </strong>trang 1 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-06-04T18:13:33.613' AS DateTime), 1, 1, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1022, N'<strong>Thoại dịch </strong>trang 1 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-06-04T18:18:13.150' AS DateTime), 1, 1, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1023, N'<strong>Thoại dịch </strong>trang 1 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-06-04T18:18:45.643' AS DateTime), 1, 2, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1024, N'<strong>Thoại dịch </strong>trang 1 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-06-04T18:18:52.860' AS DateTime), 1, 1, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1025, N'<strong>Thoại dịch </strong>trang 1 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-06-04T18:19:13.810' AS DateTime), 1, 2, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1026, N'<strong>Thoại dịch </strong>trang 1 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-06-04T18:34:15.520' AS DateTime), 1, 1, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1027, N'<strong>Thoại dịch </strong>trang 1 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-06-04T18:34:17.297' AS DateTime), 1, 1, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1028, N'<strong>kaishi12341 </strong>đã gửi yêu cầu tham gia truyện: Tensei Shitara Slime Datta Ken của bạn vị trí Translator.', CAST(N'2020-06-05T13:17:33.307' AS DateTime), 1, 1, 1, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1029, N'<strong>Lời mời tham gia </strong>truyện: Tensei Shitara Slime Datta Ken, vị trí RoleFullName tới kaishi12341 đã được duyệt.', CAST(N'2020-06-05T13:17:50.563' AS DateTime), 1, 1, 4, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1030, N'<strong>Thoại dịch </strong>trang 2 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-06-19T18:59:43.333' AS DateTime), 1, 1, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1031, N'<strong>Thoại dịch </strong>trang 2 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-06-19T18:59:45.193' AS DateTime), 1, 1, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1032, N'<strong>Thoại dịch </strong>trang 2 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-06-19T18:59:47.313' AS DateTime), 1, 1, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1033, N'<strong>Thoại dịch </strong>trang 3 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-06-19T19:36:29.370' AS DateTime), 1, 1, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1034, N'<strong>Thoại dịch </strong>trang 3 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-06-19T19:36:30.893' AS DateTime), 1, 1, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1035, N'<strong>Thoại dịch </strong>trang 4 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-06-19T19:36:37.080' AS DateTime), 1, 1, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1036, N'<strong>Thoại dịch </strong>trang 4 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-06-19T19:36:38.577' AS DateTime), 1, 1, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1037, N'<strong>Thoại dịch </strong>trang 4 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-06-19T19:36:40.143' AS DateTime), 1, 1, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1038, N'<strong>Thoại dịch </strong>trang 4 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-06-19T19:36:42.040' AS DateTime), 1, 1, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1039, N'<strong>Thoại dịch </strong>trang 4 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-06-19T19:36:43.727' AS DateTime), 1, 1, 5, 0)
INSERT [dbo].[Notification] ([NotificationId], [NContent], [CreateAt], [Status], [AccountId], [NotifyTypeId], [SeenStatus]) VALUES (1040, N'<strong>Thoại dịch </strong>trang 4 chương 67 truyện: Tensei Shitara Slime Datta Ken ngôn ngữ Tiếng việt của bạn đã được duyệt.', CAST(N'2020-06-19T19:36:45.350' AS DateTime), 1, 1, 5, 0)
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[NotifyType] ON 

INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [Active], [NTContent]) VALUES (1, N'Request', 1, N'<strong>UserName </strong>đã gửi yêu cầu tham gia truyện: MangaName của bạn vị trí RoleName.')
INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [Active], [NTContent]) VALUES (2, N'Invite', 1, N'<strong>UserName </strong>đã mời bạn tham gia truyện: MangaName vị trí RoleName.')
INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [Active], [NTContent]) VALUES (3, N'RequestRespone', 1, N'<strong>Yêu cầu tham gia </strong>truyện: MangaName, vị trí RoleName của bạn đã được duyệt.')
INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [Active], [NTContent]) VALUES (4, N'InviteReply', 1, N'<strong>Lời mời tham gia </strong>truyện: MangaName, vị trí RoleFullName tới UserName đã được duyệt.')
INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [Active], [NTContent]) VALUES (5, N'Trans', 1, N'<strong>Thoại dịch </strong>trang PageOrder chương ChapterOrder truyện: MangaName ngôn ngữ Language của bạn đã được duyệt.')
INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [Active], [NTContent]) VALUES (6, N'Upload', 1, N'<strong>Trang ChapterOrder clear-text </strong>chương ChapterOrder truyện: MangaName của bạn đã được duyệt.')
INSERT [dbo].[NotifyType] ([NotifyTypeId], [FullName], [Active], [NTContent]) VALUES (7, N'AddNew', 1, N'<strong>Truyện: MangaName </strong>đã thêm chương truyện ChapterOrder: ChapterName.')
SET IDENTITY_INSERT [dbo].[NotifyType] OFF
GO
SET IDENTITY_INSERT [dbo].[Page] ON 

INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (14, N'trang 1-DEMON OF RESPECT AND AFFECTION', 1, N'trang 1-DEMON OF RESPECT AND AFFECTION.png', 1, 7, 1, CAST(N'2020-03-01T15:59:54.143' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (15, N'trang 2-DEMON OF RESPECT AND AFFECTION', 2, N'trang 2-DEMON OF RESPECT AND AFFECTION.png', 0, 7, 1, CAST(N'2020-03-01T15:59:57.937' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (16, N'trang 3-DEMON OF RESPECT AND AFFECTION', 3, N'trang 3-DEMON OF RESPECT AND AFFECTION.png', 0, 7, 1, CAST(N'2020-03-01T16:00:01.873' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (17, N'trang 1-DEMON OF RESPECT AND AFFECTION-Clear-text-', 1, N'1.jpg', 1, 7, 2, CAST(N'2020-03-01T16:01:53.683' AS DateTime), 3, 14, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (18, N'trang 2-DEMON OF RESPECT AND AFFECTION', 2, N'2.jpg', 1, 7, 1, CAST(N'2020-06-19T18:32:04.067' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (19, N'trang 3-DEMON OF RESPECT AND AFFECTION', 3, N'3.jpg', 1, 7, 1, CAST(N'2020-06-19T18:32:04.777' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (20, N'trang 4-DEMON OF RESPECT AND AFFECTION', 4, N'4.jpg', 1, 7, 1, CAST(N'2020-06-19T18:32:04.783' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (21, N'trang 5-DEMON OF RESPECT AND AFFECTION', 5, N'5.jpg', 1, 7, 1, CAST(N'2020-06-19T18:32:04.787' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (22, N'trang 6-DEMON OF RESPECT AND AFFECTION', 6, N'6.jpg', 1, 7, 1, CAST(N'2020-06-19T18:32:04.793' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (23, N'trang 7-DEMON OF RESPECT AND AFFECTION', 7, N'7.jpg', 1, 7, 1, CAST(N'2020-06-19T18:32:04.797' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (24, N'trang 8-DEMON OF RESPECT AND AFFECTION', 8, N'8.jpg', 1, 7, 1, CAST(N'2020-06-19T18:32:04.803' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (25, N'trang 9-DEMON OF RESPECT AND AFFECTION', 9, N'9.jpg', 1, 7, 1, CAST(N'2020-06-19T18:32:04.867' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (26, N'trang 10-DEMON OF RESPECT AND AFFECTION', 10, N'10.jpg', 1, 7, 1, CAST(N'2020-06-19T18:32:04.907' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (27, N'trang 11-DEMON OF RESPECT AND AFFECTION', 11, N'11.jpg', 1, 7, 1, CAST(N'2020-06-19T18:32:04.913' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (28, N'trang 12-DEMON OF RESPECT AND AFFECTION', 12, N'12.jpg', 1, 7, 1, CAST(N'2020-06-19T18:32:04.920' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (29, N'trang 13-DEMON OF RESPECT AND AFFECTION', 13, N'13.jpg', 1, 7, 1, CAST(N'2020-06-19T18:32:04.923' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (30, N'trang 14-DEMON OF RESPECT AND AFFECTION', 14, N'14.jpg', 1, 7, 1, CAST(N'2020-06-19T18:32:04.927' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (31, N'trang 15-DEMON OF RESPECT AND AFFECTION', 15, N'15.jpg', 1, 7, 1, CAST(N'2020-06-19T18:32:04.977' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (32, N'trang 16-DEMON OF RESPECT AND AFFECTION', 16, N'16.jpg', 1, 7, 1, CAST(N'2020-06-19T18:32:04.980' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (33, N'trang 17-DEMON OF RESPECT AND AFFECTION', 17, N'17.jpg', 1, 7, 1, CAST(N'2020-06-19T18:32:04.983' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (34, N'trang 18-DEMON OF RESPECT AND AFFECTION', 18, N'18.jpg', 1, 7, 1, CAST(N'2020-06-19T18:32:04.987' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (35, N'trang 19-DEMON OF RESPECT AND AFFECTION', 19, N'19.jpg', 1, 7, 1, CAST(N'2020-06-19T18:32:04.990' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (36, N'trang 20-DEMON OF RESPECT AND AFFECTION', 20, N'20.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.757' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (37, N'trang 21-DEMON OF RESPECT AND AFFECTION', 21, N'21.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.767' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (38, N'trang 22-DEMON OF RESPECT AND AFFECTION', 22, N'22.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.770' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (39, N'trang 23-DEMON OF RESPECT AND AFFECTION', 23, N'23.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.773' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (40, N'trang 24-DEMON OF RESPECT AND AFFECTION', 24, N'24.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.777' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (41, N'trang 25-DEMON OF RESPECT AND AFFECTION', 25, N'25.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.780' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (42, N'trang 26-DEMON OF RESPECT AND AFFECTION', 26, N'26.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.783' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (43, N'trang 27-DEMON OF RESPECT AND AFFECTION', 27, N'27.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.787' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (44, N'trang 28-DEMON OF RESPECT AND AFFECTION', 28, N'28.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.790' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (45, N'trang 29-DEMON OF RESPECT AND AFFECTION', 29, N'29.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.797' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (46, N'trang 30-DEMON OF RESPECT AND AFFECTION', 30, N'30.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.803' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (47, N'trang 31-DEMON OF RESPECT AND AFFECTION', 31, N'31.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.810' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (48, N'trang 32-DEMON OF RESPECT AND AFFECTION', 32, N'32.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.813' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (49, N'trang 33-DEMON OF RESPECT AND AFFECTION', 33, N'33.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.817' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (50, N'trang 34-DEMON OF RESPECT AND AFFECTION', 34, N'34.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.823' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (51, N'trang 35-DEMON OF RESPECT AND AFFECTION', 35, N'35.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.827' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (52, N'trang 36-DEMON OF RESPECT AND AFFECTION', 36, N'36.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.830' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (53, N'trang 37-DEMON OF RESPECT AND AFFECTION', 37, N'37.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.837' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (54, N'trang 38-DEMON OF RESPECT AND AFFECTION', 38, N'38.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.840' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (55, N'trang 39-DEMON OF RESPECT AND AFFECTION', 39, N'39.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.847' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (56, N'trang 40-DEMON OF RESPECT AND AFFECTION', 40, N'40.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.850' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (57, N'trang 41-DEMON OF RESPECT AND AFFECTION', 41, N'41.jpg', 1, 7, 1, CAST(N'2020-06-19T18:37:16.857' AS DateTime), 1, 0, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (58, N'trang 2-DEMON OF RESPECT AND AFFECTION-Clear-text-', 2, N'trang 2-DEMON OF RESPECT AND AFFECTION-Clear-text.png', 1, 7, 2, CAST(N'2020-06-19T18:41:16.463' AS DateTime), 1, 18, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (59, N'trang 3-DEMON OF RESPECT AND AFFECTION-Clear-text-', 3, N'trang 3-DEMON OF RESPECT AND AFFECTION-Clear-text.png', 1, 7, 2, CAST(N'2020-06-19T18:47:33.960' AS DateTime), 1, 19, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (60, N'trang 4-DEMON OF RESPECT AND AFFECTION-Clear-text-', 4, N'trang 4-DEMON OF RESPECT AND AFFECTION-Clear-text.png', 1, 7, 2, CAST(N'2020-06-19T18:47:40.270' AS DateTime), 1, 20, 2)
INSERT [dbo].[Page] ([PageId], [FullName], [OrderNumber], [PageLink], [Active], [ChapterId], [CategoryId], [CreateAt], [AccountId], [PageId_Fa], [Status]) VALUES (61, N'trang 5-DEMON OF RESPECT AND AFFECTION-Clear-text-', 5, N'trang 5-DEMON OF RESPECT AND AFFECTION-Clear-text.png', 1, 7, 2, CAST(N'2020-06-19T18:47:52.423' AS DateTime), 1, 21, 2)
SET IDENTITY_INSERT [dbo].[Page] OFF
GO
SET IDENTITY_INSERT [dbo].[Point] ON 

INSERT [dbo].[Point] ([PointId], [Code], [FullName], [PointNumber], [Active]) VALUES (1, N'DT', N'Điểm dịch truyện', 1, 1)
INSERT [dbo].[Point] ([PointId], [Code], [FullName], [PointNumber], [Active]) VALUES (2, N'QLBD', N'Điểm quản lý bản dịch', 1.2, 1)
INSERT [dbo].[Point] ([PointId], [Code], [FullName], [PointNumber], [Active]) VALUES (3, N'QLT', N'Điểm quản lý truyện', 1.5, 1)
INSERT [dbo].[Point] ([PointId], [Code], [FullName], [PointNumber], [Active]) VALUES (4, N'UPClear', N'Điểm upload bản Clear-text', 1, 1)
INSERT [dbo].[Point] ([PointId], [Code], [FullName], [PointNumber], [Active]) VALUES (5, N'ADT', N'Điểm cộng dịch truyện', 1, 1)
INSERT [dbo].[Point] ([PointId], [Code], [FullName], [PointNumber], [Active]) VALUES (6, N'AUPRAW', N'Điểm cộng upload raw', 1, 1)
SET IDENTITY_INSERT [dbo].[Point] OFF
GO
SET IDENTITY_INSERT [dbo].[PointHistory] ON 

INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (43, CAST(N'2020-06-19T19:46:12.253' AS DateTime), 1, 144, 156, 195, 134, 1, 10, 130)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (44, CAST(N'2020-06-19T19:46:12.253' AS DateTime), 1, 0, 0, 0, 0, 1, 11, 0)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (45, CAST(N'2020-06-19T19:46:12.253' AS DateTime), 2, 130, 156, 0, 0, 1, 10, 130)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (46, CAST(N'2020-06-19T19:46:12.253' AS DateTime), 2, 0, 0, 0, 0, 1, 11, 0)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (47, CAST(N'2020-06-19T19:46:12.253' AS DateTime), 3, 0, 0, 0, 131, 1, 10, 130)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (48, CAST(N'2020-06-19T19:46:12.253' AS DateTime), 3, 0, 0, 0, 0, 1, 11, 0)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (49, CAST(N'2020-06-19T19:46:12.253' AS DateTime), 4, 0, 0, 0, 130, 1, 10, 130)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (50, CAST(N'2020-06-19T19:46:12.253' AS DateTime), 4, 0, 0, 0, 0, 1, 11, 0)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (51, CAST(N'2020-06-19T19:46:12.253' AS DateTime), 5, 0, 0, 0, 0, 1, 10, 130)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (52, CAST(N'2020-06-19T19:46:12.253' AS DateTime), 5, 0, 0, 0, 0, 1, 11, 0)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (53, CAST(N'2020-06-19T19:46:12.253' AS DateTime), 7, 0, 0, 0, 0, 1, 10, 130)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (54, CAST(N'2020-06-19T19:46:12.253' AS DateTime), 7, 0, 0, 0, 0, 1, 11, 0)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (55, CAST(N'2020-06-19T19:46:12.253' AS DateTime), 1007, 130, 0, 0, 0, 1, 10, 130)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (56, CAST(N'2020-06-19T19:46:12.253' AS DateTime), 1007, 0, 0, 0, 0, 1, 11, 0)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (57, CAST(N'2020-06-19T19:50:16.867' AS DateTime), 1, 146, 158.4, 198, 136, 1, 10, 2)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (58, CAST(N'2020-06-19T19:50:16.867' AS DateTime), 1, 0, 0, 0, 0, 1, 11, 0)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (59, CAST(N'2020-06-19T19:50:16.867' AS DateTime), 2, 132, 158.4, 0, 0, 1, 10, 2)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (60, CAST(N'2020-06-19T19:50:16.867' AS DateTime), 2, 0, 0, 0, 0, 1, 11, 0)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (61, CAST(N'2020-06-19T19:50:16.867' AS DateTime), 3, 0, 0, 0, 133, 1, 10, 2)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (62, CAST(N'2020-06-19T19:50:16.867' AS DateTime), 3, 0, 0, 0, 0, 1, 11, 0)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (63, CAST(N'2020-06-19T19:50:16.867' AS DateTime), 4, 0, 0, 0, 132, 1, 10, 2)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (64, CAST(N'2020-06-19T19:50:16.867' AS DateTime), 4, 0, 0, 0, 0, 1, 11, 0)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (65, CAST(N'2020-06-19T19:50:16.867' AS DateTime), 5, 0, 0, 0, 0, 1, 10, 2)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (66, CAST(N'2020-06-19T19:50:16.867' AS DateTime), 5, 0, 0, 0, 0, 1, 11, 0)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (67, CAST(N'2020-06-19T19:50:16.867' AS DateTime), 7, 0, 0, 0, 0, 1, 10, 2)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (68, CAST(N'2020-06-19T19:50:16.867' AS DateTime), 7, 0, 0, 0, 0, 1, 11, 0)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (69, CAST(N'2020-06-19T19:50:16.867' AS DateTime), 1007, 132, 0, 0, 0, 1, 10, 2)
INSERT [dbo].[PointHistory] ([HistoryId], [ToDay], [AccountId], [DTPoint], [QLBDPoint], [QLTPoint], [UPCLEARPoint], [Active], [MangaId], [Views]) VALUES (70, CAST(N'2020-06-19T19:50:16.867' AS DateTime), 1007, 0, 0, 0, 0, 1, 11, 0)
SET IDENTITY_INSERT [dbo].[PointHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [FullName], [Active], [Code]) VALUES (1, N'Creator', 1, N'CM        ')
INSERT [dbo].[Role] ([RoleId], [FullName], [Active], [Code]) VALUES (2, N'Clear-text Uploader', 1, N'UC        ')
INSERT [dbo].[Role] ([RoleId], [FullName], [Active], [Code]) VALUES (3, N'Translator', 1, N'TR        ')
INSERT [dbo].[Role] ([RoleId], [FullName], [Active], [Code]) VALUES (4, N'Translate Manager', 1, N'TM        ')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusId], [FullName], [Active], [Alias]) VALUES (1, N'Chưa hoàn thành', 1, N'Ongoing')
INSERT [dbo].[Status] ([StatusId], [FullName], [Active], [Alias]) VALUES (2, N'Đã hoàn thành', 1, N'Completed')
INSERT [dbo].[Status] ([StatusId], [FullName], [Active], [Alias]) VALUES (3, N'Tạm ngưng', 1, N'Drop')
INSERT [dbo].[Status] ([StatusId], [FullName], [Active], [Alias]) VALUES (4, N'Đã bị cancel', 0, N'Cancel')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Text] ON 

INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [Active], [Allow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (1, N'test1', N'#7979e3   ', NULL, 1, 1, 0, 1, 2, 8, 1, 30, 1)
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [Active], [Allow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (2, N'test2', N'#000000   ', NULL, 0, 1, 0, 1, 2, 9, 1, 50, 1)
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [Active], [Allow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (3, N'test2', N'#000000   ', NULL, 0, 1, 0, 1, 2, 10, 1, 50, 1)
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [Active], [Allow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (4, N'Rimuru -sama...', N'#000000   ', NULL, 0, 1, 1, 1, 1, 8, 1, 14, 1)
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [Active], [Allow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (5, N'asdad', N'#000000   ', NULL, 0, 1, 1, 1, 1, 9, 1, 16, 0)
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [Active], [Allow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (6, N'sadad', N'#000000   ', NULL, 0, 1, 1, 1, 1, 10, 1, 16, 0)
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [Active], [Allow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (7, N'với chúng ta, mọi thứ sẽ ổn miễn là con rimuru-sama bên cạnh', N'#0d0d0d   ', NULL, 0, 1, 1, 1, 1, 11, 1, 18, 0)
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [Active], [Allow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (8, N'nhưng với rimuru-sama,', N'#0d0d0d   ', NULL, 0, 1, 1, 1, 1, 12, 1, 18, 0)
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [Active], [Allow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (9, N'dù chỉ một người mất đi cũng khiến người phát điên.', N'#0d0d0d   ', NULL, 0, 1, 1, 1, 1, 13, 1, 18, 0)
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [Active], [Allow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (10, N'... vì cô cứ ngủ mãi đấy.', N'#000000   ', NULL, 0, 1, 1, 1, 1, 14, 1, 18, 0)
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [Active], [Allow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (11, N'tỉnh dậy đi thôi, Shion...', N'#000000   ', NULL, 0, 1, 1, 1, 1, 15, 1, 18, 0)
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [Active], [Allow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (12, N'Ah, không.', N'#000000   ', NULL, 0, 1, 1, 1, 1, 16, 1, 18, 0)
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [Active], [Allow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (13, N'Lễ hội thu hoạch sẽ bắt đầu ngay bây giờ.', N'#000000   ', NULL, 0, 1, 1, 1, 1, 17, 1, 15, 0)
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [Active], [Allow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (14, N'Đã đạt đủ số lượng linh hồn cần thiết', N'#000000   ', NULL, 0, 1, 1, 1, 1, 18, 1, 16, 0)
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [Active], [Allow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (15, N'mình đã để các đầu lãnh sẵn sàng, trở về thôi...', N'#000000   ', NULL, 0, 1, 1, 1, 1, 19, 1, 16, 0)
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [Active], [Allow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (16, N'chắc cú rằng mình sẽ không ngủ ở cái nơi đầy xác chết này đâu', N'#000000   ', NULL, 0, 1, 1, 1, 1, 20, 1, 16, 0)
INSERT [dbo].[Text] ([TextId], [TextContent], [ColorText], [ColorOutline], [Bold], [Active], [Allow], [TranslationId], [AccountId], [TextBoxId], [FontId], [FontSize], [Italic]) VALUES (17, N'chế độ ngủ chẳng là gì so với này cả.', N'#000000   ', NULL, 0, 1, 1, 1, 1, 21, 1, 16, 0)
SET IDENTITY_INSERT [dbo].[Text] OFF
GO
SET IDENTITY_INSERT [dbo].[TextBox] ON 

INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (8, N'80,1171', 51, 65, 14, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (9, N'437.1063829787234,138.89361702127658', 163, 105, 14, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (10, N'705.3617021276596,137.53191489361703', 106, 113, 14, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (11, N'744.8510638297872,186.5531914893617', 128, 191, 18, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (12, N'634.5531914893617,313.1914893617021', 99, 93, 18, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (13, N'107.57446808510637,371.74468085106383', 135, 244, 18, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (14, N'631.1248226950355,162.2113475177305', 97, 134, 19, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (15, N'122.68085106382979,902.3858156028369', 128, 164, 19, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (16, N'128,208.3404255319149', 61, 64, 20, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (17, N'364.93617021276594,179.74468085106383', 131, 123, 20, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (18, N'717.6170212765958,249.1914893617021', 131, 191, 20, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (19, N'108.93617021276596,1006.2978723404256', 114, 218, 20, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (20, N'623.6595744680851,1024', 110, 197, 20, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (21, N'740.7659574468084,980.4255319148936', 114, 157, 20, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (22, N'76.25531914893617,149.7872340425532', 117, 267, 21, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (23, N'456.17021276595744,175.6595744680851', 67, 69, 21, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (24, N'720.3404255319149,156.59574468085106', 120, 153, 21, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (25, N'140.25531914893617,702.6382978723404', 91, 129, 21, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (26, N'235.5744680851064,656.3404255319149', 121, 154, 21, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (27, N'646.8085106382979,693.1063829787233', 106, 123, 21, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (28, N'755.7446808510638,648.1702127659574', 106, 143, 21, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (29, N'164.7659574468085,1041.7021276595744', 97, 133, 21, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (30, N'170.2127659574468,1180.595744680851', 89, 67, 21, 1, 0)
INSERT [dbo].[TextBox] ([TextBoxId], [Coordinate], [Witdh], [Height], [PageId], [Active], [Degree]) VALUES (31, N'674.0425531914893,1058.0425531914893', 132, 159, 21, 1, 0)
SET IDENTITY_INSERT [dbo].[TextBox] OFF
GO
SET IDENTITY_INSERT [dbo].[Translation] ON 

INSERT [dbo].[Translation] ([TransationId], [MangaId], [AccountId], [LanguageId], [Active], [Status]) VALUES (1, 10, 1, 1, 1, 2)
INSERT [dbo].[Translation] ([TransationId], [MangaId], [AccountId], [LanguageId], [Active], [Status]) VALUES (2, 11, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Translation] OFF
GO
INSERT [dbo].[Translation_Detail] ([ChapterId], [TranslationId], [Active], [UpdateAt], [CreateAt]) VALUES (7, 1, 1, CAST(N'2020-05-03T19:33:03.077' AS DateTime), CAST(N'2020-05-03T19:33:03.410' AS DateTime))
GO
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
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_Account]
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
ALTER TABLE [dbo].[PointHistory]  WITH CHECK ADD  CONSTRAINT [FK_PointHistory_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[PointHistory] CHECK CONSTRAINT [FK_PointHistory_Account]
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
/****** Object:  StoredProcedure [dbo].[Account_CheckUserName]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Account_GetAccountIdbyUserName]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Account_GetAccountInfobyId]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Account_GetProfileByUserName]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Account_Login]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Account_Register]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Account_Search]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountImg]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountInfo]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountNote]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountPassWord]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Account_UpdateAccountStatus]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Chapter_AddNewChapter]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Chapter_GetFirstChapter]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Language_GetList]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Manga_CheckNameManga]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Manga_GetListJoined]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Manga_GetListManga]    Script Date: 6/23/2020 11:04:27 AM ******/
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
	select Manga_Detail.MangaId,CoverLink,Manga.FullName,Author,Status.FullName as status,Manga.Description,Manga.CreateAt
	from Manga_Detail
	Join Role on Manga_Detail.RoleId = Role.RoleId
	join Manga on Manga_Detail.MangaId = Manga.MangaId
	join dbo.Status on Manga.StatusId = Status.StatusId
	where Manga_Detail.AccountId = @AccountId and Role.RoleId = @RoleId and Manga_Detail.Status = 2
END










GO
/****** Object:  StoredProcedure [dbo].[Manga_GetListNewManga]    Script Date: 6/23/2020 11:04:27 AM ******/
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
SELECT  C2.FullName,C2.MangaId,C2.CoverLink,C2.Author,C2.Description,Account.AccountId,C2.CreateAt ,Account.UserName,
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
/****** Object:  StoredProcedure [dbo].[Manga_GetMangaInfo]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Manga_GetMangaInfoById]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Manga_Search]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Manga_UpdateInfoManga]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MangaDetail_AddNewRole]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MangaDetail_ChangeStatus]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MangaDetail_CheckJoin]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MangaDetail_CheckOldPassWord]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MangaDetail_GetAccountCreateManga]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MangaDetail_GetInfo]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MangaDetail_GetMangaJoin]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MangaDetail_GetPeopleJoinmanga]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MangaGenre_GetListGenreId]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[MangaGenre_UpdateStatus]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Page_GetFirstPage]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Role_GetRoleInfoById]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SqlQueryNotificationStoredProcedure-9dbca8f0-7ac8-4fcc-af06-71674dc93a5f]    Script Date: 6/23/2020 11:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SqlQueryNotificationStoredProcedure-9dbca8f0-7ac8-4fcc-af06-71674dc93a5f] AS BEGIN BEGIN TRANSACTION; RECEIVE TOP(0) conversation_handle FROM [SqlQueryNotificationService-9dbca8f0-7ac8-4fcc-af06-71674dc93a5f]; IF (SELECT COUNT(*) FROM [SqlQueryNotificationService-9dbca8f0-7ac8-4fcc-af06-71674dc93a5f] WHERE message_type_name = 'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer') > 0 BEGIN if ((SELECT COUNT(*) FROM sys.services WHERE name = 'SqlQueryNotificationService-9dbca8f0-7ac8-4fcc-af06-71674dc93a5f') > 0)   DROP SERVICE [SqlQueryNotificationService-9dbca8f0-7ac8-4fcc-af06-71674dc93a5f]; if (OBJECT_ID('SqlQueryNotificationService-9dbca8f0-7ac8-4fcc-af06-71674dc93a5f', 'SQ') IS NOT NULL)   DROP QUEUE [SqlQueryNotificationService-9dbca8f0-7ac8-4fcc-af06-71674dc93a5f]; DROP PROCEDURE [SqlQueryNotificationStoredProcedure-9dbca8f0-7ac8-4fcc-af06-71674dc93a5f]; END COMMIT TRANSACTION; END
GO
/****** Object:  StoredProcedure [dbo].[SqlQueryNotificationStoredProcedure-b626e18a-f398-4659-acaf-1967e08dfdff]    Script Date: 6/23/2020 11:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SqlQueryNotificationStoredProcedure-b626e18a-f398-4659-acaf-1967e08dfdff] AS BEGIN BEGIN TRANSACTION; RECEIVE TOP(0) conversation_handle FROM [SqlQueryNotificationService-b626e18a-f398-4659-acaf-1967e08dfdff]; IF (SELECT COUNT(*) FROM [SqlQueryNotificationService-b626e18a-f398-4659-acaf-1967e08dfdff] WHERE message_type_name = 'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer') > 0 BEGIN if ((SELECT COUNT(*) FROM sys.services WHERE name = 'SqlQueryNotificationService-b626e18a-f398-4659-acaf-1967e08dfdff') > 0)   DROP SERVICE [SqlQueryNotificationService-b626e18a-f398-4659-acaf-1967e08dfdff]; if (OBJECT_ID('SqlQueryNotificationService-b626e18a-f398-4659-acaf-1967e08dfdff', 'SQ') IS NOT NULL)   DROP QUEUE [SqlQueryNotificationService-b626e18a-f398-4659-acaf-1967e08dfdff]; DROP PROCEDURE [SqlQueryNotificationStoredProcedure-b626e18a-f398-4659-acaf-1967e08dfdff]; END COMMIT TRANSACTION; END
GO
/****** Object:  StoredProcedure [dbo].[Translation_AddnewTranslation]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Translation_CheckExist]    Script Date: 6/23/2020 11:04:27 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Translation_UpdateInfo]    Script Date: 6/23/2020 11:04:27 AM ******/
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
