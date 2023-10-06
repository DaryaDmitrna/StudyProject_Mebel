USE [master]
GO
/****** Object:  Database [mebel]    Script Date: 17.04.2023 22:55:50 ******/
CREATE DATABASE [mebel]
 CONTAINMENT = NONE
GO
ALTER DATABASE [mebel] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mebel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mebel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mebel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mebel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mebel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mebel] SET ARITHABORT OFF 
GO
ALTER DATABASE [mebel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mebel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mebel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mebel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mebel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mebel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mebel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mebel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mebel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mebel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mebel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mebel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mebel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mebel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mebel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mebel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mebel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mebel] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [mebel] SET  MULTI_USER 
GO
ALTER DATABASE [mebel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mebel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mebel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mebel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mebel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mebel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [mebel] SET QUERY_STORE = OFF
GO
USE [mebel]
GO
/****** Object:  Table [dbo].[Character]    Script Date: 17.04.2023 22:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Character](
	[IdCharacter] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Character] PRIMARY KEY CLUSTERED 
(
	[IdCharacter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 17.04.2023 22:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[IdClient] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Adres] [nvarchar](50) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[IdClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 17.04.2023 22:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[IdManager] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED 
(
	[IdManager] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewProduct]    Script Date: 17.04.2023 22:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewProduct](
	[IdNewProduct] [int] IDENTITY(1,1) NOT NULL,
	[IdOrder] [int] NOT NULL,
	[IdProduct] [int] NOT NULL,
 CONSTRAINT [PK_NewProduct] PRIMARY KEY CLUSTERED 
(
	[IdNewProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewproductCharacter]    Script Date: 17.04.2023 22:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewproductCharacter](
	[IdNewProductCharacter] [int] IDENTITY(1,1) NOT NULL,
	[IdNewProduct] [int] NOT NULL,
	[IdCharacter] [int] NOT NULL,
	[IdParametr] [int] NOT NULL,
 CONSTRAINT [PK_NewproductCharacter] PRIMARY KEY CLUSTERED 
(
	[IdNewProductCharacter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 17.04.2023 22:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[IdClient] [int] NOT NULL,
	[DateAccept] [date] NOT NULL,
	[DateExacute] [date] NULL,
	[DateDeliver] [date] NULL,
	[Sum] [money] NOT NULL,
	[Prepayment] [money] NOT NULL,
	[IdStatus] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Number] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parametr]    Script Date: 17.04.2023 22:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parametr](
	[IdParametr] [int] IDENTITY(1,1) NOT NULL,
	[IdCharacter] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Parametr] PRIMARY KEY CLUSTERED 
(
	[IdParametr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 17.04.2023 22:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[IdProduct] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[IdType] [int] NOT NULL,
	[Width] [int] NOT NULL,
	[Length] [int] NOT NULL,
	[Heigth] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 17.04.2023 22:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[IdStatus] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[IdStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 17.04.2023 22:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[IdType] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[IdType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeChracter]    Script Date: 17.04.2023 22:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeChracter](
	[IdTypeCharacter] [int] IDENTITY(1,1) NOT NULL,
	[IdType] [int] NOT NULL,
	[IdCharacter] [int] NOT NULL,
 CONSTRAINT [PK_TypeChracter] PRIMARY KEY CLUSTERED 
(
	[IdTypeCharacter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Character] ON 

INSERT [dbo].[Character] ([IdCharacter], [Name]) VALUES (1, N'Материал')
INSERT [dbo].[Character] ([IdCharacter], [Name]) VALUES (2, N'Цвет двери')
INSERT [dbo].[Character] ([IdCharacter], [Name]) VALUES (3, N'Ручка')
INSERT [dbo].[Character] ([IdCharacter], [Name]) VALUES (4, N'Плинтус снизу')
INSERT [dbo].[Character] ([IdCharacter], [Name]) VALUES (5, N'Доводчики')
INSERT [dbo].[Character] ([IdCharacter], [Name]) VALUES (7, N'Цвет доски')
INSERT [dbo].[Character] ([IdCharacter], [Name]) VALUES (8, N'Длина стола')
INSERT [dbo].[Character] ([IdCharacter], [Name]) VALUES (9, N'Цвет фартука')
INSERT [dbo].[Character] ([IdCharacter], [Name]) VALUES (10, N'Кол-во листов')
INSERT [dbo].[Character] ([IdCharacter], [Name]) VALUES (11, N'Кол-во плинтусов')
INSERT [dbo].[Character] ([IdCharacter], [Name]) VALUES (12, N'Цвет ножек')
INSERT [dbo].[Character] ([IdCharacter], [Name]) VALUES (13, N'Цвет сиденья')
INSERT [dbo].[Character] ([IdCharacter], [Name]) VALUES (14, N'Полка для тарелок')
INSERT [dbo].[Character] ([IdCharacter], [Name]) VALUES (15, N'Доска')
INSERT [dbo].[Character] ([IdCharacter], [Name]) VALUES (16, N'Полка для кружек')
INSERT [dbo].[Character] ([IdCharacter], [Name]) VALUES (17, N'Ножки')
SET IDENTITY_INSERT [dbo].[Character] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([IdClient], [Name], [Phone], [Adres]) VALUES (1, N'Иванов И.И.', N'88005553535', N'Ленина 5 кв 10')
INSERT [dbo].[Client] ([IdClient], [Name], [Phone], [Adres]) VALUES (2, N'Федосеева С.С.', N'88004444444', N'Мостовая 42')
INSERT [dbo].[Client] ([IdClient], [Name], [Phone], [Adres]) VALUES (3, N'Снегирёв М.А.', N'88503232323', N'Луначарского 107 кв 15')
INSERT [dbo].[Client] ([IdClient], [Name], [Phone], [Adres]) VALUES (1015, N'Кожевникова А.Н.', N'89505050505', N'ул. Первомайская 41')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Managers] ON 

INSERT [dbo].[Managers] ([IdManager], [Name], [Phone], [Email]) VALUES (1, N'Смирнов А.Ю.', N'89090909090', N'smirnov@mail.ru')
INSERT [dbo].[Managers] ([IdManager], [Name], [Phone], [Email]) VALUES (2, N'Мифтахова Н.Н.', N'89506565656', N'miftah@mail.ru')
INSERT [dbo].[Managers] ([IdManager], [Name], [Phone], [Email]) VALUES (3, N'Анкудинова А.А.', N'89707070707', N'ankud@mail.ru')
SET IDENTITY_INSERT [dbo].[Managers] OFF
GO
SET IDENTITY_INSERT [dbo].[NewProduct] ON 

INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5063, 6, 3)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5064, 6, 4)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5087, 28, 1)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5088, 29, 2)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5089, 30, 18)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5091, 32, 6)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5094, 34, 16)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5095, 34, 27)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5099, 36, 4)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5100, 36, 18)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5101, 36, 27)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5104, 38, 13)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5105, 38, 19)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5107, 40, 1)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5110, 42, 5)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5111, 42, 21)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5114, 44, 39)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5115, 44, 78)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5118, 46, 13)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5119, 46, 28)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5122, 48, 13)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5123, 48, 19)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5126, 50, 3)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5127, 50, 3)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5130, 52, 18)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5131, 52, 29)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5134, 54, 2)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5135, 54, 4)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5139, 56, 16)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5140, 56, 22)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5141, 56, 33)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5144, 58, 3)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5145, 58, 6)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5148, 60, 3)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5149, 60, 13)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5150, 61, 6)
INSERT [dbo].[NewProduct] ([IdNewProduct], [IdOrder], [IdProduct]) VALUES (5151, 61, 21)
SET IDENTITY_INSERT [dbo].[NewProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[NewproductCharacter] ON 

INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6538, 5063, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6539, 5063, 2, 6)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6540, 5063, 3, 20)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6541, 5063, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6542, 5063, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6543, 5063, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6544, 5064, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6545, 5064, 2, 6)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6546, 5064, 3, 20)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6547, 5064, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6548, 5064, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6549, 5064, 7, 117)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6682, 5087, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6683, 5087, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6684, 5087, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6685, 5087, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6686, 5087, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6687, 5087, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6688, 5088, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6689, 5088, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6690, 5088, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6691, 5088, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6692, 5088, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6693, 5088, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6694, 5089, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6695, 5089, 2, 5)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6696, 5089, 3, 23)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6697, 5089, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6698, 5089, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6699, 5089, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6706, 5091, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6707, 5091, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6708, 5091, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6709, 5091, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6710, 5091, 5, 27)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6711, 5091, 7, 114)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6724, 5094, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6725, 5094, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6726, 5094, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6727, 5094, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6728, 5094, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6729, 5094, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6730, 5095, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6731, 5095, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6732, 5095, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6733, 5095, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6734, 5095, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6735, 5095, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6754, 5099, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6755, 5099, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6756, 5099, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6757, 5099, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6758, 5099, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6759, 5099, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6760, 5100, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6761, 5100, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6762, 5100, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6763, 5100, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6764, 5100, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6765, 5100, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6766, 5101, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6767, 5101, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6768, 5101, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6769, 5101, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6770, 5101, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6771, 5101, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6784, 5104, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6785, 5104, 2, 6)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6786, 5104, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6787, 5104, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6788, 5104, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6789, 5104, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6790, 5105, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6791, 5105, 2, 6)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6792, 5105, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6793, 5105, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6794, 5105, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6795, 5105, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6802, 5107, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6803, 5107, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6804, 5107, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6805, 5107, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6806, 5107, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6807, 5107, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6820, 5110, 1, 2)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6821, 5110, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6822, 5110, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6823, 5110, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6824, 5110, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6825, 5110, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6826, 5111, 1, 2)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6827, 5111, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6828, 5111, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6829, 5111, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6830, 5111, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6831, 5111, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6843, 5114, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6844, 5114, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6845, 5114, 3, 17)
GO
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6846, 5114, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6847, 5114, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6848, 5114, 14, 136)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6849, 5114, 16, 139)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6850, 5115, 15, 142)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6851, 5115, 7, 117)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6852, 5115, 8, 43)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6853, 5115, 17, 144)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6866, 5118, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6867, 5118, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6868, 5118, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6869, 5118, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6870, 5118, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6871, 5118, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6872, 5119, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6873, 5119, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6874, 5119, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6875, 5119, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6876, 5119, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6877, 5119, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6890, 5122, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6891, 5122, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6892, 5122, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6893, 5122, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6894, 5122, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6895, 5122, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6896, 5123, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6897, 5123, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6898, 5123, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6899, 5123, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6900, 5123, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6901, 5123, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6914, 5126, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6915, 5126, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6916, 5126, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6917, 5126, 4, 25)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6918, 5126, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6919, 5126, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6920, 5127, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6921, 5127, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6922, 5127, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6923, 5127, 4, 25)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6924, 5127, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6925, 5127, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6938, 5130, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6939, 5130, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6940, 5130, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6941, 5130, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6942, 5130, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6943, 5130, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6944, 5131, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6945, 5131, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6946, 5131, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6947, 5131, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6948, 5131, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6949, 5131, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6962, 5134, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6963, 5134, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6964, 5134, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6965, 5134, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6966, 5134, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6967, 5134, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6968, 5135, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6969, 5135, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6970, 5135, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6971, 5135, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6972, 5135, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6973, 5135, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6992, 5139, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6993, 5139, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6994, 5139, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6995, 5139, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6996, 5139, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6997, 5139, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6998, 5140, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (6999, 5140, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7000, 5140, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7001, 5140, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7002, 5140, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7003, 5140, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7004, 5141, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7005, 5141, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7006, 5141, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7007, 5141, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7008, 5141, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7009, 5141, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7022, 5144, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7023, 5144, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7024, 5144, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7025, 5144, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7026, 5144, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7027, 5144, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7028, 5145, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7029, 5145, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7030, 5145, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7031, 5145, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7032, 5145, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7033, 5145, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7046, 5148, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7047, 5148, 2, 3)
GO
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7048, 5148, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7049, 5148, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7050, 5148, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7051, 5148, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7052, 5149, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7053, 5149, 2, 3)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7054, 5149, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7055, 5149, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7056, 5149, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7057, 5149, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7058, 5150, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7059, 5150, 2, 11)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7060, 5150, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7061, 5150, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7062, 5150, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7063, 5150, 7, 108)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7064, 5151, 1, 1)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7065, 5151, 2, 10)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7066, 5151, 3, 17)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7067, 5151, 4, 24)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7068, 5151, 5, 26)
INSERT [dbo].[NewproductCharacter] ([IdNewProductCharacter], [IdNewProduct], [IdCharacter], [IdParametr]) VALUES (7069, 5151, 7, 108)
SET IDENTITY_INSERT [dbo].[NewproductCharacter] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (6, 3, CAST(N'2023-03-01' AS Date), CAST(N'2023-04-01' AS Date), CAST(N'2023-04-02' AS Date), 9100.0000, 2730.0000, 6, NULL, N'2')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (28, 1, CAST(N'2023-03-20' AS Date), CAST(N'2023-04-20' AS Date), CAST(N'2023-04-21' AS Date), 4300.0000, 1290.0000, 6, NULL, N'3')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (29, 3, CAST(N'2023-03-21' AS Date), CAST(N'2023-04-21' AS Date), NULL, 4300.0000, 1290.0000, 4, NULL, N'4')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (30, 2, CAST(N'2023-03-22' AS Date), NULL, NULL, 4400.0000, 1320.0000, 3, NULL, N'5')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (32, 1015, CAST(N'2023-03-24' AS Date), NULL, NULL, 5300.0000, 1590.0000, 3, NULL, N'6')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (34, 2, CAST(N'2023-03-27' AS Date), NULL, NULL, 10900.0000, 3270.0000, 2, NULL, N'7')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (36, 1, CAST(N'2023-03-29' AS Date), NULL, NULL, 15600.0000, 4680.0000, 2, NULL, N'8')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (38, 1, CAST(N'2023-03-30' AS Date), NULL, NULL, 8400.0000, 2520.0000, 2, NULL, N'9')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (40, 1, CAST(N'2023-04-01' AS Date), NULL, NULL, 4300.0000, 1290.0000, 2, NULL, N'10')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (42, 2, CAST(N'2023-04-03' AS Date), NULL, NULL, 9700.0000, 2910.0000, 2, NULL, N'11')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (44, 3, CAST(N'2023-04-05' AS Date), NULL, NULL, 7700.0000, 2310.0000, 2, NULL, N'12')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (46, 3, CAST(N'2023-04-08' AS Date), NULL, NULL, 10900.0000, 3270.0000, 2, NULL, N'13')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (48, 2, CAST(N'2023-04-10' AS Date), NULL, NULL, 8400.0000, 2520.0000, 2, NULL, N'14')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (50, 2, CAST(N'2023-04-11' AS Date), NULL, NULL, 9100.0000, 2730.0000, 1, NULL, N'15')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (52, 2, CAST(N'2023-04-12' AS Date), NULL, NULL, 11400.0000, 3420.0000, 1, NULL, N'16')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (54, 3, CAST(N'2023-04-13' AS Date), NULL, NULL, 8800.0000, 2640.0000, 1, NULL, N'17')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (56, 1015, CAST(N'2023-04-14' AS Date), NULL, NULL, 14800.0000, 4440.0000, 1, NULL, N'18')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (58, 1, CAST(N'2023-04-15' AS Date), NULL, NULL, 9400.0000, 2820.0000, 1, NULL, N'19')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (60, 1015, CAST(N'2023-04-16' AS Date), NULL, NULL, 8600.0000, 2580.0000, 1, NULL, N'20')
INSERT [dbo].[Order] ([IdOrder], [IdClient], [DateAccept], [DateExacute], [DateDeliver], [Sum], [Prepayment], [IdStatus], [Image], [Number]) VALUES (61, 3, CAST(N'2023-04-17' AS Date), NULL, NULL, 9600.0000, 2880.0000, 1, N'b09fbaefea7f4ff9ab7945afc870ac56.jpg', N'21')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Parametr] ON 

INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (1, 1, N'ЛДСП', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (2, 1, N'МДФ', 250.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (3, 2, N'белый', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (4, 2, N'серый', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (5, 2, N'чёрный', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (6, 2, N'бежевый', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (7, 2, N'синий', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (8, 2, N'красный', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (9, 2, N'листочки', 400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (10, 2, N'цветочки', 400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (11, 2, N'капельки', 400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (12, 2, N'чёрный мрамор', 400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (14, 2, N'белый мрамор', 400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (15, 2, N'золото', 400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (16, 2, N'дерево', 400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (17, 3, N'прямая горизонтальная', 200.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (18, 3, N'прямая вертикальная', 200.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (19, 3, N'волнистая горизонтальная', 200.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (20, 3, N'волнистая вертальная', 200.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (21, 3, N'ромбик', 200.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (22, 3, N'кружок', 200.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (23, 3, N'магнит', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (24, 4, N'нет', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (25, 4, N'есть', 50.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (26, 5, N'нет', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (27, 5, N'есть', 400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (43, 8, N'30', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (44, 8, N'40', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (45, 8, N'60', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (46, 8, N'70', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (47, 8, N'80', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (48, 8, N'90', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (49, 8, N'100', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (50, 8, N'110', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (51, 8, N'120', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (52, 9, N'белая микро плитка', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (53, 9, N'белый кирпич', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (54, 9, N'чёрный', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (55, 9, N'белый', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (57, 9, N'чёрный мрамор', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (59, 9, N'белый мрамор', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (60, 9, N'серые соты', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (61, 9, N'ночной город', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (62, 9, N'цветочки', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (63, 9, N'джунгли', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (64, 9, N'море', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (65, 10, N'1', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (66, 10, N'2', 400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (67, 10, N'3', 800.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (68, 10, N'4', 1200.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (69, 10, N'5', 1600.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (70, 10, N'6', 2000.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (72, 10, N'7', 2400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (73, 10, N'8', 2800.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (74, 10, N'9', 3200.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (75, 10, N'10', 3600.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (76, 10, N'11', 4000.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (77, 10, N'12', 4400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (78, 10, N'13', 4800.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (79, 10, N'14', 5200.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (80, 10, N'15', 5600.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (81, 10, N'16', 6000.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (82, 10, N'17', 6400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (83, 10, N'18', 6800.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (84, 10, N'19', 7200.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (85, 10, N'20', 7600.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (86, 11, N'1', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (87, 11, N'2', 1000.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (88, 11, N'3', 1500.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (89, 11, N'4', 2000.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (90, 11, N'5', 2500.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (91, 11, N'6', 3000.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (92, 11, N'7', 3500.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (93, 11, N'8', 4000.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (94, 11, N'9', 4500.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (95, 11, N'10', 5000.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (96, 11, N'11', 5500.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (97, 11, N'12', 6000.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (98, 11, N'13', 6500.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (99, 11, N'14', 7000.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (108, 7, N'белый', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (110, 7, N'серый', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (111, 7, N'чёрный', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (112, 7, N'бежевый', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (113, 7, N'синий', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (114, 7, N'красный', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (115, 7, N'белый мрамор', 400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (116, 7, N'чёрный мрамор', 400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (117, 7, N'дерево', 400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (118, 12, N'белый', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (119, 12, N'серый', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (120, 12, N'чёрный', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (121, 12, N'бежевый', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (122, 12, N'синий', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (123, 12, N'красный', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (124, 12, N'белый мрамор', 400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (125, 12, N'чёрный мрамор', 400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (126, 12, N'дерево', 400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (127, 13, N'белый', 300.0000)
GO
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (128, 13, N'серый', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (129, 13, N'чёрный', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (130, 13, N'бежевый', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (131, 13, N'синий', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (132, 13, N'красный', 300.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (133, 13, N'белый мрамор', 400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (134, 13, N'чёрный мрамор', 400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (135, 13, N'дерево', 400.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (136, 14, N'нет', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (137, 14, N'1', 800.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (138, 14, N'2', 1600.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (139, 16, N'нет', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (140, 16, N'1', 800.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (141, 16, N'2', 1600.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (142, 15, N'ЛДСП', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (143, 15, N'МДФ', 63.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (144, 17, N'нет', 0.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (145, 17, N'1', 350.0000)
INSERT [dbo].[Parametr] ([IdParametr], [IdCharacter], [Name], [Price]) VALUES (146, 17, N'2', 700.0000)
SET IDENTITY_INSERT [dbo].[Parametr] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (1, N'шкаф пол 40*60*80 дверь справа', 3500.0000, 1, 40, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (2, N'шкаф пол 40*60*80 дверь слева', 3500.0000, 1, 40, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (3, N'шкаф пол 40*60*80 ящик и дверь справа', 3700.0000, 1, 40, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (4, N'шкаф пол 40*60*80 ящик и дверь слева', 3700.0000, 1, 40, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (5, N'шкаф пол 40*60*80 2 ящика', 3900.0000, 1, 40, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (6, N'шкаф пол 40*60*80 3 ящика', 4100.0000, 1, 40, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (13, N'шкаф пол 30*60*80 дверь справа', 3300.0000, 1, 30, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (16, N'щкаф пол 30*60*80 дверь слева', 3300.0000, 1, 30, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (18, N'шкаф пол 30*60*80 ящик и дверь справа', 3500.0000, 1, 30, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (19, N'шкаф пол 30*60*80 ящик и дверь слева', 3500.0000, 1, 30, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (21, N'шкаф пол 30*60*80 2 ящика', 3700.0000, 1, 30, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (22, N'шкаф пол 30*60*80 3 ящика', 3700.0000, 1, 30, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (23, N'шкаф пол 80*60*80 2 двери ', 6400.0000, 1, 80, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (25, N'шкаф пол 80*60*80 2 двери 2 ящика', 6700.0000, 1, 80, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (26, N'шкаф пол 80*60*80 2 двери 1 ящик', 6600.0000, 1, 80, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (27, N'шкаф пол 60*60*80 2 двери', 6000.0000, 1, 60, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (28, N'шкаф пол 60*60*80 2 двери 2 ящика', 6000.0000, 1, 60, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (29, N'шкаф пол 60*60*80 2 двери 1 ящик', 6300.0000, 1, 60, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (30, N'шкаф пол 40*60*80 угловой', 5500.0000, 1, 40, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (33, N'шкаф пол 30*60*80 угловой', 5400.0000, 1, 30, 60, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (34, N'шкаф стена 40*40*80 дверь справа', 3000.0000, 2, 40, 40, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (35, N'шкаф стена 40*40*80 дверь слева', 3000.0000, 2, 40, 40, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (36, N'шкаф стена 30*40*80 дверь справа', 2800.0000, 2, 30, 40, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (37, N'шкаф стена 30*40*80 дверь слева', 2800.0000, 2, 30, 40, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (38, N'шкаф стена 80*40*80 2 двери бока', 5400.0000, 2, 80, 40, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (39, N'шкаф стена 60*40*80 2 двери бока', 5000.0000, 2, 60, 40, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (40, N'шкаф стена 80*40*80 2 двери верх', 5400.0000, 2, 80, 40, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (41, N'шкаф стена 80*40*40 дверь верх', 2900.0000, 2, 80, 40, 40)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (42, N'шкаф стена 80*40*40 2 двери бока', 3000.0000, 2, 80, 40, 40)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (44, N'шкаф стена 40*30*80 дверь справа', 2900.0000, 2, 40, 30, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (45, N'шкаф стена 40*30*80 дверь слева', 2900.0000, 2, 40, 30, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (46, N'шкаф стена 30*30*80 дверь справа', 2800.0000, 2, 30, 30, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (47, N'шкаф стена 30*30*80 дверь слева', 2800.0000, 2, 30, 30, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (48, N'шкаф стена 80*30*80 2 двери бока', 5300.0000, 2, 80, 30, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (49, N'шкаф стена 60*30*80 2 двери бока', 4900.0000, 2, 60, 30, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (51, N'шкаф стена 80*30*80 2 двери верх', 5300.0000, 2, 80, 30, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (52, N'шкаф стена 80*30*40 дверь верх', 2800.0000, 2, 80, 30, 40)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (53, N'шкаф стена 80*30*40 2 двери бока', 2900.0000, 2, 80, 30, 40)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (54, N'шкаф стена 40*40*80 дверь справа стекло 1', 3500.0000, 2, 40, 40, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (56, N'шкаф стена 40*40*80 дверь справа стекло 2', 3500.0000, 2, 40, 40, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (57, N'шкаф стена 40*40*80 дверь слева стекло 1', 3500.0000, 2, 40, 40, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (58, N'шкаф стена 40*40*80 дверь слева стекло 2', 3500.0000, 2, 40, 40, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (60, N'шкаф стена 80*40*80 2 двери бока стекло 1', 5900.0000, 2, 80, 40, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (61, N'шкаф стена 80*40*80 2 двери бока стекло 2', 5900.0000, 2, 80, 40, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (62, N'шкаф стена 80*40*40 2 двери бока стекло 1', 3500.0000, 2, 80, 40, 40)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (63, N'шкаф стена 80*40*40 2 двери бока стекло 2', 3500.0000, 2, 80, 40, 40)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (64, N'шкаф стена 40*30*80 дверь справа стекло 1', 3400.0000, 2, 40, 30, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (66, N'шкаф стена 40*30*80 дверь справа стекло 2', 3400.0000, 2, 30, 30, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (67, N'шкаф стена 40*30*80 дверь слева стекло 1', 3400.0000, 2, 40, 30, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (68, N'шкаф стена 40*30*80 дверь слева стекло 2', 3400.0000, 2, 40, 30, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (69, N'шкаф стена 80*30*80 2 двери бока стекло 1', 5800.0000, 2, 80, 30, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (70, N'шкаф стена 80*30*80 2 двери бока стекло 2', 5800.0000, 2, 80, 30, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (71, N'шкаф стена 80*30*40 2 двери бока стекло 1', 3400.0000, 2, 80, 30, 40)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (72, N'шкаф стена 80*30*40 2 двери бока стекло 2', 3400.0000, 2, 80, 30, 40)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (73, N'шкаф стена 40*40*80 полки', 2500.0000, 3, 40, 40, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (74, N'шкаф стена 30*40*80 полки', 2400.0000, 3, 30, 40, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (75, N'шкаф стена 40*30*80 полки', 2400.0000, 3, 40, 30, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (76, N'шкаф стена 30*30*80 полки', 2300.0000, 3, 30, 30, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (78, N'столешница', 1500.0000, 4, 30, 60, 3)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (79, N'столешница + круг угол справа 60', 1800.0000, 4, 30, 60, 3)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (80, N'столешница + круг угол слева 60', 1800.0000, 4, 30, 60, 3)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (82, N'столешница + круг 30', 1800.0000, 4, 30, 60, 3)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (84, N'фартук', 400.0000, 5, 60, 0, 100)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (85, N'стул', 1500.0000, 6, 30, 30, 50)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (86, N'табуретка', 1300.0000, 6, 30, 30, 50)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (87, N'плинтус', 500.0000, 7, 100, 2, 5)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (1002, N'шкаф стена 40*40*80 угловой', 5000.0000, 2, 40, 40, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (1003, N'шкаф стена 30*40*80 угловой', 4900.0000, 2, 30, 40, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (1004, N'шкаф стена 40*30*80 угловой', 4900.0000, 2, 40, 30, 80)
INSERT [dbo].[Product] ([IdProduct], [Name], [Price], [IdType], [Width], [Length], [Heigth]) VALUES (1005, N'шкаф стена 30*30*80 угловой', 4800.0000, 2, 30, 30, 80)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([IdStatus], [Name]) VALUES (1, N'новый')
INSERT [dbo].[Status] ([IdStatus], [Name]) VALUES (2, N'заготовка деталей')
INSERT [dbo].[Status] ([IdStatus], [Name]) VALUES (3, N'сборка')
INSERT [dbo].[Status] ([IdStatus], [Name]) VALUES (4, N'готов')
INSERT [dbo].[Status] ([IdStatus], [Name]) VALUES (5, N'отправлен')
INSERT [dbo].[Status] ([IdStatus], [Name]) VALUES (6, N'завершён')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([IdType], [Name]) VALUES (1, N'шкаф напольный')
INSERT [dbo].[Type] ([IdType], [Name]) VALUES (2, N'шкаф навесной с дверью')
INSERT [dbo].[Type] ([IdType], [Name]) VALUES (3, N'шкаф навесной без двери')
INSERT [dbo].[Type] ([IdType], [Name]) VALUES (4, N'столешница')
INSERT [dbo].[Type] ([IdType], [Name]) VALUES (5, N'фартук')
INSERT [dbo].[Type] ([IdType], [Name]) VALUES (6, N'стул')
INSERT [dbo].[Type] ([IdType], [Name]) VALUES (7, N'плинтус')
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeChracter] ON 

INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (1, 1, 1)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (2, 1, 2)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (3, 1, 3)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (4, 1, 4)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (5, 1, 5)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (6, 1, 7)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (7, 2, 1)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (8, 2, 2)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (9, 2, 3)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (10, 2, 5)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (11, 2, 7)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (12, 2, 14)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (13, 3, 1)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (14, 3, 7)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (15, 4, 15)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (16, 4, 7)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (17, 4, 8)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (18, 5, 9)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (19, 5, 10)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (21, 6, 12)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (24, 6, 13)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (25, 7, 11)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (26, 2, 16)
INSERT [dbo].[TypeChracter] ([IdTypeCharacter], [IdType], [IdCharacter]) VALUES (27, 4, 17)
SET IDENTITY_INSERT [dbo].[TypeChracter] OFF
GO
ALTER TABLE [dbo].[NewProduct]  WITH CHECK ADD  CONSTRAINT [FK_NewProduct_Product] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([IdProduct])
GO
ALTER TABLE [dbo].[NewProduct] CHECK CONSTRAINT [FK_NewProduct_Product]
GO
ALTER TABLE [dbo].[NewproductCharacter]  WITH CHECK ADD  CONSTRAINT [FK_NewproductCharacter_Character] FOREIGN KEY([IdCharacter])
REFERENCES [dbo].[Character] ([IdCharacter])
GO
ALTER TABLE [dbo].[NewproductCharacter] CHECK CONSTRAINT [FK_NewproductCharacter_Character]
GO
ALTER TABLE [dbo].[NewproductCharacter]  WITH CHECK ADD  CONSTRAINT [FK_NewproductCharacter_NewProduct] FOREIGN KEY([IdNewProduct])
REFERENCES [dbo].[NewProduct] ([IdNewProduct])
GO
ALTER TABLE [dbo].[NewproductCharacter] CHECK CONSTRAINT [FK_NewproductCharacter_NewProduct]
GO
ALTER TABLE [dbo].[NewproductCharacter]  WITH CHECK ADD  CONSTRAINT [FK_NewproductCharacter_NewproductCharacter] FOREIGN KEY([IdNewProductCharacter])
REFERENCES [dbo].[NewproductCharacter] ([IdNewProductCharacter])
GO
ALTER TABLE [dbo].[NewproductCharacter] CHECK CONSTRAINT [FK_NewproductCharacter_NewproductCharacter]
GO
ALTER TABLE [dbo].[NewproductCharacter]  WITH CHECK ADD  CONSTRAINT [FK_NewproductCharacter_Parametr] FOREIGN KEY([IdParametr])
REFERENCES [dbo].[Parametr] ([IdParametr])
GO
ALTER TABLE [dbo].[NewproductCharacter] CHECK CONSTRAINT [FK_NewproductCharacter_Parametr]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([IdClient])
REFERENCES [dbo].[Client] ([IdClient])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Order] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Order] ([IdOrder])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Order]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Order1] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Order] ([IdOrder])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Order1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([IdStatus])
REFERENCES [dbo].[Status] ([IdStatus])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[Parametr]  WITH CHECK ADD  CONSTRAINT [FK_Parametr_Character] FOREIGN KEY([IdCharacter])
REFERENCES [dbo].[Character] ([IdCharacter])
GO
ALTER TABLE [dbo].[Parametr] CHECK CONSTRAINT [FK_Parametr_Character]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([IdProduct])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product2] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([IdProduct])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product2]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Type] FOREIGN KEY([IdType])
REFERENCES [dbo].[Type] ([IdType])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Type]
GO
ALTER TABLE [dbo].[TypeChracter]  WITH CHECK ADD  CONSTRAINT [FK_TypeChracter_Character] FOREIGN KEY([IdCharacter])
REFERENCES [dbo].[Character] ([IdCharacter])
GO
ALTER TABLE [dbo].[TypeChracter] CHECK CONSTRAINT [FK_TypeChracter_Character]
GO
ALTER TABLE [dbo].[TypeChracter]  WITH CHECK ADD  CONSTRAINT [FK_TypeChracter_Type] FOREIGN KEY([IdType])
REFERENCES [dbo].[Type] ([IdType])
GO
ALTER TABLE [dbo].[TypeChracter] CHECK CONSTRAINT [FK_TypeChracter_Type]
GO
ALTER TABLE [dbo].[TypeChracter]  WITH CHECK ADD  CONSTRAINT [FK_TypeChracter_TypeChracter] FOREIGN KEY([IdTypeCharacter])
REFERENCES [dbo].[TypeChracter] ([IdTypeCharacter])
GO
ALTER TABLE [dbo].[TypeChracter] CHECK CONSTRAINT [FK_TypeChracter_TypeChracter]
GO
USE [master]
GO
ALTER DATABASE [mebel] SET  READ_WRITE 
GO
