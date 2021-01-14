USE [master]
GO

/****** Object:  Database [CoretexCodingAssessmentDb]    Script Date: 1/13/2021 9:41:42 PM ******/
CREATE DATABASE [CoretexCodingAssessmentDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CoretexCodingAssessmentDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CoretexCodingAssessmentDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CoretexCodingAssessmentDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CoretexCodingAssessmentDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CoretexCodingAssessmentDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET ARITHABORT OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET  DISABLE_BROKER 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET RECOVERY FULL 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET  MULTI_USER 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET DB_CHAINING OFF 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET QUERY_STORE = OFF
GO

ALTER DATABASE [CoretexCodingAssessmentDb] SET  READ_WRITE 
GO


USE [CoretexCodingAssessmentDb]
GO

/****** Object:  Table [dbo].[Vehicle]    Script Date: 1/13/2021 9:40:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vehicle]') AND type in (N'U'))
DROP TABLE [dbo].[Vehicle]
GO

/****** Object:  Table [dbo].[Vehicle]    Script Date: 1/13/2021 9:40:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Vehicle](
	[Id] [int] IDENTITY(1,1),
	[Make] [nvarchar](100) NOT NULL,
	[Model] [nvarchar](100) NOT NULL,
	[Year] [smallint] NOT NULL,
	[VIN] [nvarchar](30) NOT NULL,
	[CreationDateTime] [datetimeoffset](7) NOT NULL,
	[LastUpdatedDateTime] [datetimeoffset](7) NOT NULL
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [CoretexCodingAssessmentDb]
GO

/****** Object:  StoredProcedure [dbo].[GetAllVehicles]    Script Date: 1/13/2021 10:04:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jay Zhang
-- Create date: 01/13/2021
-- Description:	Stored proc to get all records from Vehicle table
-- =============================================

CREATE PROCEDURE [dbo].[GetAllVehicles]
AS
SELECT	Id,
		Make,
		Model,
		Year,
		VIN
FROM Vehicle
GO


USE [CoretexCodingAssessmentDb]
GO

/****** Object:  StoredProcedure [dbo].[GetVehicle]    Script Date: 1/13/2021 10:04:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jay Zhang
-- Create date: 01/13/2021
-- Description:	Stored proc to get 1 Vehicle by its Id
-- =============================================

CREATE PROCEDURE [dbo].[GetVehicle]
		@id int
AS
SELECT	Id,
		Make,
		Model,
		Year,
		VIN
FROM Vehicle
where Id = @id
GO

USE [CoretexCodingAssessmentDb]
GO

/****** Object:  StoredProcedure [dbo].[DeleteVehicle]    Script Date: 1/13/2021 10:04:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jay Zhang
-- Create date: 01/13/2021
-- Description:	Stored proc to Delete 1 Vehicle by its Id
-- =============================================

CREATE PROCEDURE [dbo].[DeleteVehicle]
		@id int
AS
DELETE 
FROM Vehicle 
WHERE Id = @id
GO

USE [CoretexCodingAssessmentDb]
GO

/****** Object:  StoredProcedure [dbo].[AddVehicle]    Script Date: 1/13/2021 10:04:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jay Zhang
-- Create date: 01/13/2021
-- Description:	Stored proc to Add 1 new Vehicle to the Vehicle table
-- =============================================

CREATE PROCEDURE [dbo].[AddVehicle]
		@make nvarchar(100),
		@model nvarchar(100),
		@year smallint, 
		@vin nvarchar(30)
AS

INSERT INTO Vehicle (Make, Model, Year, VIN, CreationDateTime, LastUpdatedDateTime)
VALUES (@make, @model, @year, @vin, SYSDATETIMEOFFSET(), SYSDATETIMEOFFSET()); 

GO

USE [CoretexCodingAssessmentDb]
GO

/****** Object:  StoredProcedure [dbo].[UpdateVehicle]    Script Date: 1/13/2021 10:41:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jay Zhang
-- Create date: 01/13/2021
-- Description:	Stored proc to Update 1 Vehicle information
-- =============================================

CREATE PROCEDURE [dbo].[UpdateVehicle]
		@id int,
		@make nvarchar(100),
		@model nvarchar(100),
		@year smallint, 
		@vin nvarchar(30)
AS

UPDATE Vehicle
SET Make = @make, 
	Model = @model,
	Year = @year, 
	VIN = @vin,
	LastUpdatedDateTime = SYSDATETIMEOFFSET()
WHERE Id = @id
GO

