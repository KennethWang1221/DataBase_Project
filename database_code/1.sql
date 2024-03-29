USE [master]
GO
/****** Object:  Database [Xk]    Script Date: 11/22/2017 23:06:22 ******/
CREATE DATABASE [Xk] ON  PRIMARY 
( NAME = N'Xk', FILENAME = N'E:\2015级软件三班\数据库\数据库文件\Xk.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Xk_log', FILENAME = N'E:\2015级软件三班\数据库\数据库文件\Xk_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Xk] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Xk].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [Xk] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Xk] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Xk] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Xk] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Xk] SET ARITHABORT OFF
GO
ALTER DATABASE [Xk] SET AUTO_CLOSE ON
GO
ALTER DATABASE [Xk] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Xk] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Xk] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Xk] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Xk] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Xk] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Xk] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Xk] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Xk] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Xk] SET  DISABLE_BROKER
GO
ALTER DATABASE [Xk] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Xk] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Xk] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Xk] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Xk] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Xk] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Xk] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Xk] SET  READ_WRITE
GO
ALTER DATABASE [Xk] SET RECOVERY FULL
GO
ALTER DATABASE [Xk] SET  MULTI_USER
GO
ALTER DATABASE [Xk] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Xk] SET DB_CHAINING OFF
GO
USE [Xk]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 11/22/2017 23:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartNo] [nvarchar](2) NOT NULL,
	[DepartName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 11/22/2017 23:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CouNo] [nvarchar](3) NOT NULL,
	[CouName] [nvarchar](30) NOT NULL,
	[Kind] [nvarchar](8) NOT NULL,
	[Credit] [decimal](3, 1) NOT NULL,
	[Teacher] [nvarchar](20) NOT NULL,
	[DepartNo] [nvarchar](2) NOT NULL,
	[SchoolTime] [nvarchar](10) NOT NULL,
	[LimitNum] [decimal](5, 0) NOT NULL,
	[WillNum] [decimal](5, 0) NOT NULL,
	[ChooseNum] [decimal](5, 0) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CouNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 11/22/2017 23:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassNo] [nvarchar](8) NOT NULL,
	[DepartNo] [nvarchar](2) NOT NULL,
	[ClassName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 11/22/2017 23:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StuNo] [nvarchar](8) NOT NULL,
	[ClassNo] [nvarchar](8) NOT NULL,
	[StuName] [nvarchar](10) NOT NULL,
	[Pwd] [nvarchar](8) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StuNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_StuName] ON [dbo].[Student] 
(
	[StuName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StuCou]    Script Date: 11/22/2017 23:06:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StuCou](
	[StuNo] [nvarchar](8) NOT NULL,
	[CouNo] [nvarchar](3) NOT NULL,
	[WillOrder] [smallint] NOT NULL,
	[State] [nvarchar](2) NOT NULL,
	[RandomNum] [nvarchar](50) NULL,
 CONSTRAINT [PK_StuCou] PRIMARY KEY CLUSTERED 
(
	[StuNo] ASC,
	[CouNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Check [CK_WillOrder]    Script Date: 11/22/2017 23:06:23 ******/
ALTER TABLE [dbo].[StuCou]  WITH CHECK ADD  CONSTRAINT [CK_WillOrder] CHECK  (([WillOrder]>=(1) AND [WillOrder]<=(5)))
GO
ALTER TABLE [dbo].[StuCou] CHECK CONSTRAINT [CK_WillOrder]
GO
/****** Object:  ForeignKey [FK_Course_Department]    Script Date: 11/22/2017 23:06:23 ******/
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([DepartNo])
REFERENCES [dbo].[Department] ([DepartNo])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Department]
GO
/****** Object:  ForeignKey [FK_Class_Department]    Script Date: 11/22/2017 23:06:23 ******/
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Department] FOREIGN KEY([DepartNo])
REFERENCES [dbo].[Department] ([DepartNo])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Department]
GO
/****** Object:  ForeignKey [FK_Student_Class]    Script Date: 11/22/2017 23:06:23 ******/
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class] FOREIGN KEY([ClassNo])
REFERENCES [dbo].[Class] ([ClassNo])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Class]
GO
/****** Object:  ForeignKey [CouNo_FK]    Script Date: 11/22/2017 23:06:23 ******/
ALTER TABLE [dbo].[StuCou]  WITH CHECK ADD  CONSTRAINT [CouNo_FK] FOREIGN KEY([CouNo])
REFERENCES [dbo].[Course] ([CouNo])
GO
ALTER TABLE [dbo].[StuCou] CHECK CONSTRAINT [CouNo_FK]
GO
/****** Object:  ForeignKey [StuNo_FK]    Script Date: 11/22/2017 23:06:23 ******/
ALTER TABLE [dbo].[StuCou]  WITH CHECK ADD  CONSTRAINT [StuNo_FK] FOREIGN KEY([StuNo])
REFERENCES [dbo].[Student] ([StuNo])
GO
ALTER TABLE [dbo].[StuCou] CHECK CONSTRAINT [StuNo_FK]
GO
