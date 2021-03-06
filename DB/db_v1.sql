USE [master]
GO
/****** Object:  Database [PiTerceiroSemestre]    Script Date: 24/03/2021 22:30:06 ******/
CREATE DATABASE [PiTerceiroSemestre]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PiTerceiroSemestre', FILENAME = N'D:\sistemas\Database\PiTerceiroSemestre.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PiTerceiroSemestre_log', FILENAME = N'D:\sistemas\Database\PiTerceiroSemestre_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PiTerceiroSemestre] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PiTerceiroSemestre].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PiTerceiroSemestre] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET ARITHABORT OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PiTerceiroSemestre] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PiTerceiroSemestre] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PiTerceiroSemestre] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PiTerceiroSemestre] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PiTerceiroSemestre] SET  MULTI_USER 
GO
ALTER DATABASE [PiTerceiroSemestre] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PiTerceiroSemestre] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PiTerceiroSemestre] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PiTerceiroSemestre] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PiTerceiroSemestre] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PiTerceiroSemestre] SET QUERY_STORE = OFF
GO
USE [PiTerceiroSemestre]
GO
/****** Object:  Table [dbo].[acc]    Script Date: 24/03/2021 22:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acc](
	[acc_id] [int] IDENTITY(1,1) NOT NULL,
	[acc_name] [varchar](200) NOT NULL,
	[acc_dt_birthday] [date] NOT NULL,
	[acc_username] [varchar](30) NOT NULL,
	[acc_password] [varchar](20) NOT NULL,
	[acc_email] [varchar](200) NOT NULL,
	[security_question_id] [int] NOT NULL,
	[acc_security_question_answer] [varchar](200) NOT NULL,
	[acc_password_was_reset] [bit] NOT NULL,
	[stts_id] [int] NOT NULL,
 CONSTRAINT [PK_acc] PRIMARY KEY CLUSTERED 
(
	[acc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loan]    Script Date: 24/03/2021 22:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loan](
	[loan_id] [int] IDENTITY(1,1) NOT NULL,
	[acc_id] [int] NULL,
	[sub_acc_id] [int] NULL,
	[loan_to_name] [varchar](150) NULL,
	[loan_date] [datetime] NOT NULL,
	[loan_observation] [varchar](500) NOT NULL,
	[loan_picture] [varchar](500) NULL,
	[loan_return_date] [date] NOT NULL,
	[loan_estimated_value] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_loan] PRIMARY KEY CLUSTERED 
(
	[loan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stts]    Script Date: 24/03/2021 22:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stts](
	[stts_id] [int] IDENTITY(1,1) NOT NULL,
	[stts_description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_stts] PRIMARY KEY CLUSTERED 
(
	[stts_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sub_acc]    Script Date: 24/03/2021 22:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sub_acc](
	[sub_acc_id] [int] IDENTITY(1,1) NOT NULL,
	[acc_id] [int] NOT NULL,
	[sub_acc_name] [varchar](200) NOT NULL,
	[sub_acc_password] [varchar](20) NOT NULL,
	[stts_id] [int] NOT NULL,
 CONSTRAINT [PK_sub_acc] PRIMARY KEY CLUSTERED 
(
	[sub_acc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[acc]  WITH CHECK ADD  CONSTRAINT [FK_acc_stts] FOREIGN KEY([stts_id])
REFERENCES [dbo].[stts] ([stts_id])
GO
ALTER TABLE [dbo].[acc] CHECK CONSTRAINT [FK_acc_stts]
GO
ALTER TABLE [dbo].[loan]  WITH CHECK ADD  CONSTRAINT [FK_loan_acc] FOREIGN KEY([acc_id])
REFERENCES [dbo].[acc] ([acc_id])
GO
ALTER TABLE [dbo].[loan] CHECK CONSTRAINT [FK_loan_acc]
GO
ALTER TABLE [dbo].[loan]  WITH CHECK ADD  CONSTRAINT [FK_loan_sub_acc] FOREIGN KEY([sub_acc_id])
REFERENCES [dbo].[sub_acc] ([sub_acc_id])
GO
ALTER TABLE [dbo].[loan] CHECK CONSTRAINT [FK_loan_sub_acc]
GO
ALTER TABLE [dbo].[sub_acc]  WITH CHECK ADD  CONSTRAINT [FK_sub_acc_acc] FOREIGN KEY([acc_id])
REFERENCES [dbo].[acc] ([acc_id])
GO
ALTER TABLE [dbo].[sub_acc] CHECK CONSTRAINT [FK_sub_acc_acc]
GO
ALTER TABLE [dbo].[sub_acc]  WITH CHECK ADD  CONSTRAINT [FK_sub_acc_stts] FOREIGN KEY([stts_id])
REFERENCES [dbo].[stts] ([stts_id])
GO
ALTER TABLE [dbo].[sub_acc] CHECK CONSTRAINT [FK_sub_acc_stts]
GO
USE [master]
GO
ALTER DATABASE [PiTerceiroSemestre] SET  READ_WRITE 
GO
