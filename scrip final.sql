USE [master]
GO
/****** Object:  Database [Visitas]    Script Date: 12/03/2021 11:04:51 ******/
CREATE DATABASE [Visitas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Visitas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Visitas.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Visitas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Visitas_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Visitas] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Visitas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Visitas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Visitas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Visitas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Visitas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Visitas] SET ARITHABORT OFF 
GO
ALTER DATABASE [Visitas] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Visitas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Visitas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Visitas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Visitas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Visitas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Visitas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Visitas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Visitas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Visitas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Visitas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Visitas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Visitas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Visitas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Visitas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Visitas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Visitas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Visitas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Visitas] SET  MULTI_USER 
GO
ALTER DATABASE [Visitas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Visitas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Visitas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Visitas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Visitas] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Visitas]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 12/03/2021 11:04:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Legajo] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Legajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 12/03/2021 11:04:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[IdPaciente] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visitas]    Script Date: 12/03/2021 11:04:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitas](
	[IdVisita] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NULL,
	[LegajoRecepcionista] [int] NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Duracion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVisita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Empleados] ([Legajo], [Nombre]) VALUES (932, N'Barros')
INSERT [dbo].[Empleados] ([Legajo], [Nombre]) VALUES (10842, N'Pino')
INSERT [dbo].[Empleados] ([Legajo], [Nombre]) VALUES (11002, N'Perez')
INSERT [dbo].[Empleados] ([Legajo], [Nombre]) VALUES (11007, N'Comelli')
INSERT [dbo].[Empleados] ([Legajo], [Nombre]) VALUES (21163, N'Ludueña')
GO
INSERT [dbo].[Pacientes] ([IdPaciente], [Nombre]) VALUES (1, N'Juan')
INSERT [dbo].[Pacientes] ([IdPaciente], [Nombre]) VALUES (2, N'Ana')
INSERT [dbo].[Pacientes] ([IdPaciente], [Nombre]) VALUES (5, N'Mario')
INSERT [dbo].[Pacientes] ([IdPaciente], [Nombre]) VALUES (7, N'Sofia')
INSERT [dbo].[Pacientes] ([IdPaciente], [Nombre]) VALUES (9, N'Esteban')
INSERT [dbo].[Pacientes] ([IdPaciente], [Nombre]) VALUES (13, N'Alejandra')
GO
SET IDENTITY_INSERT [dbo].[Visitas] ON 

INSERT [dbo].[Visitas] ([IdVisita], [IdPaciente], [LegajoRecepcionista], [Nombre], [Duracion]) VALUES (11, 1, 932, N'marcos', 2)
INSERT [dbo].[Visitas] ([IdVisita], [IdPaciente], [LegajoRecepcionista], [Nombre], [Duracion]) VALUES (12, 1, 932, N'marcos', 2)
INSERT [dbo].[Visitas] ([IdVisita], [IdPaciente], [LegajoRecepcionista], [Nombre], [Duracion]) VALUES (13, 1, 932, N'lendro', 2)
INSERT [dbo].[Visitas] ([IdVisita], [IdPaciente], [LegajoRecepcionista], [Nombre], [Duracion]) VALUES (14, 9, 11002, N'jorge', 5)
INSERT [dbo].[Visitas] ([IdVisita], [IdPaciente], [LegajoRecepcionista], [Nombre], [Duracion]) VALUES (16, 9, 932, N'mauricio', 5)
INSERT [dbo].[Visitas] ([IdVisita], [IdPaciente], [LegajoRecepcionista], [Nombre], [Duracion]) VALUES (17, 1, 932, N'facundo', 4)
INSERT [dbo].[Visitas] ([IdVisita], [IdPaciente], [LegajoRecepcionista], [Nombre], [Duracion]) VALUES (18, 1, 932, N'lol', 2)
INSERT [dbo].[Visitas] ([IdVisita], [IdPaciente], [LegajoRecepcionista], [Nombre], [Duracion]) VALUES (19, 5, 11002, N'assda', 4)
INSERT [dbo].[Visitas] ([IdVisita], [IdPaciente], [LegajoRecepcionista], [Nombre], [Duracion]) VALUES (20, 5, 11002, N'assda', 4)
INSERT [dbo].[Visitas] ([IdVisita], [IdPaciente], [LegajoRecepcionista], [Nombre], [Duracion]) VALUES (21, 5, 11002, N'assda', 4)
INSERT [dbo].[Visitas] ([IdVisita], [IdPaciente], [LegajoRecepcionista], [Nombre], [Duracion]) VALUES (22, 1, 932, N'32', 4)
SET IDENTITY_INSERT [dbo].[Visitas] OFF
GO
ALTER TABLE [dbo].[Visitas]  WITH CHECK ADD FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Pacientes] ([IdPaciente])
GO
ALTER TABLE [dbo].[Visitas]  WITH CHECK ADD FOREIGN KEY([LegajoRecepcionista])
REFERENCES [dbo].[Empleados] ([Legajo])
GO
USE [master]
GO
ALTER DATABASE [Visitas] SET  READ_WRITE 
GO
