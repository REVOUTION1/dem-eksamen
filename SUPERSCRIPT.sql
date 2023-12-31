USE [master]
GO
/****** Object:  Database [kolledg312321]    Script Date: 09.11.2023 13:14:26 ******/
CREATE DATABASE [kolledg312321]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kolledg', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\kolledg.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'kolledg_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\kolledg_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [kolledg312321] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kolledg312321].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kolledg312321] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kolledg312321] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kolledg312321] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kolledg312321] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kolledg312321] SET ARITHABORT OFF 
GO
ALTER DATABASE [kolledg312321] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kolledg312321] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kolledg312321] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kolledg312321] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kolledg312321] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kolledg312321] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kolledg312321] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kolledg312321] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kolledg312321] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kolledg312321] SET  DISABLE_BROKER 
GO
ALTER DATABASE [kolledg312321] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kolledg312321] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kolledg312321] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kolledg312321] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kolledg312321] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kolledg312321] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kolledg312321] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kolledg312321] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [kolledg312321] SET  MULTI_USER 
GO
ALTER DATABASE [kolledg312321] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kolledg312321] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kolledg312321] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kolledg312321] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [kolledg312321] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [kolledg312321] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [kolledg312321] SET QUERY_STORE = OFF
GO
USE [kolledg312321]
GO
/****** Object:  Table [dbo].[merch]    Script Date: 09.11.2023 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merch](
	[id] [int] NOT NULL,
	[photo] [nvarchar](50) NULL,
	[title] [nvarchar](50) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[proizvoditel] [nvarchar](50) NOT NULL,
	[cost] [int] NOT NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_merch] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 09.11.2023 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[id_users] [int] NOT NULL,
	[point] [nvarchar](50) NOT NULL,
	[data] [date] NOT NULL,
	[kod] [int] NOT NULL,
	[cost] [int] NOT NULL,
	[dicsount] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Point]    Script Date: 09.11.2023 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Point](
	[id] [int] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Point] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sostav]    Script Date: 09.11.2023 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sostav](
	[id_orders] [int] NOT NULL,
	[id_merch] [int] NOT NULL,
	[count] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 09.11.2023 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 09.11.2023 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[id] [int] NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 09.11.2023 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[id_type] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[merch] ([id], [photo], [title], [description], [proizvoditel], [cost], [discount]) VALUES (1, N'/photo/2.jpg', N'руль', N'коричневый', N'германия', 500, NULL)
INSERT [dbo].[merch] ([id], [photo], [title], [description], [proizvoditel], [cost], [discount]) VALUES (2, N'/photo/3.jpg', N'масло', N'машинное', N'Россия', 700, 5)
INSERT [dbo].[merch] ([id], [photo], [title], [description], [proizvoditel], [cost], [discount]) VALUES (3, N'/photo/1.jpg', N'Шина', N'16 Радиус', N'Китай', 200, NULL)
GO
INSERT [dbo].[orders] ([id], [id_status], [id_users], [point], [data], [kod], [cost], [dicsount]) VALUES (1, 1, 1, N'1', CAST(N'2023-09-16' AS Date), 1213, 1200, 35)
GO
INSERT [dbo].[Point] ([id], [title]) VALUES (1, N'Пункт выдачи 1')
INSERT [dbo].[Point] ([id], [title]) VALUES (2, N'Пункт выдачи 2')
GO
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count]) VALUES (1, 1, 1)
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count]) VALUES (1, 2, 1)
GO
INSERT [dbo].[status] ([id], [title]) VALUES (1, N'новый')
INSERT [dbo].[status] ([id], [title]) VALUES (2, N'в работе')
GO
INSERT [dbo].[Tour] ([id], [role]) VALUES (1, N'Админ     ')
INSERT [dbo].[Tour] ([id], [role]) VALUES (2, N'Менеджр   ')
INSERT [dbo].[Tour] ([id], [role]) VALUES (3, N'Клиент    ')
GO
INSERT [dbo].[users] ([id], [login], [Password], [id_type]) VALUES (1, N'root', N'12345', 1)
INSERT [dbo].[users] ([id], [login], [Password], [id_type]) VALUES (2, N'manager', N'12345', 2)
INSERT [dbo].[users] ([id], [login], [Password], [id_type]) VALUES (3, N'client', N'12345', 3)
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_status] FOREIGN KEY([id_status])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_status]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_merch] FOREIGN KEY([id_merch])
REFERENCES [dbo].[merch] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_merch]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_orders] FOREIGN KEY([id_orders])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_orders]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_Tour] FOREIGN KEY([id_type])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_Tour]
GO
USE [master]
GO
ALTER DATABASE [kolledg312321] SET  READ_WRITE 
GO
