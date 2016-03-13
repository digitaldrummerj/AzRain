/*


USE master;
GO

	IF EXISTS(SELECT * FROM sys.databases WHERE name = 'RescuingAnimalsInNeed')
	DROP DATABASE RescuingAnimalsInNeed

	CREATE DATABASE RescuingAnimalsInNeed
    ALTER DATABASE  RescuingAnimalsInNeed MODIFY FILE
    (NAME = RescuingAnimalsInNeed, SIZE = 200MB, MAXSIZE = UNLIMITED, FILEGROWTH = 200MB);


-- ***************************************************************************************/

USE RescuingAnimalsInNeed;
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[StateCityZip](
	[StateCityZipID] [int] IDENTITY(1,1) NOT NULL,
	[Zipcode] [varchar](10) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [char](2) NOT NULL,
	[LocationText] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StateCityZipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE TABLE [dbo].[GroupSetup](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[StateCityZipID] [int] NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
	[Address] [varchar](50) NULL,
	[PhoneNumber] [char](10) NULL,
	[FaxNumber] [char](10) NULL,
	[WebSite] [varchar](50) NULL,
	[501c3Number] [char](10) NULL,
	[DirectorName] [varchar](50) NOT NULL,
	[DirectorPhonNumber] [char](10) NULL,
	[DirectorFaxNumber] [char](10) NULL,
	[DirectorEmail] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--SET ANSI_PADDING OFF
--GO

--ALTER TABLE [dbo].[GroupSetup]  WITH CHECK ADD  CONSTRAINT [FK_GroupSetup_StateCityZip] FOREIGN KEY([StateCityZipID])
--REFERENCES [dbo].[StateCityZip] ([StateCityZipID])
--GO

--ALTER TABLE [dbo].[GroupSetup] CHECK CONSTRAINT [FK_GroupSetup_StateCityZip]
--GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GroupEmergencyNumbers](
	[GroupEmergencyNumbersID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[ContactName] [varchar](50) NOT NULL,
	[ContactPhoneNumber] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupEmergencyNumbersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[GroupEmergencyNumbers]  WITH CHECK ADD  CONSTRAINT [FK_GroupEmergencyNumbers_GroupSetup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[GroupSetup] ([GroupID])
GO

ALTER TABLE [dbo].[GroupEmergencyNumbers] CHECK CONSTRAINT [FK_GroupEmergencyNumbers_GroupSetup]
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[AnimalIntake](
	[AnimalIntakeID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[IntakeDate] [date] NOT NULL,
	[FelineCanine] [char](1) NULL,
	[AnimalNumber] [int] NOT NULL,
	[AnimalID] [nvarchar](25) NULL,
	[ExitDate] [date] NULL,
	[Location] [char](5) NULL,
	[AnimalName] [nvarchar](20) NULL,
	[DOB] [date] NULL,
	[Sex] [char](1) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Microchip] [char](20) NULL,
	[Photo] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[AnimalIntakeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[AnimalIntake]  WITH CHECK ADD  CONSTRAINT [FK_AnimalIntake_GroupSetup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[GroupSetup] ([GroupID])
GO

ALTER TABLE [dbo].[AnimalIntake] CHECK CONSTRAINT [FK_AnimalIntake_GroupSetup]
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[IntakeRecord](
	[IntakeHealthRecordID] [int] IDENTITY(1,1) NOT NULL,
	[AnimalIntakeID] [int] NOT NULL,
	[FirstVacinationDate] [date] NULL,
	[SecondVacinationDate] [date] NULL,
	[ThirdVacinationDate] [date] NULL,
	[Rabies] [date] NULL,
	[FelvFIVTest] [date] NULL,
	[FleaTickTreatment] [date] NULL,
	[Other1] [date] NULL,
	[Other2] [date] NULL,
	[Other3] [date] NULL,
	[Other4] [date] NULL,
	[SpayNuter] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IntakeHealthRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[IntakeRecord]  WITH CHECK ADD  CONSTRAINT [FK_IntakeRecord_AnimalIntake] FOREIGN KEY([AnimalIntakeID])
REFERENCES [dbo].[AnimalIntake] ([AnimalIntakeID])
GO

ALTER TABLE [dbo].[IntakeRecord] CHECK CONSTRAINT [FK_IntakeRecord_AnimalIntake]
GO

CREATE TABLE [dbo].[DailyRecord](
	[DailyHealthRecordID] [int] IDENTITY(1,1) NOT NULL,
	[AnimalIntakeID] [int] NOT NULL,
	[ObservationDateTime] [datetime] NULL,
	[WeightInKg] [numeric](5, 2) NULL,
	[TemperatureF] [numeric](5, 2) NULL,
	[Eyes] [char](1) NULL,
	[Ears] [char](1) NULL,
	[Nose] [char](1) NULL,
	[Body] [char](1) NULL,
	[Stool] [char](1) NULL,
	[Urine] [char](1) NULL,
	[Comment] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[DailyHealthRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[DailyRecord]  WITH CHECK ADD  CONSTRAINT [FK_DailyRecord_AnimalIntake] FOREIGN KEY([AnimalIntakeID])
REFERENCES [dbo].[AnimalIntake] ([AnimalIntakeID])
GO

ALTER TABLE [dbo].[DailyRecord] CHECK CONSTRAINT [FK_DailyRecord_AnimalIntake]
GO