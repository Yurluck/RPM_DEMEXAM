USE [master]
GO
/****** Object:  Database [PaperCompany]    Script Date: 26.11.2021 15:43:37 ******/
CREATE DATABASE [PaperCompany]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PaperCompany', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PaperCompany.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PaperCompany_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PaperCompany_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PaperCompany] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PaperCompany].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PaperCompany] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PaperCompany] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PaperCompany] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PaperCompany] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PaperCompany] SET ARITHABORT OFF 
GO
ALTER DATABASE [PaperCompany] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PaperCompany] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PaperCompany] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PaperCompany] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PaperCompany] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PaperCompany] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PaperCompany] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PaperCompany] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PaperCompany] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PaperCompany] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PaperCompany] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PaperCompany] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PaperCompany] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PaperCompany] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PaperCompany] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PaperCompany] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PaperCompany] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PaperCompany] SET RECOVERY FULL 
GO
ALTER DATABASE [PaperCompany] SET  MULTI_USER 
GO
ALTER DATABASE [PaperCompany] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PaperCompany] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PaperCompany] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PaperCompany] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PaperCompany] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PaperCompany] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PaperCompany', N'ON'
GO
ALTER DATABASE [PaperCompany] SET QUERY_STORE = OFF
GO
USE [PaperCompany]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 26.11.2021 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 26.11.2021 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 26.11.2021 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 26.11.2021 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 26.11.2021 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 26.11.2021 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 26.11.2021 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 26.11.2021 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistory]    Script Date: 26.11.2021 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 26.11.2021 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 26.11.2021 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 26.11.2021 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 26.11.2021 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 26.11.2021 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (1, N'БухФлотФинансСнаб', 1, N'035823, Смоленская область, город Одинцово, проезд Будапештсткая, 61', N'4591032477', N'290155423', N'Ираклий Максимович Титова', N'88001216681', N'elvira07@sysoeva.org', N'\agents\agent_93.png', 338)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (2, N'ЛифтТомскСофтЦентр', 2, N'280811, Омская область, город Балашиха, пер. Сталина, 15', N'3908099185', N'747184361', N'Виноградоваа Вера Александровна', N'8122671959', N'izolda.vorontov@lytkina.ru', N'\agents\agent_116.png', 76)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (3, N'Транс', 1, N'508299, Кемеровская область, город Кашира, пер. Гагарина, 42', N'9604275878', N'951258069', N'Евсеева Болеслав Сергеевич', N'79224679383', N'email: artem.fadeev@polykov.com', N'\agents\agent_66.png', 38)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (4, N'CибОмскМорЦентр', 3, N'371407, Рязанская область, город Шатура, пл. Чехова, 48', N'3626169571', N'300062579', N'Гавриил Сергеевич Игнатьев', N'88003173579', N'fedotov.platon@pavlov.ru', N'\agents\agent_96.png', 68)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (5, N'ОрионТомскТех', 2, N'738763, Курская область, город Егорьевск, спуск Чехова, 66', N'9351493429', N'583041591', N'Георгий Александрович Лукин', N'79228512323', N'faina.tikonova@veselov.com', N'\agents\agent_58.png', 73)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (6, N'КрепОрионСофтПром', 5, N'351666, Ульяновская область, город Луховицы, въезд Косиора, 07', N'3776671267', N'642177246', N'Алина Борисовна Потаповаа', N'4959312926', N'viktoriy.belozerova@isaev.net', NULL, 38)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (7, N'ПивРадиоВектор', 3, N'330228, Ивановская область, город Ногинск, ул. Славы, 42', N'7447864518', N'211697866', N'Изабелла Борисовна Архиповаа', N'4954456143', N'nazarov.polina@voronova.ru', N'\agents\agent_108.png', 245)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (8, N'БашкирИнфоЭлектро', 1, N'584771, Брянская область, город Раменское, наб. Славы, 53', N'9037040523', N'803529530', N'Дорофеева Зинаида Борисовна', N'88002325637', N'lebedeva.larisa@lavrentev.net', N'\agents\agent_97.png', 289)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (9, N'Компания CибМоторКазань', 3, N'887741, Тульская область, город Пушкино, пр. Чехова, 77', N'6221520857', N'758155852', N'Тетерина Георгий Сергеевич', N'4957135183', N'email: tamara22@pavlova.com', N'\agents\agent_100.png', 136)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (10, N'Компания Газ', 3, N'310403, Кировская область, город Солнечногорск, пл. Балканская, 76', N'2262431140', N'247369527', N'Давид Андреевич Фадеев', N'8128239342', N'email: alina56@zdanov.com', N'\agents\agent_59.png', 445)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (11, N'СантехБашкир', 1, N'180288, Тверская область, город Одинцово, ул. Бухарестская, 37', N'4159215346', N'639267493', N'Виктор Иванович Молчанов', N'88005823919', N'email: nikodim81@kiseleva.com', N'\agents\agent_38.png', 369)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (12, N'ОрионГлав', 2, N'729639, Магаданская область, город Талдом, въезд Будапештсткая, 98', N'9032455179', N'763045792', N'Тимофеева Григорий Андреевич', N'35222961926', N'sermakova@sarova.net', N'\agents\agent_45.png', 482)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (13, N'Мобайл', 4, N'606703, Амурская область, город Чехов, пл. Будапештсткая, 91', N'7803888520', N'885703265', N'Екатерина Сергеевна Бобылёва', N'88005114361', N'email: dsiryev@dementeva.com', N'\agents\agent_46.png', 464)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (14, N'Компания ТомскХоз', 3, N'861543, Томская область, город Истра, бульвар Славы, 42', N'8430391035', N'961540858', N'Лазарева Аркадий Сергеевич', N'4958937117', N'email: nelli11@gureva.ru', N'\agents\agent_54.png', 464)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (15, N'ЛенХозРем', 2, N'946112, Волгоградская область, город Шаховская, пл. Сталина, 98', N'4318970454', N'389962934', N'Носов Михаил Андреевич', N'35222734419', N'email: tdrozdov@ersova.ru', N'\agents\agent_78.png', 3)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (16, N'Строй', 3, N'426305, Калининградская область, город Чехов, пл. Ломоносова, 00', N'7687851800', N'470221602', N'Люся Владимировна Фёдороваа', N'79222332768', N'wsamsonov@martynov.ru', N'\agents\agent_76.png', 258)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (17, N'ЭлектроТранс', 4, N'434616, Калининградская область, город Павловский Посад, пл. Ладыгина, 83', N'6019144874', N'450629885', N'Сава Александрович Титова', N'4956882859', N'boleslav.zukova@nikiforova.com', N'\agents\agent_30.png', 129)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (18, N'Флот', 5, N'505562, Тюменская область, город Наро-Фоминск, пр. Косиора, 11', N'1112170258', N'382584255', N'Василий Андреевич Ковалёв', N'88005384177', N'gerasim.makarov@kornilov.ru', NULL, 473)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (19, N'ОмскЛифтРадио', 5, N'146093, Белгородская область, город Можайск, пл. Ломоносова, 94', N'8325114917', N'356835763', N'Горбунов Назар Сергеевич', N'4954525894', N'email: kanisimov@nikolaev.ru', N'\agents\agent_92.png', 373)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (20, N'ВостокНефть', 3, N'171297, Оренбургская область, город Зарайск, проезд Сталина, 17', N'3532367439', N'788413794', N'Данила Александрович Кириллов', N'79225961453', N'stanislav.zykov@volkova.net', N'\agents\agent_120.png', 49)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (21, N'СервисХмельМонтаж', 5, N'928260, Нижегородская область, город Балашиха, пл. Косиора, 44', N'3459886235', N'356196105', N'Анжелика Дмитриевна Горбунова', N'35222392895', N'galina31@melnikov.ru', N'\agents\agent_31.png', 124)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (22, N'АсбоцементЛифтРеч-H', 2, N'599158, Ростовская область, город Озёры, ул. Космонавтов, 05', N'6567878928', N'560960507', N'Кондратьева Таисия Андреевна', N'4952846937', N'vladlena58@seliverstova.ru', N'\agents\agent_44.png', 407)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (23, N'БухМоторТомск', 4, N'936264, Ростовская область, город Ногинск, проезд Славы, 52', N'5630128011', N'571438707', N'Игорь Львович Щукина', N'8121329375', N'dmitrii05@zukov.ru', N'\agents\agent_95.png', 65)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (24, N'Глав', 5, N'077760, Ленинградская область, город Сергиев Посад, спуск Славы, 05', N'6433380154', N'715096638', N'Герман Иванович Гусева', N'8125248716', N'albert57@burova.ru', NULL, 35)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (25, N'Тяж', 2, N'395435, Мурманская область, город Красногорск, шоссе Косиора, 47', N'3302080044', N'733101773', N'Бронислав Владимирович Ефимов', N'8129767715', N'vladlen06@melnikov.net', N'\agents\agent_106.png', 402)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (26, N'ТелекомГор', 4, N'210024, Белгородская область, город Сергиев Посад, наб. Ломоносова, 43', N'3748947224', N'766431901', N'Ксения Андреевна Михайлова', N'88007527145', N'email: gorskov.larisa@kalinin.com', N'\agents\agent_37.png', 255)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (27, N'ОрионХмельCиб', 4, N'266126, Ленинградская область, город Сергиев Посад, шоссе Чехова, 31', N'9895514594', N'587685742', N'Воробьёва Родион Максимович', N'35222852418', N'pstepanova@siryev.com', N'\agents\agent_105.png', 173)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (28, N'РадиоСевер', 4, N'491360, Московская область, город Одинцово, въезд Ленина, 19', N'5889206249', N'372789083', N'Карпов Иосиф Максимович', N'4953742179', N'email: maiy.belov@rogov.ru', N'\agents\agent_62.png', 431)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (29, N'CибСервисСевер', 3, N'711370, Курская область, город Истра, пр. Будапештсткая, 89', N'1719781819', N'742676221', N'Чернов Геннадий Алексеевич', N'79222487998', N'email: faina02@muraveva.com', N'\agents\agent_74.png', 385)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (30, N'СофтРосБух', 5, N'747695, Амурская область, город Сергиев Посад, въезд Бухарестская, 46', N'8321561226', N'807803984', N'Белова Полина Владимировна', N'79229471199', N'email: ivanova.antonin@rodionov.ru', N'\agents\agent_63.png', 69)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (31, N'Компания СервисТелеМотор', 3, N'625988, Вологодская область, город Озёры, пр. Гоголя, 18', N'3248454160', N'138472695', N'Фролова Эдуард Борисович', N'35222131563', N'veronika.egorov@bespalova.com', N'\agents\agent_41.png', 81)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (32, N'КрепФлот', 4, N'357783, Рязанская область, город Павловский Посад, наб. Домодедовская, 44', N'2795067090', N'967021779', N'Злата Романовна Корнилова', N'88007532768', N'danila.birykov@stepanov.ru', N'\agents\agent_90.png', 349)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (33, N'ГаражФорсаж', 4, N'294596, Мурманская область, город Шаховская, пр. Домодедовская, 88', N'2816939574', N'754741128', N'Клавдия Фёдоровна Кудряшова', N'4952777759', N'lydmila.belyeva@karpov.ru', N'\agents\agent_47.png', 335)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (34, N'ГлавРечФлот', 1, N'116028, Челябинская область, город Балашиха, шоссе Космонавтов, 69', N'5299346323', N'214239563', N'Шубина Валерия Евгеньевна', N'88009334875', N'email: emysnikov@kiselev.net', N'\agents\agent_85.png', 283)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (35, N'МикроБашкирГор', 5, N'437208, Астраханская область, город Озёры, спуск Славы, 45', N'5774378274', N'352728364', N'Нонна Владимировна Горбунова', N'35222418198', N'ybragina@odintov.org', N'\agents\agent_86.png', 427)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (36, N'ХозЮпитер', 4, N'038182, Курганская область, город Москва, спуск Космонавтов, 16', N'6667635058', N'380592865', N'Максимоваа Вера Фёдоровна', N'4951786132', N'email: jisakova@nazarova.com', N'\agents\agent_53.png', 375)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (37, N'Дизайн', 6, N'243999, Орловская область, город Можайск, пер. Домодедовская, 77', N'9646693050', N'201876935', N'Мельниковаа Федосья Борисовна', N'79223496796', N'viktoriy73@kalinina.org', N'\agents\agent_71.png', 330)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (38, N'ЛифтАлмазТех', 4, N'925700, Нижегородская область, город Зарайск, шоссе Гоголя, 35', N'3950510936', N'240396350', N'Воронова Альберт Александрович', N'4958341297', N'donat.gerasimov@rogova.ru', N'\agents\agent_77.png', 497)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (39, N'Вод', 5, N'964386, Оренбургская область, город Чехов, пл. Косиора, 80', N'1296063939', N'447430051', N'Зоя Романовна Селезнёва', N'4958113655', N'email: savva86@zaiteva.ru', N'\agents\agent_68.png', 359)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (40, N'CибГаз', 6, N'365674, Архангельская область, город Серебряные Пруды, пр. Ленина, 29', N'6483417250', N'455013058', N'Вячеслав Романович Третьякова', N'88005677981', N'email: inna.sarova@panfilov.ru', N'\agents\agent_42.png', 488)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (41, N'МеталСервисМор', 2, N'293265, Иркутская область, город Клин, пр. Славы, 12', N'6922817841', N'580142825', N'Коновалова Кирилл Львович', N'88004276143', N'email: xdanilov@titov.ru', N'\agents\agent_23.png', 475)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (42, N'МоторБашкирИнфоЭкспедиция', 2, N'352034, Сахалинская область, город Домодедово, пр. Балканская, 97', N'6542240791', N'928029129', N'Тимофеева Регина Львовна', N'35222869461', N'egorov.zanna@maslova.ru', N'\agents\agent_88.png', 68)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (43, N'Пив', 2, N'306012, Ростовская область, город Талдом, пл. Сталина, 01', N'3936600214', N'873471159', N'Макар Романович Савельев', N'8124659796', N'email: klavdiy50@nazarov.com', N'\agents\agent_118.png', 198)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (44, N'Компания КазМеталКазань', 3, N'532703, Пензенская область, город Чехов, наб. Чехова, 81', N'4598939812', N'303467543', N'Валерий Владимирович Хохлова', N'4956837657', N'mmoiseev@teterin.ru', N'\agents\agent_69.png', 252)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (45, N'Компания Орион', 3, N'661101, Оренбургская область, город Волоколамск, въезд Чехова, 16', N'8698706801', N'251899316', N'Елисееваа Эмилия Андреевна', N'79229163431', N'msorokina@andreeva.ru', N'\agents\agent_70.png', 227)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (46, N'ИнфоАлмазГлав', 5, N'937201, Самарская область, город Воскресенск, въезд Космонавтов, 10', N'8990745795', N'517528851', N'Вишняков Гордей Владимирович', N'79226279625', N'email: valentin23@sitnikov.net', N'\agents\agent_112.png', 133)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (47, N'ТяжРадиоУралПроф', 4, N'521087, Орловская область, город Егорьевск, шоссе Ладыгина, 14', N'5688533246', N'401535045', N'София Алексеевна Мухина', N'79226359719', N'liliy62@grisina.ru', N'\agents\agent_27.png', 278)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (48, N'РемМетиз', 3, N'837800, Псковская область, город Солнечногорск, ул. Сталина, 67', N'2129059967', N'287016575', N'Жанна Евгеньевна Гришинаа', N'4956985686', N'mdavydov@blokin.org', N'\agents\agent_111.png', 296)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (49, N'Гараж', 1, N'585758, Самарская область, город Красногорск, бульвар Балканская, 13', N'2638464552', N'746822723', N'Панфилов Константин Максимович', N'88002976948', N'antonin51@korolev.com', NULL, 107)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (50, N'Компания МикроГлавУралЭкспедиция', 3, N'225511, Новосибирская область, город Можайск, наб. Ладыгина, 82', N'5555957575', N'680301577', N'Зайцева Лада Дмитриевна', N'4954844265', N'nonna23@nesterova.ru', N'\agents\agent_109.png', 387)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (51, N'БашкирРечТомск', 2, N'136886, Амурская область, город Видное, въезд Космонавтов, 39', N'7027724917', N'823811460', N'Назарова Вера Андреевна', N'79224373891', N'aleksandra77@karpov.com', N'\agents\agent_39.png', 84)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (52, N'Орион', 2, N'049104, Новгородская область, город Павловский Посад, бульвар Ладыгина, 58', N'7387259022', N'875652541', N'Клим Сергеевич Аксёнова', N'35222779859', N'email: donat05@sokolova.com', N'\agents\agent_104.png', 412)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (53, N'МетизСтрой', 6, N'254238, Нижегородская область, город Павловский Посад, проезд Балканская, 23', N'4024742936', N'295608432', N'Ева Борисовна Беспалова', N'35222774644', N'kristina.pakomov@burova.ru', N'\agents\agent_33.png', 374)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (54, N'ЦементКрепТех-М', 5, N'263764, Свердловская область, город Раменское, пер. Косиора, 28', N'5359981084', N'680416300', N'Сергеев Владлен Александрович', N'8124139132', N'yna.evdokimov@gordeeva.ru', N'\agents\agent_21.png', 189)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (55, N'РемВод', 4, N'449723, Смоленская область, город Наро-Фоминск, пер. Ломоносова, 94', N'3986603105', N'811373078', N'Медведеваа Ярослава Фёдоровна', N'8127661188', N'komarov.elizaveta@agafonova.ru', N'\agents\agent_65.png', 1)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (56, N'БашкирМотор', 4, N'073468, Читинская область, город Шаховская, наб. Косиора, 99', N'6032171116', N'180861585', N'Денисов Владимир Андреевич', N'8121767777', N'email: kseniy80@rusakov.net', N'\agents\agent_117.png', 91)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (57, N'Компания МоторТелекомЦемент-М', 3, N'021293, Амурская область, город Наро-Фоминск, шоссе Славы, 40', N'7326832482', N'440199498', N'Иван Евгеньевич Белоусова', N'8121318424', N'larisa44@silin.org', N'\agents\agent_57.png', 237)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (58, N'ЦементСантехФинансЛизинг', 4, N'165429, Курганская область, город Озёры, въезд Балканская, 17', N'6290983121', N'136566390', N'Даниил Фёдорович Григорьева', N'79228771228', N'anfisa07@semenova.com', N'\agents\agent_101.png', 70)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (59, N'Компания ВодАлмазIT', 3, N'302100, Нижегородская область, город Мытищи, пер. 1905 года, 63', N'2345297765', N'908449277', N'Гуляев Егор Евгеньевич', N'88005959199', N'email: zakar37@nikolaeva.ru', N'\agents\agent_50.png', 31)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (60, N'Компания БашкирСтрой', 3, N'152450, Брянская область, город Серебряные Пруды, наб. 1905 года, 56', N'1660486169', N'253830866', N'Яна Дмитриевна Моисееваа', N'35222897497', N'bgromov@tretykov.org', N'\agents\agent_80.png', 92)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (61, N'ТелеРечДизайн', 4, N'063695, Новгородская область, город Можайск, шоссе Гагарина, 39', N'6369492130', N'115604622', N'Виктория Романовна Королёваа', N'8127317952', N'email: kazakova.yroslava@silina.net', N'\agents\agent_82.png', 226)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (62, N'ГазГлавПивЛизинг', 4, N'899084, Амурская область, город Талдом, спуск Балканская, 34', N'5309136217', N'170258253', N'Злата Сергеевна Архипова', N'4957443711', N'sysoeva.evgenii@kolesnikova.ru', N'\agents\agent_91.png', 52)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (63, N'Софт', 4, N'453714, Смоленская область, город Одинцово, спуск Косиора, 84', N'3889910123', N'952047511', N'Петухова Прохор Фёдорович', N'35222153592', N'email: jterentev@ersov.com', N'\agents\agent_61.png', 292)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (64, N'Инфо', 4, N'100469, Рязанская область, город Ногинск, шоссе Гагарина, 57', N'6549468639', N'718386757', N'Баранова Виктор Романович', N'35222283328', N'arsenii.mikailova@prokorov.com', N'\agents\agent_28.png', 304)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (65, N'ЭлектроШум', 4, N'975616, Вологодская область, город Клин, пер. Косиора, 57', N'3124748557', N'525403940', N'Игнатьеваа Флорентина Фёдоровна', N'35222285934', N'nataly89@kulakov.ru', N'\agents\agent_103.png', 109)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (66, N'РыбВостокCибСнаб', 5, N'990758, Челябинская область, город Серпухов, въезд Космонавтов, 57', N'2412503891', N'711642010', N'Степанова Фаина Львовна', N'88004868447', N'email: filipp93@polykov.ru', N'\agents\agent_94.png', 496)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (67, N'СервисПивВектор', 2, N'669558, Омская область, город Шаховская, шоссе Гагарина, 55', N'4098988911', N'952390693', N'Олег Евгеньевич Журавлёв', N'8125644665', N'wersov@molcanova.com', N'\agents\agent_87.png', 267)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (68, N'Бух', 2, N'481744, Амурская область, город Щёлково, пл. Сталина, 48', N'2320989197', N'359282667', N'Тарасов Болеслав Александрович', N'35222999242', N'valentina.bolsakova@aksenova.ru', N'\agents\agent_43.png', 327)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (69, N'МеталТекстильЛифтТрест', 6, N'786287, Свердловская область, город Волоколамск, пер. Будапештсткая, 72', N'2971553297', N'821859486', N'Одинцов Назар Борисович', N'88007363673', N'muravev.trofim@sazonov.net', N'\agents\agent_25.png', 425)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (70, N'ВостокЛен', 1, N'546530, Тульская область, город Видное, наб. Гагарина, 63', N'1697025997', N'931878289', N'Лыткинаа Люся Дмитриевна', N'4959717124', N'dmitrii90@zaitev.ru', N'\agents\agent_114.png', 246)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (71, N'АлмазАсбоцементБухКомплекс', 2, N'794964, Мурманская область, город Озёры, ул. 1905 года, 56', N'8996890877', N'349709983', N'Зыков Никита Александрович', N'8127525341', N'email: akoseleva@dementeva.ru', N'\agents\agent_119.png', 39)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (72, N'ТверьМонтажОмск', 2, N'761751, Амурская область, город Балашиха, шоссе Гоголя, 02', N'2421347164', N'157370604', N'Матвей Романович Большакова', N'35222928752', N'dteterina@selezneva.ru', N'\agents\agent_67.png', 272)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (73, N'ТверьХозМорСбыт', 6, N'252101, Ростовская область, город Дорохово, пер. Ленина, 85', N'6681338084', N'460530907', N'Аким Львович Субботина', N'35222729338', N'email: marina58@koroleva.com', N'\agents\agent_56.png', 207)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (74, N'МорТехТелекомСнаб', 4, N'239247, Архангельская область, город Лотошино, бульвар Ломоносова, 28', N'4354676693', N'631235170', N'Беспалова Ева Романовна', N'88003599529', N'garri.rybakov@ermakova.com', N'\agents\agent_98.png', 149)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (75, N'Лифт', 3, N'479565, Курганская область, город Клин, пл. Ленина, 54', N'6169713039', N'848972934', N'Вера Евгеньевна Денисоваа', N'8128875997', N'zinaida01@bespalova.ru', N'\agents\agent_40.png', 92)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (76, N'МясХмельФлот', 6, N'252826, Костромская область, город Солнечногорск, проезд Ленина, 75', N'3019787650', N'974897634', N'Гавриил Львович Зуева', N'88005481153', N'anna48@alekseev.ru', N'\agents\agent_72.png', 372)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (77, N'Компания МобайлЮпитерМобайл', 3, N'697880, Тюменская область, город Егорьевск, проезд Домодедовская, 82', N'3824054933', N'715845254', N'Рожкова Аркадий Владимирович', N'8129413596', N'klara.gavrilov@nosova.com', N'\agents\agent_75.png', 31)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (78, N'Компания Инж', 3, N'475644, Ивановская область, город Луховицы, въезд Будапештсткая, 43', N'6730622378', N'201657751', N'Чернова Инесса Сергеевна', N'88007656746', N'email: osilova@muravev.ru', N'\agents\agent_99.png', 179)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (79, N'АсбоцементТехАвто', 1, N'304975, Пензенская область, город Солнечногорск, шоссе Балканская, 76', N'7626076463', N'579234124', N'Сидорова Любовь Ивановна', N'4956768198', N'matveev.yliy@kiseleva.ru', N'\agents\agent_49.png', 247)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (80, N'Cиб', 3, N'194134, Омская область, город Волоколамск, пер. Косиора, 79', N'7892739766', N'524021828', N'Беспалова Мирослав Владимирович', N'8123732764', N'email: anfisa50@krykova.org', N'\agents\agent_83.png', 174)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (81, N'СервисТомск', 1, N'194903, Амурская область, город Ногинск, ул. Бухарестская, 45', N'8538379073', N'761935124', N'Егор Сергеевич Филиппов', N'35222663165', N'email: mukin.lev@komarov.ru', N'\agents\agent_79.png', 475)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (82, N'ТверьМетизУралСнос', 3, N'880551, Ленинградская область, город Красногорск, ул. Гоголя, 61', N'1076095397', N'947828491', N'Зоя Андреевна Соболева', N'79224972219', N'rlazareva@novikov.ru', N'\agents\agent_48.png', 165)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (83, N'Электро', 4, N'966815, Новгородская область, город Одинцово, пр. Космонавтов, 19', N'7896029866', N'786038848', N'Шарапова Елена Дмитриевна', N'8122644175', N'likacev.makar@antonov.ru', N'\agents\agent_32.png', 366)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (84, N'Компания Алмаз', 3, N'016215, Воронежская область, город Зарайск, ул. Косиора, 48', N'6698862694', N'662876919', N'Фоминаа Лариса Романовна', N'79221678939', N'email: akalinina@zaitev.ru', N'\agents\agent_60.png', 259)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (85, N'ПивЛенТверь', 5, N'783238, Тюменская область, город Серебряные Пруды, проезд 1905 года, 67', N'9476119404', N'365311390', N'Костин Савва Романович', N'8126531926', N'dnikitina@antonova.ru', N'\agents\agent_110.png', 190)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (86, N'МетизБухРем', 4, N'318328, Кемеровская область, город Павловский Посад, спуск 1905 года, 92', N'1449531554', N'124871353', N'Нонна Фёдоровна Федотова', N'79228527343', N'email: koselev.anfisa@selezneva.ru', NULL, 112)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (87, N'ITСтройАлмаз', 4, N'361730, Костромская область, город Волоколамск, шоссе Славы, 36', N'7689065648', N'456612755', N'Алексеева Валериан Андреевич', N'35222463391', N'fokin.eduard@samoilov.com', NULL, 159)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (88, N'МонтажОрионУрал', 6, N'027573, Тамбовская область, город Коломна, ул. Ленина, 20', N'1692286718', N'181380912', N'Давыдоваа Нина Евгеньевна', N'88009162793', N'email: pzaitev@blokin.org', N'\agents\agent_35.png', 50)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (89, N'ВодГор', 4, N'265653, Калужская область, город Ступино, шоссе Гоголя, 89', N'4463113470', N'899603778', N'Фаина Фёдоровна Филиппова', N'35222615874', N'tvetkova.robert@sorokin.com', N'\agents\agent_64.png', 72)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (90, N'ВостокКазРыб', 1, N'059565, Оренбургская область, город Истра, шоссе Домодедовская, 27', N'7411284960', N'176779733', N'Самсонов Родион Романович', N'79222639351', N'flukin@misin.org', N'\agents\agent_51.png', 361)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (91, N'ЛифтРыб', 3, N'076703, Саратовская область, город Одинцово, ул. Косиора, 01', N'3997121859', N'970823018', N'Субботин Анатолий Евгеньевич', N'79222984548', N'maksim86@fokina.ru', NULL, 445)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (92, N'УралСтройХмель', 5, N'462632, Костромская область, город Шаховская, шоссе Сталина, 92', N'8773558039', N'402502867', N'Август Борисович Красильникова', N'8129869447', N'aleksandr95@kolobova.ru', N'\agents\agent_52.png', 372)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (93, N'ГаражРосВекторПроф', 6, N'828207, Тверская область, город Щёлково, наб. Ленина, 70', N'1092776106', N'164232266', N'Абрам Фёдорович Дроздов', N'88005956586', N'adrian61@guseva.ru', N'\agents\agent_81.png', 189)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (94, N'Каз', 6, N'432454, Ленинградская область, город Луховицы, пр. Косиора, 88', N'1036132639', N'918316432', N'Святослав Андреевич Моисеева', N'4958291577', N'jsafonov@molcanov.com', N'\agents\agent_115.png', 291)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (95, N'КрепМетал', 3, N'103296, Иркутская область, город Солнечногорск, пл. 1905 года, 59', N'1689100612', N'671073273', N'Андрей Сергеевич Лобанов', N'79225378864', N'nika.kalasnikov@maslova.ru', NULL, 471)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (96, N'Компания ЖелДорТверьМонтаж', 3, N'152424, Рязанская область, город Сергиев Посад, ул. 1905 года, 27', N'3325722996', N'665766347', N'Нестор Максимович Гуляев', N'4951685394', N'burova.zlata@zueva.ru', N'\agents\agent_24.png', 2)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (97, N'ОрионСофтВодСнос', 5, N'577227, Калужская область, город Павловский Посад, наб. Чехова, 35', N'1522348613', N'977738715', N'Мухина Ян Фёдорович', N'88001875696', N'isukanov@sobolev.com', N'\agents\agent_36.png', 361)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (98, N'БухМясМоторПром', 4, N'677498, Костромская область, город Зарайск, спуск Славы, 59', N'7377410338', N'592041317', N'Нина Дмитриевна Черноваа', N'35222738181', N'varvara49@savin.ru', NULL, 158)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (99, N'ГлавБашкирМоторБанк', 2, N'258285, Ульяновская область, город Ступино, пл. Ладыгина, 83', N'9101293748', N'531950230', N'Стефан Алексеевич Андреев', N'4951342772', N'xaksenova@kazakov.ru', NULL, 98)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (100, N'Рем', 2, N'373761, Псковская область, город Наро-Фоминск, наб. Гагарина, 03', N'9006569852', N'152177100', N'Альбина Александровна Романова', N'8121116711', N'rafail96@sukin.ru', N'\agents\agent_55.png', 88)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (106, N'4324', 4, N'34243', N'423', N'432', N'423', N'423', N'423', NULL, 23)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (111, N'111111111111111', 1, N'321132131', N'321321', N'321321', N'3213', N'3213', N'3213', NULL, 232332)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (112, N'тестовый агент', 1, N'ааааааааааааа', N'333333333', N'33333', N'аааааааа', N'ааааааааа', N'аааааааааа', NULL, 34324232)
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
SET IDENTITY_INSERT [dbo].[AgentType] ON 

INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (1, N'МФО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (2, N'ПАО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (3, N'ООО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (4, N'ОАО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (5, N'ЗАО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (6, N'МКК', NULL)
SET IDENTITY_INSERT [dbo].[AgentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (1, N'Газета большая 1868', 2, N'27976646', N'', N'', 1, 6, CAST(902.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (2, N'Газета большая 3657', 3, N'78091245', N'', N'', 4, 11, CAST(930.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (3, N'Газета для художников 4236', 4, N'48553183', N'', N'', 2, 10, CAST(1550.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (4, N'Газета в самолет 4604', 3, N'8680636', N'', N'', 2, 11, CAST(753.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (5, N'Газета большая 4944', 5, N'9353504', N'', N'', 2, 12, CAST(273.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (6, N'Газета на все случаи жизни 1520', 4, N'45594795', N'', N'', 5, 2, CAST(456.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (7, N'Газета в для бесплатной раздачи 2606', 3, N'83462242', N'', N'', 5, 11, CAST(774.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (8, N'Газета большая 6862', 4, N'59167393', N'', N'', 5, 4, CAST(434.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (9, N'Газета для камина 3315', 7, N'54478746', N'', N'', 3, 10, CAST(1218.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (10, N'Газета для художников 3342', 2, N'22057074', N'', N'', 1, 9, CAST(1810.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (11, N'Газета на все случаи жизни 6648', 5, N'87295396', N'', N'', 5, 6, CAST(855.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (12, N'Газета с рекламой 6481', 7, N'24075601', N'', N'', 4, 10, CAST(1082.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (13, N'Газета для камина 2315', 6, N'50256318', N'', N'', 1, 2, CAST(371.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (14, N'Газета в для бесплатной раздачи 3292', 7, N'85600070', N'', N'', 2, 9, CAST(1538.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (15, N'Газета в самолет 5630', 5, N'84369081', N'', N'', 2, 7, CAST(408.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (16, N'Газета с рекламой 2151', 5, N'7334637', N'', N'', 3, 11, CAST(469.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (17, N'Газета для художников 4151', 6, N'36541845', N'', N'', 1, 1, CAST(1941.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (18, N'Газета для художников 6785', 6, N'39091116', N'', N'', 1, 9, CAST(1803.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (19, N'Газета 4345', 4, N'52923383', N'', N'', 5, 8, CAST(1184.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (20, N'Газета 3090', 4, N'11600809', N'', N'', 1, 12, CAST(1330.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (21, N'Газета на все случаи жизни 3544', 5, N'60843368', N'', N'', 3, 11, CAST(859.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (22, N'Газета большая 3643', 5, N'22067189', N'', N'', 3, 5, CAST(1915.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (23, N'Газета 4180', 6, N'76654386', N'', N'', 4, 4, CAST(921.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (24, N'Газета 3975', 7, N'82659311', N'', N'', 1, 10, CAST(1508.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (25, N'Газета с рекламой 3242', 2, N'7149484', N'', N'', 2, 11, CAST(921.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (26, N'Газета для художников 6864', 3, N'87872929', N'', N'', 3, 8, CAST(171.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (27, N'Газета 1082', 5, N'77937928', N'', N'', 2, 12, CAST(714.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (28, N'Газета в для бесплатной раздачи 6111', 4, N'72416523', N'', N'', 1, 9, CAST(309.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (29, N'Газета на все случаи жизни 1714', 7, N'31665003', N'', N'', 2, 12, CAST(1424.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (30, N'Газета для камина 6285', 3, N'71281919', N'', N'', 5, 11, CAST(983.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (31, N'Газета на все случаи жизни 6220', 4, N'18410956', N'', N'', 1, 4, CAST(1698.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (32, N'Газета для художников 4102', 7, N'63922854', N'', N'', 3, 1, CAST(1579.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (33, N'Газета для художников 4315', 4, N'42103413', N'', N'', 1, 5, CAST(393.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (34, N'Газета с рекламой 2519', 5, N'80730863', N'', N'', 3, 8, CAST(540.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (35, N'Газета большая 3238', 4, N'89835699', N'', N'', 2, 11, CAST(1755.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (36, N'Газета большая 5121', 6, N'64624694', N'', N'', 5, 4, CAST(756.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (37, N'Газета в самолет 2000', 5, N'29040461', N'', N'', 4, 11, CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (38, N'Газета 2519', 4, N'13583259', N'', N'', 3, 8, CAST(1046.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (39, N'Газета с рекламой 5369', 5, N'1238940', N'', N'', 4, 11, CAST(1272.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (40, N'Газета в для бесплатной раздачи 2698', 7, N'70753171', N'', N'', 5, 2, CAST(1877.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (41, N'Газета для камина 6472', 3, N'82969831', N'', N'', 4, 2, CAST(1114.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (42, N'Газета в для бесплатной раздачи 5284', 5, N'33299792', N'', N'', 2, 12, CAST(1347.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (43, N'Газета в для бесплатной раздачи 1541', 4, N'14324022', N'', N'', 4, 12, CAST(467.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (44, N'Газета для художников 4719', 2, N'77692803', N'', N'', 4, 2, CAST(1701.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (45, N'Газета на все случаи жизни 3653', 5, N'53542547', N'', N'', 3, 8, CAST(1378.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (46, N'Газета в для бесплатной раздачи 6264', 7, N'18281277', N'', N'', 4, 2, CAST(1127.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (47, N'Газета на все случаи жизни 2342', 4, N'30687057', N'', N'', 3, 12, CAST(1180.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (48, N'Газета для художников 3691', 5, N'54726555', N'', N'', 4, 3, CAST(557.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (49, N'Газета 3037', 7, N'26474670', N'', N'', 2, 8, CAST(1653.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (50, N'Газета 5023', 7, N'1423893', N'', N'', 5, 1, CAST(1389.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSale] ON 

INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (1, 1, 1, CAST(N'2010-05-15' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (2, 2, 2, CAST(N'2016-12-27' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (3, 3, 3, CAST(N'2018-01-14' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (4, 4, 4, CAST(N'2016-02-23' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (5, 5, 5, CAST(N'2019-05-28' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (6, 6, 6, CAST(N'2019-03-28' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (7, 7, 7, CAST(N'2014-10-07' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (8, 8, 8, CAST(N'2011-02-24' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (9, 9, 9, CAST(N'2010-07-03' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (10, 10, 10, CAST(N'2010-02-05' AS Date), 2)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (11, 11, 11, CAST(N'2010-04-11' AS Date), 2)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (12, 12, 12, CAST(N'2012-07-08' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (13, 13, 13, CAST(N'2011-02-01' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (14, 14, 14, CAST(N'2014-08-15' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (15, 15, 15, CAST(N'2015-10-23' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (16, 16, 16, CAST(N'2013-02-17' AS Date), 4)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (17, 17, 17, CAST(N'2018-01-20' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (18, 18, 18, CAST(N'2013-11-23' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (19, 19, 19, CAST(N'2016-06-02' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (20, 20, 20, CAST(N'2010-10-17' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (21, 21, 21, CAST(N'2018-02-12' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (22, 22, 22, CAST(N'2011-11-10' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (23, 23, 23, CAST(N'2010-07-18' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (24, 24, 24, CAST(N'2016-12-21' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (25, 25, 25, CAST(N'2012-07-09' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (26, 26, 26, CAST(N'2012-08-19' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (27, 27, 27, CAST(N'2014-08-15' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (28, 28, 28, CAST(N'2015-04-23' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (29, 29, 29, CAST(N'2013-05-22' AS Date), 4)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (30, 30, 30, CAST(N'2014-08-24' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (31, 31, 31, CAST(N'2010-06-05' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (32, 32, 32, CAST(N'2019-03-12' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (33, 33, 33, CAST(N'2011-09-12' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (34, 34, 34, CAST(N'2013-11-22' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (35, 35, 35, CAST(N'2014-12-10' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (36, 36, 36, CAST(N'2016-10-25' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (37, 37, 37, CAST(N'2017-08-27' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (38, 38, 38, CAST(N'2018-08-18' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (39, 39, 39, CAST(N'2017-05-12' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (40, 40, 40, CAST(N'2012-03-02' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (41, 41, 41, CAST(N'2010-12-05' AS Date), 4)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (42, 42, 42, CAST(N'2010-02-03' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (43, 43, 43, CAST(N'2016-02-20' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (44, 44, 44, CAST(N'2015-07-21' AS Date), 2)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (45, 45, 45, CAST(N'2012-04-05' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (46, 46, 46, CAST(N'2019-10-06' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (47, 47, 47, CAST(N'2014-01-18' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (48, 48, 48, CAST(N'2010-12-21' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (49, 49, 49, CAST(N'2017-03-08' AS Date), 2)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (50, 50, 50, CAST(N'2012-09-09' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (51, 1, 1, CAST(N'2013-06-24' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (52, 2, 2, CAST(N'2019-05-07' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (53, 3, 3, CAST(N'2010-03-18' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (54, 4, 4, CAST(N'2018-09-06' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (55, 5, 5, CAST(N'2018-03-24' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (56, 6, 6, CAST(N'2019-02-18' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (57, 7, 7, CAST(N'2015-11-16' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (58, 8, 8, CAST(N'2011-01-28' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (59, 9, 9, CAST(N'2019-02-24' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (60, 10, 10, CAST(N'2014-04-27' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (61, 11, 11, CAST(N'2014-02-28' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (62, 12, 12, CAST(N'2015-10-21' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (63, 13, 13, CAST(N'2012-09-26' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (64, 14, 14, CAST(N'2010-10-19' AS Date), 4)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (65, 15, 15, CAST(N'2012-03-20' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (66, 16, 16, CAST(N'2014-12-11' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (67, 17, 17, CAST(N'2019-12-04' AS Date), 4)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (68, 18, 18, CAST(N'2015-07-01' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (69, 19, 19, CAST(N'2018-12-04' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (70, 20, 20, CAST(N'2018-03-22' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (71, 21, 21, CAST(N'2019-10-26' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (72, 22, 22, CAST(N'2018-06-21' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (73, 23, 23, CAST(N'2012-09-10' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (74, 24, 24, CAST(N'2016-09-25' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (75, 25, 25, CAST(N'2018-08-18' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (76, 26, 26, CAST(N'2014-02-19' AS Date), 2)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (77, 27, 27, CAST(N'2013-03-24' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (78, 28, 28, CAST(N'2010-08-24' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (79, 29, 29, CAST(N'2019-03-10' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (80, 30, 30, CAST(N'2019-01-18' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (81, 31, 31, CAST(N'2010-11-06' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (82, 32, 32, CAST(N'2018-01-05' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (83, 33, 33, CAST(N'2011-07-18' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (84, 34, 34, CAST(N'2019-06-02' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (85, 35, 35, CAST(N'2017-09-13' AS Date), 2)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (86, 36, 36, CAST(N'2013-09-05' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (87, 37, 37, CAST(N'2013-08-24' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (88, 38, 38, CAST(N'2015-09-05' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (89, 39, 39, CAST(N'2015-08-17' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (90, 40, 40, CAST(N'2016-04-26' AS Date), 4)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (91, 41, 41, CAST(N'2010-08-02' AS Date), 2)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (92, 42, 42, CAST(N'2010-06-15' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (93, 43, 43, CAST(N'2017-08-17' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (94, 44, 44, CAST(N'2019-04-27' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (95, 45, 45, CAST(N'2013-12-24' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (96, 46, 46, CAST(N'2011-05-15' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (97, 47, 47, CAST(N'2010-06-14' AS Date), 4)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (98, 48, 48, CAST(N'2019-09-20' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (99, 49, 49, CAST(N'2010-05-01' AS Date), 14)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (100, 50, 50, CAST(N'2015-04-08' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (101, 23, 27, CAST(N'2021-10-23' AS Date), 78400)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (102, 24, 20, CAST(N'2021-09-10' AS Date), 453000)
SET IDENTITY_INSERT [dbo].[ProductSale] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (2, N'Спам', 20)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (3, N'Государственная', 100)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (4, N'Художественная', 30)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (5, N'Новостная', 34)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (6, N'Популярное', 450)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (7, N'Объявления', 1000)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
USE [master]
GO
ALTER DATABASE [PaperCompany] SET  READ_WRITE 
GO
