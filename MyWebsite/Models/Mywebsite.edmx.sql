
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/30/2019 14:33:20
-- Generated from EDMX file: E:\Giữ lại\DACN_BaoCao\MyWebsite\Models\Mywebsite.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MyWebsite];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Account_Detail_Account]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Account_Detail] DROP CONSTRAINT [FK_Account_Detail_Account];
GO
IF OBJECT_ID(N'[dbo].[FK_Account_Detail_Point]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Account_Detail] DROP CONSTRAINT [FK_Account_Detail_Point];
GO
IF OBJECT_ID(N'[MyWebsiteModelStoreContainer].[FK_Bookmark_Account]', 'F') IS NOT NULL
    ALTER TABLE [MyWebsiteModelStoreContainer].[Bookmark] DROP CONSTRAINT [FK_Bookmark_Account];
GO
IF OBJECT_ID(N'[MyWebsiteModelStoreContainer].[FK_Bookmark_Manga]', 'F') IS NOT NULL
    ALTER TABLE [MyWebsiteModelStoreContainer].[Bookmark] DROP CONSTRAINT [FK_Bookmark_Manga];
GO
IF OBJECT_ID(N'[dbo].[FK_Chapter_Manga]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Chapter] DROP CONSTRAINT [FK_Chapter_Manga];
GO
IF OBJECT_ID(N'[dbo].[FK_Manga_Detail_Account]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Manga_Detail] DROP CONSTRAINT [FK_Manga_Detail_Account];
GO
IF OBJECT_ID(N'[dbo].[FK_Manga_Detail_Manga1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Manga_Detail] DROP CONSTRAINT [FK_Manga_Detail_Manga1];
GO
IF OBJECT_ID(N'[dbo].[FK_Manga_Detail_Role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Manga_Detail] DROP CONSTRAINT [FK_Manga_Detail_Role];
GO
IF OBJECT_ID(N'[dbo].[FK_Manga_Genres_Genre]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Manga_Genres] DROP CONSTRAINT [FK_Manga_Genres_Genre];
GO
IF OBJECT_ID(N'[dbo].[FK_Manga_Genres_Manga]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Manga_Genres] DROP CONSTRAINT [FK_Manga_Genres_Manga];
GO
IF OBJECT_ID(N'[dbo].[FK_Manga_Status]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Manga] DROP CONSTRAINT [FK_Manga_Status];
GO
IF OBJECT_ID(N'[dbo].[FK_Notification_Account]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Notification] DROP CONSTRAINT [FK_Notification_Account];
GO
IF OBJECT_ID(N'[dbo].[FK_Notification_NotifyType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Notification] DROP CONSTRAINT [FK_Notification_NotifyType];
GO
IF OBJECT_ID(N'[dbo].[FK_Page_Account]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Page] DROP CONSTRAINT [FK_Page_Account];
GO
IF OBJECT_ID(N'[dbo].[FK_Page_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Page] DROP CONSTRAINT [FK_Page_Category];
GO
IF OBJECT_ID(N'[dbo].[FK_Page_Chapter]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Page] DROP CONSTRAINT [FK_Page_Chapter];
GO
IF OBJECT_ID(N'[dbo].[FK_Text_Account]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Text] DROP CONSTRAINT [FK_Text_Account];
GO
IF OBJECT_ID(N'[dbo].[FK_Text_Font]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Text] DROP CONSTRAINT [FK_Text_Font];
GO
IF OBJECT_ID(N'[dbo].[FK_Text_TextBox1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Text] DROP CONSTRAINT [FK_Text_TextBox1];
GO
IF OBJECT_ID(N'[dbo].[FK_Text_Translation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Text] DROP CONSTRAINT [FK_Text_Translation];
GO
IF OBJECT_ID(N'[dbo].[FK_TextBox_Page]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TextBox] DROP CONSTRAINT [FK_TextBox_Page];
GO
IF OBJECT_ID(N'[dbo].[FK_Translation_Account]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Translation] DROP CONSTRAINT [FK_Translation_Account];
GO
IF OBJECT_ID(N'[dbo].[FK_Translation_Detail_Chapter]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Translation_Detail] DROP CONSTRAINT [FK_Translation_Detail_Chapter];
GO
IF OBJECT_ID(N'[dbo].[FK_Translation_Detail_Manga]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Translation_Detail] DROP CONSTRAINT [FK_Translation_Detail_Manga];
GO
IF OBJECT_ID(N'[dbo].[FK_Translation_Detail_Translation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Translation_Detail] DROP CONSTRAINT [FK_Translation_Detail_Translation];
GO
IF OBJECT_ID(N'[dbo].[FK_Translation_Language]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Translation] DROP CONSTRAINT [FK_Translation_Language];
GO
IF OBJECT_ID(N'[dbo].[FK_Translation_Manga]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Translation] DROP CONSTRAINT [FK_Translation_Manga];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Account]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Account];
GO
IF OBJECT_ID(N'[dbo].[Account_Detail]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Account_Detail];
GO
IF OBJECT_ID(N'[dbo].[Category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Category];
GO
IF OBJECT_ID(N'[dbo].[Chapter]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Chapter];
GO
IF OBJECT_ID(N'[dbo].[Font]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Font];
GO
IF OBJECT_ID(N'[dbo].[Genre]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Genre];
GO
IF OBJECT_ID(N'[dbo].[Language]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Language];
GO
IF OBJECT_ID(N'[dbo].[Manga]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Manga];
GO
IF OBJECT_ID(N'[dbo].[Manga_Detail]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Manga_Detail];
GO
IF OBJECT_ID(N'[dbo].[Manga_Genres]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Manga_Genres];
GO
IF OBJECT_ID(N'[dbo].[Notification]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Notification];
GO
IF OBJECT_ID(N'[dbo].[NotifyType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NotifyType];
GO
IF OBJECT_ID(N'[dbo].[Page]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Page];
GO
IF OBJECT_ID(N'[dbo].[Point]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Point];
GO
IF OBJECT_ID(N'[dbo].[Role]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Role];
GO
IF OBJECT_ID(N'[dbo].[Status]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Status];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[Text]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Text];
GO
IF OBJECT_ID(N'[dbo].[TextBox]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TextBox];
GO
IF OBJECT_ID(N'[dbo].[Translation]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Translation];
GO
IF OBJECT_ID(N'[dbo].[Translation_Detail]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Translation_Detail];
GO
IF OBJECT_ID(N'[MyWebsiteModelStoreContainer].[Bookmark]', 'U') IS NOT NULL
    DROP TABLE [MyWebsiteModelStoreContainer].[Bookmark];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Accounts'
CREATE TABLE [dbo].[Accounts] (
    [AccountId] int IDENTITY(1,1) NOT NULL,
    [FullName] nvarchar(50)  NULL,
    [Email] nvarchar(50)  NULL,
    [PhoneNumber] nvarchar(50)  NULL,
    [AvatarLink] nvarchar(50)  NULL,
    [StatusActive] int  NULL,
    [UserName] nvarchar(50)  NULL,
    [PassWord] nvarchar(50)  NULL,
    [ResetPasswordCode] nvarchar(100)  NULL
);
GO

-- Creating table 'Account_Detail'
CREATE TABLE [dbo].[Account_Detail] (
    [AccountId] int  NOT NULL,
    [PointId] int  NOT NULL,
    [Total] float  NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [CategoryId] int IDENTITY(1,1) NOT NULL,
    [FullName] nvarchar(50)  NULL,
    [StatusActive] int  NULL
);
GO

-- Creating table 'Chapters'
CREATE TABLE [dbo].[Chapters] (
    [ChapterId] int IDENTITY(1,1) NOT NULL,
    [FullName] nvarchar(max)  NULL,
    [OrderNumber] int  NULL,
    [ViewNumber] int  NULL,
    [CreateAt] datetime  NULL,
    [StatusActive] int  NULL,
    [MangaId] int  NULL,
    [Alias] nvarchar(max)  NULL
);
GO

-- Creating table 'Fonts'
CREATE TABLE [dbo].[Fonts] (
    [FontId] int IDENTITY(1,1) NOT NULL,
    [FullName] nvarchar(50)  NULL,
    [FontLink] nvarchar(200)  NULL,
    [Description] nvarchar(50)  NULL,
    [StatusActive] int  NULL,
    [Type] nvarchar(100)  NULL
);
GO

-- Creating table 'Genres'
CREATE TABLE [dbo].[Genres] (
    [GenreId] int IDENTITY(1,1) NOT NULL,
    [FullName] nvarchar(50)  NULL,
    [Id] nvarchar(50)  NULL,
    [Description] nvarchar(max)  NULL,
    [Alias] nvarchar(50)  NULL,
    [StatusActive] int  NULL
);
GO

-- Creating table 'Languages'
CREATE TABLE [dbo].[Languages] (
    [LanguageId] int IDENTITY(1,1) NOT NULL,
    [FullName] nvarchar(50)  NULL,
    [Note] nvarchar(50)  NULL,
    [StatusActive] int  NULL,
    [Id] nvarchar(50)  NULL
);
GO

-- Creating table 'Mangas'
CREATE TABLE [dbo].[Mangas] (
    [MangaId] int IDENTITY(1,1) NOT NULL,
    [CoverLink] nvarchar(50)  NULL,
    [FullName] nvarchar(max)  NULL,
    [Description] nvarchar(max)  NULL,
    [CreateAt] datetime  NULL,
    [Author] nvarchar(50)  NULL,
    [StatusActive] int  NULL,
    [Alias] nvarchar(max)  NULL,
    [StatusId] int  NULL,
    [UpdateAt] datetime  NULL
);
GO

-- Creating table 'Manga_Detail'
CREATE TABLE [dbo].[Manga_Detail] (
    [AccountId] int  NOT NULL,
    [MangaId] int  NOT NULL,
    [RoleId] int  NOT NULL,
    [StatusActive] int  NULL,
    [Type] int  NULL,
    [Language] nvarchar(50)  NULL
);
GO

-- Creating table 'Manga_Genres'
CREATE TABLE [dbo].[Manga_Genres] (
    [MangaId] int  NOT NULL,
    [GenreId] int  NOT NULL,
    [StatusActive] int  NULL
);
GO

-- Creating table 'Pages'
CREATE TABLE [dbo].[Pages] (
    [PageId] int IDENTITY(1,1) NOT NULL,
    [FullName] nvarchar(2000)  NULL,
    [OrderNumber] int  NULL,
    [PageLink] nvarchar(2000)  NULL,
    [StatusActive] int  NULL,
    [ChapterId] int  NULL,
    [CategoryId] int  NULL,
    [CreateAt] datetime  NULL,
    [AccountId] int  NULL,
    [PageId_Fa] int  NULL
);
GO

-- Creating table 'Points'
CREATE TABLE [dbo].[Points] (
    [PointId] int IDENTITY(1,1) NOT NULL,
    [Id] nvarchar(50)  NULL,
    [FullName] nvarchar(50)  NULL,
    [PointNumber] float  NULL,
    [StatusActive] int  NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [RoleId] int IDENTITY(1,1) NOT NULL,
    [FullName] nvarchar(50)  NULL,
    [Id] nchar(10)  NULL,
    [StatusActive] int  NULL
);
GO

-- Creating table 'Status'
CREATE TABLE [dbo].[Status] (
    [StatusId] int IDENTITY(1,1) NOT NULL,
    [FullName] nvarchar(50)  NULL,
    [StatusActive] nvarchar(50)  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'Texts'
CREATE TABLE [dbo].[Texts] (
    [TextId] int IDENTITY(1,1) NOT NULL,
    [TextContent] nvarchar(max)  NULL,
    [ColorText] nchar(10)  NULL,
    [ColorOutline] nchar(10)  NULL,
    [Bold] int  NULL,
    [StatusActive] int  NULL,
    [StatusAllow] int  NULL,
    [TranslationId] int  NULL,
    [AccountId] int  NULL,
    [TextBoxId] int  NULL,
    [FontId] int  NULL,
    [FontSize] int  NULL,
    [Italic] nchar(10)  NULL
);
GO

-- Creating table 'TextBoxes'
CREATE TABLE [dbo].[TextBoxes] (
    [TextBoxId] int IDENTITY(1,1) NOT NULL,
    [Coordinate] nvarchar(50)  NULL,
    [Witdh] int  NULL,
    [Height] int  NULL,
    [PageId] int  NULL,
    [StatusActive] int  NULL,
    [Degree] int  NULL
);
GO

-- Creating table 'Translations'
CREATE TABLE [dbo].[Translations] (
    [TransationId] int IDENTITY(1,1) NOT NULL,
    [MangaId] int  NULL,
    [AccountId] int  NULL,
    [LanguageId] int  NULL,
    [StatusActive] int  NULL
);
GO

-- Creating table 'Translation_Detail'
CREATE TABLE [dbo].[Translation_Detail] (
    [ChapterId] int  NOT NULL,
    [TranslationId] int  NOT NULL,
    [StatusActive] int  NULL,
    [UpdateAt] datetime  NULL,
    [MangaId] int  NULL
);
GO

-- Creating table 'Notifications'
CREATE TABLE [dbo].[Notifications] (
    [NotificationId] int IDENTITY(1,1) NOT NULL,
    [NContent] nvarchar(max)  NULL,
    [CreateAt] datetime  NULL,
    [Status] int  NULL,
    [AccountId] int  NULL,
    [NotifyTypeId] int  NULL,
    [SeenStatus] int  NULL
);
GO

-- Creating table 'NotifyTypes'
CREATE TABLE [dbo].[NotifyTypes] (
    [NotifyTypeId] int IDENTITY(1,1) NOT NULL,
    [FullName] nvarchar(max)  NULL,
    [StatusActive] int  NULL,
    [NTContent] nvarchar(max)  NULL
);
GO

-- Creating table 'Bookmark'
CREATE TABLE [dbo].[Bookmark] (
    [Accounts_AccountId] int  NOT NULL,
    [Mangas_MangaId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AccountId] in table 'Accounts'
ALTER TABLE [dbo].[Accounts]
ADD CONSTRAINT [PK_Accounts]
    PRIMARY KEY CLUSTERED ([AccountId] ASC);
GO

-- Creating primary key on [AccountId], [PointId] in table 'Account_Detail'
ALTER TABLE [dbo].[Account_Detail]
ADD CONSTRAINT [PK_Account_Detail]
    PRIMARY KEY CLUSTERED ([AccountId], [PointId] ASC);
GO

-- Creating primary key on [CategoryId] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([CategoryId] ASC);
GO

-- Creating primary key on [ChapterId] in table 'Chapters'
ALTER TABLE [dbo].[Chapters]
ADD CONSTRAINT [PK_Chapters]
    PRIMARY KEY CLUSTERED ([ChapterId] ASC);
GO

-- Creating primary key on [FontId] in table 'Fonts'
ALTER TABLE [dbo].[Fonts]
ADD CONSTRAINT [PK_Fonts]
    PRIMARY KEY CLUSTERED ([FontId] ASC);
GO

-- Creating primary key on [GenreId] in table 'Genres'
ALTER TABLE [dbo].[Genres]
ADD CONSTRAINT [PK_Genres]
    PRIMARY KEY CLUSTERED ([GenreId] ASC);
GO

-- Creating primary key on [LanguageId] in table 'Languages'
ALTER TABLE [dbo].[Languages]
ADD CONSTRAINT [PK_Languages]
    PRIMARY KEY CLUSTERED ([LanguageId] ASC);
GO

-- Creating primary key on [MangaId] in table 'Mangas'
ALTER TABLE [dbo].[Mangas]
ADD CONSTRAINT [PK_Mangas]
    PRIMARY KEY CLUSTERED ([MangaId] ASC);
GO

-- Creating primary key on [AccountId], [MangaId], [RoleId] in table 'Manga_Detail'
ALTER TABLE [dbo].[Manga_Detail]
ADD CONSTRAINT [PK_Manga_Detail]
    PRIMARY KEY CLUSTERED ([AccountId], [MangaId], [RoleId] ASC);
GO

-- Creating primary key on [MangaId], [GenreId] in table 'Manga_Genres'
ALTER TABLE [dbo].[Manga_Genres]
ADD CONSTRAINT [PK_Manga_Genres]
    PRIMARY KEY CLUSTERED ([MangaId], [GenreId] ASC);
GO

-- Creating primary key on [PageId] in table 'Pages'
ALTER TABLE [dbo].[Pages]
ADD CONSTRAINT [PK_Pages]
    PRIMARY KEY CLUSTERED ([PageId] ASC);
GO

-- Creating primary key on [PointId] in table 'Points'
ALTER TABLE [dbo].[Points]
ADD CONSTRAINT [PK_Points]
    PRIMARY KEY CLUSTERED ([PointId] ASC);
GO

-- Creating primary key on [RoleId] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([RoleId] ASC);
GO

-- Creating primary key on [StatusId] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [PK_Status]
    PRIMARY KEY CLUSTERED ([StatusId] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [TextId] in table 'Texts'
ALTER TABLE [dbo].[Texts]
ADD CONSTRAINT [PK_Texts]
    PRIMARY KEY CLUSTERED ([TextId] ASC);
GO

-- Creating primary key on [TextBoxId] in table 'TextBoxes'
ALTER TABLE [dbo].[TextBoxes]
ADD CONSTRAINT [PK_TextBoxes]
    PRIMARY KEY CLUSTERED ([TextBoxId] ASC);
GO

-- Creating primary key on [TransationId] in table 'Translations'
ALTER TABLE [dbo].[Translations]
ADD CONSTRAINT [PK_Translations]
    PRIMARY KEY CLUSTERED ([TransationId] ASC);
GO

-- Creating primary key on [ChapterId], [TranslationId] in table 'Translation_Detail'
ALTER TABLE [dbo].[Translation_Detail]
ADD CONSTRAINT [PK_Translation_Detail]
    PRIMARY KEY CLUSTERED ([ChapterId], [TranslationId] ASC);
GO

-- Creating primary key on [NotificationId] in table 'Notifications'
ALTER TABLE [dbo].[Notifications]
ADD CONSTRAINT [PK_Notifications]
    PRIMARY KEY CLUSTERED ([NotificationId] ASC);
GO

-- Creating primary key on [NotifyTypeId] in table 'NotifyTypes'
ALTER TABLE [dbo].[NotifyTypes]
ADD CONSTRAINT [PK_NotifyTypes]
    PRIMARY KEY CLUSTERED ([NotifyTypeId] ASC);
GO

-- Creating primary key on [Accounts_AccountId], [Mangas_MangaId] in table 'Bookmark'
ALTER TABLE [dbo].[Bookmark]
ADD CONSTRAINT [PK_Bookmark]
    PRIMARY KEY CLUSTERED ([Accounts_AccountId], [Mangas_MangaId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AccountId] in table 'Account_Detail'
ALTER TABLE [dbo].[Account_Detail]
ADD CONSTRAINT [FK_Account_Detail_Account]
    FOREIGN KEY ([AccountId])
    REFERENCES [dbo].[Accounts]
        ([AccountId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AccountId] in table 'Manga_Detail'
ALTER TABLE [dbo].[Manga_Detail]
ADD CONSTRAINT [FK_Manga_Detail_Account]
    FOREIGN KEY ([AccountId])
    REFERENCES [dbo].[Accounts]
        ([AccountId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AccountId] in table 'Pages'
ALTER TABLE [dbo].[Pages]
ADD CONSTRAINT [FK_Page_Account]
    FOREIGN KEY ([AccountId])
    REFERENCES [dbo].[Accounts]
        ([AccountId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Page_Account'
CREATE INDEX [IX_FK_Page_Account]
ON [dbo].[Pages]
    ([AccountId]);
GO

-- Creating foreign key on [AccountId] in table 'Texts'
ALTER TABLE [dbo].[Texts]
ADD CONSTRAINT [FK_Text_Account]
    FOREIGN KEY ([AccountId])
    REFERENCES [dbo].[Accounts]
        ([AccountId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Text_Account'
CREATE INDEX [IX_FK_Text_Account]
ON [dbo].[Texts]
    ([AccountId]);
GO

-- Creating foreign key on [AccountId] in table 'Translations'
ALTER TABLE [dbo].[Translations]
ADD CONSTRAINT [FK_Translation_Account]
    FOREIGN KEY ([AccountId])
    REFERENCES [dbo].[Accounts]
        ([AccountId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Translation_Account'
CREATE INDEX [IX_FK_Translation_Account]
ON [dbo].[Translations]
    ([AccountId]);
GO

-- Creating foreign key on [PointId] in table 'Account_Detail'
ALTER TABLE [dbo].[Account_Detail]
ADD CONSTRAINT [FK_Account_Detail_Point]
    FOREIGN KEY ([PointId])
    REFERENCES [dbo].[Points]
        ([PointId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Account_Detail_Point'
CREATE INDEX [IX_FK_Account_Detail_Point]
ON [dbo].[Account_Detail]
    ([PointId]);
GO

-- Creating foreign key on [CategoryId] in table 'Pages'
ALTER TABLE [dbo].[Pages]
ADD CONSTRAINT [FK_Page_Category]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[Categories]
        ([CategoryId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Page_Category'
CREATE INDEX [IX_FK_Page_Category]
ON [dbo].[Pages]
    ([CategoryId]);
GO

-- Creating foreign key on [MangaId] in table 'Chapters'
ALTER TABLE [dbo].[Chapters]
ADD CONSTRAINT [FK_Chapter_Manga]
    FOREIGN KEY ([MangaId])
    REFERENCES [dbo].[Mangas]
        ([MangaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Chapter_Manga'
CREATE INDEX [IX_FK_Chapter_Manga]
ON [dbo].[Chapters]
    ([MangaId]);
GO

-- Creating foreign key on [ChapterId] in table 'Pages'
ALTER TABLE [dbo].[Pages]
ADD CONSTRAINT [FK_Page_Chapter]
    FOREIGN KEY ([ChapterId])
    REFERENCES [dbo].[Chapters]
        ([ChapterId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Page_Chapter'
CREATE INDEX [IX_FK_Page_Chapter]
ON [dbo].[Pages]
    ([ChapterId]);
GO

-- Creating foreign key on [ChapterId] in table 'Translation_Detail'
ALTER TABLE [dbo].[Translation_Detail]
ADD CONSTRAINT [FK_Translation_Detail_Chapter]
    FOREIGN KEY ([ChapterId])
    REFERENCES [dbo].[Chapters]
        ([ChapterId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [FontId] in table 'Texts'
ALTER TABLE [dbo].[Texts]
ADD CONSTRAINT [FK_Text_Font]
    FOREIGN KEY ([FontId])
    REFERENCES [dbo].[Fonts]
        ([FontId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Text_Font'
CREATE INDEX [IX_FK_Text_Font]
ON [dbo].[Texts]
    ([FontId]);
GO

-- Creating foreign key on [GenreId] in table 'Manga_Genres'
ALTER TABLE [dbo].[Manga_Genres]
ADD CONSTRAINT [FK_Manga_Genres_Genre]
    FOREIGN KEY ([GenreId])
    REFERENCES [dbo].[Genres]
        ([GenreId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Manga_Genres_Genre'
CREATE INDEX [IX_FK_Manga_Genres_Genre]
ON [dbo].[Manga_Genres]
    ([GenreId]);
GO

-- Creating foreign key on [LanguageId] in table 'Translations'
ALTER TABLE [dbo].[Translations]
ADD CONSTRAINT [FK_Translation_Language]
    FOREIGN KEY ([LanguageId])
    REFERENCES [dbo].[Languages]
        ([LanguageId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Translation_Language'
CREATE INDEX [IX_FK_Translation_Language]
ON [dbo].[Translations]
    ([LanguageId]);
GO

-- Creating foreign key on [MangaId] in table 'Manga_Detail'
ALTER TABLE [dbo].[Manga_Detail]
ADD CONSTRAINT [FK_Manga_Detail_Manga1]
    FOREIGN KEY ([MangaId])
    REFERENCES [dbo].[Mangas]
        ([MangaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Manga_Detail_Manga1'
CREATE INDEX [IX_FK_Manga_Detail_Manga1]
ON [dbo].[Manga_Detail]
    ([MangaId]);
GO

-- Creating foreign key on [MangaId] in table 'Manga_Genres'
ALTER TABLE [dbo].[Manga_Genres]
ADD CONSTRAINT [FK_Manga_Genres_Manga]
    FOREIGN KEY ([MangaId])
    REFERENCES [dbo].[Mangas]
        ([MangaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [StatusId] in table 'Mangas'
ALTER TABLE [dbo].[Mangas]
ADD CONSTRAINT [FK_Manga_Status]
    FOREIGN KEY ([StatusId])
    REFERENCES [dbo].[Status]
        ([StatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Manga_Status'
CREATE INDEX [IX_FK_Manga_Status]
ON [dbo].[Mangas]
    ([StatusId]);
GO

-- Creating foreign key on [MangaId] in table 'Translation_Detail'
ALTER TABLE [dbo].[Translation_Detail]
ADD CONSTRAINT [FK_Translation_Detail_Manga]
    FOREIGN KEY ([MangaId])
    REFERENCES [dbo].[Mangas]
        ([MangaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Translation_Detail_Manga'
CREATE INDEX [IX_FK_Translation_Detail_Manga]
ON [dbo].[Translation_Detail]
    ([MangaId]);
GO

-- Creating foreign key on [MangaId] in table 'Translations'
ALTER TABLE [dbo].[Translations]
ADD CONSTRAINT [FK_Translation_Manga]
    FOREIGN KEY ([MangaId])
    REFERENCES [dbo].[Mangas]
        ([MangaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Translation_Manga'
CREATE INDEX [IX_FK_Translation_Manga]
ON [dbo].[Translations]
    ([MangaId]);
GO

-- Creating foreign key on [RoleId] in table 'Manga_Detail'
ALTER TABLE [dbo].[Manga_Detail]
ADD CONSTRAINT [FK_Manga_Detail_Role]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[Roles]
        ([RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Manga_Detail_Role'
CREATE INDEX [IX_FK_Manga_Detail_Role]
ON [dbo].[Manga_Detail]
    ([RoleId]);
GO

-- Creating foreign key on [PageId] in table 'TextBoxes'
ALTER TABLE [dbo].[TextBoxes]
ADD CONSTRAINT [FK_TextBox_Page]
    FOREIGN KEY ([PageId])
    REFERENCES [dbo].[Pages]
        ([PageId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TextBox_Page'
CREATE INDEX [IX_FK_TextBox_Page]
ON [dbo].[TextBoxes]
    ([PageId]);
GO

-- Creating foreign key on [TextBoxId] in table 'Texts'
ALTER TABLE [dbo].[Texts]
ADD CONSTRAINT [FK_Text_TextBox1]
    FOREIGN KEY ([TextBoxId])
    REFERENCES [dbo].[TextBoxes]
        ([TextBoxId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Text_TextBox1'
CREATE INDEX [IX_FK_Text_TextBox1]
ON [dbo].[Texts]
    ([TextBoxId]);
GO

-- Creating foreign key on [TranslationId] in table 'Texts'
ALTER TABLE [dbo].[Texts]
ADD CONSTRAINT [FK_Text_Translation]
    FOREIGN KEY ([TranslationId])
    REFERENCES [dbo].[Translations]
        ([TransationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Text_Translation'
CREATE INDEX [IX_FK_Text_Translation]
ON [dbo].[Texts]
    ([TranslationId]);
GO

-- Creating foreign key on [TranslationId] in table 'Translation_Detail'
ALTER TABLE [dbo].[Translation_Detail]
ADD CONSTRAINT [FK_Translation_Detail_Translation]
    FOREIGN KEY ([TranslationId])
    REFERENCES [dbo].[Translations]
        ([TransationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Translation_Detail_Translation'
CREATE INDEX [IX_FK_Translation_Detail_Translation]
ON [dbo].[Translation_Detail]
    ([TranslationId]);
GO

-- Creating foreign key on [Accounts_AccountId] in table 'Bookmark'
ALTER TABLE [dbo].[Bookmark]
ADD CONSTRAINT [FK_Bookmark_Account]
    FOREIGN KEY ([Accounts_AccountId])
    REFERENCES [dbo].[Accounts]
        ([AccountId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Mangas_MangaId] in table 'Bookmark'
ALTER TABLE [dbo].[Bookmark]
ADD CONSTRAINT [FK_Bookmark_Manga]
    FOREIGN KEY ([Mangas_MangaId])
    REFERENCES [dbo].[Mangas]
        ([MangaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Bookmark_Manga'
CREATE INDEX [IX_FK_Bookmark_Manga]
ON [dbo].[Bookmark]
    ([Mangas_MangaId]);
GO

-- Creating foreign key on [AccountId] in table 'Notifications'
ALTER TABLE [dbo].[Notifications]
ADD CONSTRAINT [FK_Notification_Account]
    FOREIGN KEY ([AccountId])
    REFERENCES [dbo].[Accounts]
        ([AccountId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Notification_Account'
CREATE INDEX [IX_FK_Notification_Account]
ON [dbo].[Notifications]
    ([AccountId]);
GO

-- Creating foreign key on [NotifyTypeId] in table 'Notifications'
ALTER TABLE [dbo].[Notifications]
ADD CONSTRAINT [FK_Notification_NotifyType]
    FOREIGN KEY ([NotifyTypeId])
    REFERENCES [dbo].[NotifyTypes]
        ([NotifyTypeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Notification_NotifyType'
CREATE INDEX [IX_FK_Notification_NotifyType]
ON [dbo].[Notifications]
    ([NotifyTypeId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------