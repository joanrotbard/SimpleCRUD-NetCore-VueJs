USE [master]
GO
/****** Object:  Database [Intelutions]    Script Date: 20/11/2020 9:39:04 ******/
CREATE DATABASE [Intelutions]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Intelutions', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Intelutions.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Intelutions_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Intelutions_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Intelutions] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Intelutions].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Intelutions] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Intelutions] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Intelutions] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Intelutions] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Intelutions] SET ARITHABORT OFF 
GO
ALTER DATABASE [Intelutions] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Intelutions] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Intelutions] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Intelutions] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Intelutions] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Intelutions] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Intelutions] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Intelutions] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Intelutions] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Intelutions] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Intelutions] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Intelutions] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Intelutions] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Intelutions] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Intelutions] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Intelutions] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Intelutions] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Intelutions] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Intelutions] SET  MULTI_USER 
GO
ALTER DATABASE [Intelutions] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Intelutions] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Intelutions] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Intelutions] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Intelutions] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Intelutions]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 20/11/2020 9:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeFN] [varchar](max) NOT NULL,
	[EmployeeLN] [varchar](max) NOT NULL,
	[PermissionTypeNum] [int] NOT NULL,
	[PermissionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PermissionType]    Script Date: 20/11/2020 9:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PermissionType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](max) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_PermissionType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Permission] ADD  DEFAULT ('') FOR [EmployeeFN]
GO
ALTER TABLE [dbo].[Permission] ADD  DEFAULT ('') FOR [EmployeeLN]
GO
ALTER TABLE [dbo].[Permission] ADD  DEFAULT ((0)) FOR [PermissionTypeNum]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD FOREIGN KEY([PermissionTypeNum])
REFERENCES [dbo].[PermissionType] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Intelutions] SET  READ_WRITE 
GO
