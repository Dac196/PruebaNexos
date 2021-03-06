USE [master]
GO
/****** Object:  Database [nexus]    Script Date: 16/04/2020 10:19:32 a. m. ******/
CREATE DATABASE [nexus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'nexus', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\nexus.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'nexus_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\nexus_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [nexus] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [nexus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [nexus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [nexus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [nexus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [nexus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [nexus] SET ARITHABORT OFF 
GO
ALTER DATABASE [nexus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [nexus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [nexus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [nexus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [nexus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [nexus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [nexus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [nexus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [nexus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [nexus] SET  DISABLE_BROKER 
GO
ALTER DATABASE [nexus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [nexus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [nexus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [nexus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [nexus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [nexus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [nexus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [nexus] SET RECOVERY FULL 
GO
ALTER DATABASE [nexus] SET  MULTI_USER 
GO
ALTER DATABASE [nexus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [nexus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [nexus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [nexus] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [nexus] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'nexus', N'ON'
GO
ALTER DATABASE [nexus] SET QUERY_STORE = OFF
GO
USE [nexus]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 16/04/2020 10:19:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 16/04/2020 10:19:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[NúmeroDeCredencial] [int] NOT NULL,
	[Hospital] [nvarchar](max) NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 16/04/2020 10:19:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[NumeroDeSeguroSocial] [int] NOT NULL,
	[CodigoPostal] [int] NOT NULL,
	[Telefono] [int] NOT NULL,
	[CedulaDoctor] [nvarchar](max) NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200415071643_InitialCreate', N'3.1.3')
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([Id], [Nombre], [NúmeroDeCredencial], [Hospital]) VALUES (1, N'Carlos Alberto Becerra Laguna', 1, N'Clínica del Occidente')
INSERT [dbo].[Doctor] ([Id], [Nombre], [NúmeroDeCredencial], [Hospital]) VALUES (2, N'Josué Enríquez Marín', 2, N'Hospital San José')
INSERT [dbo].[Doctor] ([Id], [Nombre], [NúmeroDeCredencial], [Hospital]) VALUES (3, N'Nain Maldonado Guzmán', 3, N'Hospital Universitario Clínica')
SET IDENTITY_INSERT [dbo].[Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[Paciente] ON 

INSERT [dbo].[Paciente] ([Id], [Nombre], [NumeroDeSeguroSocial], [CodigoPostal], [Telefono], [CedulaDoctor]) VALUES (6, N'Daniel Alejandro', 43222, 1111, 34567, N'3')
INSERT [dbo].[Paciente] ([Id], [Nombre], [NumeroDeSeguroSocial], [CodigoPostal], [Telefono], [CedulaDoctor]) VALUES (7, N'Alejandro Cruz', 334543, 2423421, 4123423, N'1')
INSERT [dbo].[Paciente] ([Id], [Nombre], [NumeroDeSeguroSocial], [CodigoPostal], [Telefono], [CedulaDoctor]) VALUES (8, N'Daniel', 9876, 11119, 7400580, N'1')
SET IDENTITY_INSERT [dbo].[Paciente] OFF
GO
USE [master]
GO
ALTER DATABASE [nexus] SET  READ_WRITE 
GO
