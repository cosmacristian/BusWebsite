
/****** Object:  Database [BusDB]    Script Date: 7/10/2019 10:54:54 PM ******/
CREATE DATABASE [BusDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BusDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BusDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'BusDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BusDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BusDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BusDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BusDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BusDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BusDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BusDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BusDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BusDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BusDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BusDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BusDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BusDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BusDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BusDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BusDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BusDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BusDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BusDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BusDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BusDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BusDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BusDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BusDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BusDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BusDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BusDB] SET  MULTI_USER 
GO
ALTER DATABASE [BusDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BusDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BusDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BusDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BusDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BusDB', N'ON'
GO
ALTER DATABASE [BusDB] SET QUERY_STORE = OFF
GO
USE [BusDB]
GO
/****** Object:  Table [dbo].[Bus]    Script Date: 7/10/2019 10:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bus](
	[BusId] [nvarchar](20) NOT NULL,
	[Actual_Longitude] [float] NOT NULL,
	[Actual_Latitude] [float] NOT NULL,
	[Measurement_Timestamp] [datetime] NOT NULL,
	[BusName] [varchar](50) NULL,
 CONSTRAINT [PK_Bus] PRIMARY KEY CLUSTERED 
(
	[BusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusTrace]    Script Date: 7/10/2019 10:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusTrace](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BusId] [varchar](20) NOT NULL,
	[Longitude] [float] NOT NULL,
	[Latitude] [float] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_BusTrace] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Line]    Script Date: 7/10/2019 10:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Line](
	[ID] [int] NOT NULL,
	[LineID] [int] NOT NULL,
	[StationID] [int] NOT NULL,
	[StationNr] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Line] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measurements]    Script Date: 7/10/2019 10:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BusId] [varchar](20) NOT NULL,
	[Longitude] [float] NOT NULL,
	[Latitude] [float] NOT NULL,
	[Position_Accuracy] [float] NOT NULL,
	[Speed] [float] NOT NULL,
	[Speed_Accuracy] [float] NOT NULL,
	[Direction] [int] NOT NULL,
	[Accel_x] [float] NOT NULL,
	[Accel_y] [float] NOT NULL,
	[Accel_z] [float] NOT NULL,
	[Gyro_x] [float] NOT NULL,
	[Gyro_y] [float] NOT NULL,
	[Gyro_z] [float] NOT NULL,
	[Timestamp] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Measurements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Station]    Script Date: 7/10/2019 10:54:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Station](
	[StationID] [int] NOT NULL,
	[StationName] [nvarchar](50) NOT NULL,
	[Longitude] [float] NOT NULL,
	[Latitude] [float] NOT NULL,
 CONSTRAINT [PK_Station] PRIMARY KEY CLUSTERED 
(
	[StationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bus] ([BusId], [Actual_Longitude], [Actual_Latitude], [Measurement_Timestamp], [BusName]) VALUES (N'26', 24.599051, 46.523656, CAST(N'2019-06-12T01:03:00.000' AS DateTime), N'Sapientia - Aleea Carpati')
INSERT [dbo].[Bus] ([BusId], [Actual_Longitude], [Actual_Latitude], [Measurement_Timestamp], [BusName]) VALUES (N'27', 24.5986195, 46.5234808, CAST(N'2019-06-26T17:34:05.553' AS DateTime), N'Sapientia - Spitalul Judetean')
INSERT [dbo].[Bus] ([BusId], [Actual_Longitude], [Actual_Latitude], [Measurement_Timestamp], [BusName]) VALUES (N'44', 24.6010125, 46.5248785, CAST(N'2019-06-26T18:48:24.000' AS DateTime), N'Sapientia - Combinat')
SET IDENTITY_INSERT [dbo].[BusTrace] ON 

INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (43, N'44', 24.6020014, 46.5243824, CAST(N'2019-06-26T16:13:44.380' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (44, N'44', 24.599186, 46.5268513, CAST(N'2019-06-26T16:14:15.373' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (45, N'44', 24.5972605, 46.5315512, CAST(N'2019-06-26T16:14:48.633' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (46, N'44', 24.5910137, 46.5322139, CAST(N'2019-06-26T16:15:21.900' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (47, N'44', 24.5896157, 46.5336392, CAST(N'2019-06-26T16:15:54.790' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (48, N'44', 24.5917985, 46.5342839, CAST(N'2019-06-26T16:16:26.513' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (49, N'44', 24.5935632, 46.5351441, CAST(N'2019-06-26T16:16:58.187' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (50, N'44', 24.5948922, 46.5360109, CAST(N'2019-06-26T16:17:42.940' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (51, N'44', 24.5926453, 46.5364253, CAST(N'2019-06-26T16:18:13.623' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (52, N'44', 24.5903672, 46.5370617, CAST(N'2019-06-26T16:18:57.630' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (53, N'44', 24.5883662, 46.5382194, CAST(N'2019-06-26T16:19:30.213' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (54, N'44', 24.5871455, 46.538535, CAST(N'2019-06-26T16:20:03.283' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (55, N'44', 24.5845423, 46.5392471, CAST(N'2019-06-26T16:20:36.000' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (56, N'44', 24.5843474, 46.5382029, CAST(N'2019-06-26T16:21:13.007' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (57, N'44', 24.5846244, 46.5365174, CAST(N'2019-06-26T16:21:46.647' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (58, N'44', 24.5842017, 46.5359603, CAST(N'2019-06-26T16:22:19.290' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (59, N'44', 24.5827491, 46.5354487, CAST(N'2019-06-26T16:22:51.830' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (60, N'44', 24.5818725, 46.5360267, CAST(N'2019-06-26T16:23:24.583' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (61, N'44', 24.579713, 46.5354932, CAST(N'2019-06-26T16:23:57.847' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (62, N'44', 24.5782511, 46.5351558, CAST(N'2019-06-26T16:24:30.420' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (63, N'44', 24.5755886, 46.5353911, CAST(N'2019-06-26T16:25:05.390' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (64, N'44', 24.5748445, 46.5356151, CAST(N'2019-06-26T16:25:44.730' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (65, N'44', 24.5738044, 46.5378273, CAST(N'2019-06-26T16:26:30.547' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (66, N'44', 24.5730399, 46.5377663, CAST(N'2019-06-26T16:27:04.250' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (67, N'44', 24.5717954, 46.5376693, CAST(N'2019-06-26T16:27:40.980' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (68, N'44', 24.5718317, 46.5365247, CAST(N'2019-06-26T16:28:13.773' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (69, N'44', 24.5723862, 46.5337713, CAST(N'2019-06-26T16:28:54.910' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (70, N'44', 24.5712142, 46.5330227, CAST(N'2019-06-26T16:29:28.240' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (71, N'44', 24.5687785, 46.5335283, CAST(N'2019-06-26T16:30:05.843' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (72, N'44', 24.5658385, 46.535103, CAST(N'2019-06-26T16:30:41.003' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (73, N'44', 24.5628139, 46.5363404, CAST(N'2019-06-26T16:31:14.723' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (74, N'44', 24.562103, 46.5365723, CAST(N'2019-06-26T16:31:48.087' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (75, N'44', 24.5587731, 46.5373719, CAST(N'2019-06-26T16:32:22.947' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (76, N'44', 24.5581327, 46.5374453, CAST(N'2019-06-26T16:32:59.360' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (77, N'44', 24.5582882, 46.5363034, CAST(N'2019-06-26T16:33:34.493' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (78, N'44', 24.559212, 46.5348452, CAST(N'2019-06-26T16:34:09.293' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (79, N'44', 24.5586873, 46.5325263, CAST(N'2019-06-26T16:34:45.663' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (80, N'44', 24.5576894, 46.5316553, CAST(N'2019-06-26T16:35:17.027' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (81, N'44', 24.5569415, 46.5310315, CAST(N'2019-06-26T16:35:49.207' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (82, N'44', 24.5543512, 46.5288028, CAST(N'2019-06-26T16:36:22.613' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (83, N'44', 24.554013, 46.528806, CAST(N'2019-06-26T16:36:52.440' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (84, N'44', 24.5513411, 46.5275408, CAST(N'2019-06-26T16:37:37.783' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (85, N'44', 24.5509705, 46.5299193, CAST(N'2019-06-26T16:38:09.590' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (86, N'44', 24.5504909, 46.5314498, CAST(N'2019-06-26T16:38:50.147' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (87, N'44', 24.5493739, 46.5306187, CAST(N'2019-06-26T16:39:21.800' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (88, N'44', 24.5475312, 46.5294552, CAST(N'2019-06-26T16:39:54.120' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (89, N'44', 24.5450981, 46.5281693, CAST(N'2019-06-26T16:40:27.130' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (90, N'44', 24.5427605, 46.5275642, CAST(N'2019-06-26T16:40:59.940' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (91, N'44', 24.5398479, 46.5258713, CAST(N'2019-06-26T16:41:32.853' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (92, N'44', 24.5378778, 46.5248972, CAST(N'2019-06-26T16:42:04.300' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (93, N'44', 24.5374178, 46.5246255, CAST(N'2019-06-26T16:42:35.973' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (94, N'44', 24.534523, 46.5234505, CAST(N'2019-06-26T16:43:19.427' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (95, N'44', 24.5328482, 46.5225089, CAST(N'2019-06-26T16:43:53.873' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (96, N'27', 24.6009502, 46.5252281, CAST(N'2019-06-26T16:44:18.657' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (97, N'44', 24.5313643, 46.5218631, CAST(N'2019-06-26T16:44:41.337' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (98, N'44', 24.5275309, 46.5203241, CAST(N'2019-06-26T16:45:13.437' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (99, N'27', 24.595325, 46.5304828, CAST(N'2019-06-26T16:45:18.423' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (100, N'44', 24.527748, 46.5201948, CAST(N'2019-06-26T16:45:55.573' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (101, N'27', 24.5920865, 46.5320076, CAST(N'2019-06-26T16:45:57.043' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (102, N'44', 24.5258957, 46.5187606, CAST(N'2019-06-26T16:46:20.113' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (103, N'27', 24.5886279, 46.5329411, CAST(N'2019-06-26T16:46:37.883' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (104, N'44', 24.5230616, 46.5177858, CAST(N'2019-06-26T16:47:01.880' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (105, N'44', 24.5212027, 46.5163571, CAST(N'2019-06-26T16:47:27.397' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (106, N'27', 24.5865586, 46.5338952, CAST(N'2019-06-26T16:47:38.257' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (107, N'44', 24.5180756, 46.5157282, CAST(N'2019-06-26T16:48:00.893' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (108, N'27', 24.5839004, 46.5349014, CAST(N'2019-06-26T16:48:24.547' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (109, N'44', 24.5142829, 46.5133421, CAST(N'2019-06-26T16:48:41.673' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (110, N'27', 24.5836248, 46.535117, CAST(N'2019-06-26T16:48:54.643' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (111, N'44', 24.5105405, 46.5126668, CAST(N'2019-06-26T16:49:13.197' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (112, N'27', 24.5836659, 46.5350536, CAST(N'2019-06-26T16:49:27.540' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (113, N'44', 24.5106479, 46.5115032, CAST(N'2019-06-26T16:49:45.290' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (114, N'27', 24.583299, 46.5349142, CAST(N'2019-06-26T16:49:57.520' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (115, N'27', 24.5825453, 46.5342941, CAST(N'2019-06-26T16:50:29.583' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (116, N'27', 24.5793819, 46.5330221, CAST(N'2019-06-26T16:51:30.450' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (117, N'27', 24.5786555, 46.53321, CAST(N'2019-06-26T16:52:00.623' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (118, N'27', 24.5753327, 46.53296, CAST(N'2019-06-26T16:52:32.963' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (119, N'27', 24.5716575, 46.5330156, CAST(N'2019-06-26T16:53:04.707' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (120, N'27', 24.5711363, 46.5332901, CAST(N'2019-06-26T16:53:35.030' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (121, N'27', 24.5702534, 46.5336363, CAST(N'2019-06-26T16:54:04.727' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (122, N'27', 24.5667874, 46.5336485, CAST(N'2019-06-26T16:54:35.393' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (123, N'27', 24.5653646, 46.535373, CAST(N'2019-06-26T16:55:13.270' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (124, N'27', 24.5623884, 46.5364097, CAST(N'2019-06-26T16:55:48.433' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (125, N'27', 24.5586155, 46.5374607, CAST(N'2019-06-26T16:56:26.977' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (126, N'27', 24.55809, 46.537907, CAST(N'2019-06-26T16:57:14.510' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (127, N'27', 24.5588508, 46.5398792, CAST(N'2019-06-26T16:57:44.933' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (128, N'27', 24.5588592, 46.5393524, CAST(N'2019-06-26T16:58:14.403' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (129, N'27', 24.558731, 46.5396083, CAST(N'2019-06-26T16:58:58.140' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (130, N'27', 24.557523, 46.5415305, CAST(N'2019-06-26T16:59:27.973' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (131, N'27', 24.5599158, 46.5435938, CAST(N'2019-06-26T17:00:00.577' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (132, N'27', 24.5602995, 46.5438159, CAST(N'2019-06-26T17:00:32.657' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (133, N'27', 24.5623387, 46.5451015, CAST(N'2019-06-26T17:01:06.003' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (134, N'27', 24.5633739, 46.5458269, CAST(N'2019-06-26T17:01:35.730' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (135, N'27', 24.5636812, 46.5467644, CAST(N'2019-06-26T17:02:08.440' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (136, N'27', 24.5642989, 46.5477572, CAST(N'2019-06-26T17:02:44.907' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (137, N'27', 24.5644631, 46.5482136, CAST(N'2019-06-26T17:03:13.873' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (138, N'27', 24.5653755, 46.5507911, CAST(N'2019-06-26T17:03:57.757' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (139, N'27', 24.5659393, 46.5514108, CAST(N'2019-06-26T17:04:27.710' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (140, N'27', 24.5670751, 46.5522637, CAST(N'2019-06-26T17:04:59.553' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (141, N'27', 24.5685149, 46.5533856, CAST(N'2019-06-26T17:05:31.840' AS DateTime))
GO
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (142, N'27', 24.5708241, 46.5550721, CAST(N'2019-06-26T17:06:05.197' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (143, N'27', 24.5747573, 46.557224, CAST(N'2019-06-26T17:06:45.510' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (144, N'27', 24.5758005, 46.5577898, CAST(N'2019-06-26T17:07:23.317' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (145, N'27', 24.5760309, 46.5577892, CAST(N'2019-06-26T17:08:05.497' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (146, N'27', 24.5789918, 46.5574362, CAST(N'2019-06-26T17:08:50.510' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (147, N'27', 24.5799854, 46.5594211, CAST(N'2019-06-26T17:09:27.197' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (148, N'27', 24.5823692, 46.5594894, CAST(N'2019-06-26T17:10:32.180' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (149, N'27', 24.5807023, 46.5558976, CAST(N'2019-06-26T17:11:51.073' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (150, N'27', 24.5789186, 46.5544426, CAST(N'2019-06-26T17:12:29.383' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (151, N'27', 24.5768529, 46.5531425, CAST(N'2019-06-26T17:13:04.997' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (152, N'27', 24.5744794, 46.5512834, CAST(N'2019-06-26T17:13:43.387' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (153, N'27', 24.5732322, 46.5505956, CAST(N'2019-06-26T17:14:36.053' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (154, N'27', 24.5720858, 46.5478337, CAST(N'2019-06-26T17:15:10.897' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (155, N'27', 24.5693321, 46.5466589, CAST(N'2019-06-26T17:15:36.933' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (156, N'27', 24.5680215, 46.5463701, CAST(N'2019-06-26T17:16:28.677' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (157, N'27', 24.5630456, 46.5464153, CAST(N'2019-06-26T17:17:16.650' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (158, N'27', 24.5611403, 46.5455725, CAST(N'2019-06-26T17:17:46.593' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (159, N'27', 24.5613891, 46.5459366, CAST(N'2019-06-26T17:18:19.597' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (160, N'27', 24.5596009, 46.5437674, CAST(N'2019-06-26T17:18:54.347' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (161, N'27', 24.5575978, 46.5407641, CAST(N'2019-06-26T17:19:24.097' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (162, N'27', 24.5575121, 46.5404647, CAST(N'2019-06-26T17:19:56.203' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (163, N'27', 24.5582678, 46.5401891, CAST(N'2019-06-26T17:20:57.497' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (164, N'27', 24.5608664, 46.5393616, CAST(N'2019-06-26T17:21:34.543' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (165, N'27', 24.5626586, 46.5396328, CAST(N'2019-06-26T17:22:14.403' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (166, N'27', 24.565964, 46.5380702, CAST(N'2019-06-26T17:22:51.577' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (167, N'27', 24.5652051, 46.5349065, CAST(N'2019-06-26T17:24:08.343' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (168, N'27', 24.5678556, 46.5332915, CAST(N'2019-06-26T17:24:39.947' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (169, N'27', 24.5722176, 46.5328238, CAST(N'2019-06-26T17:25:12.407' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (170, N'27', 24.5722713, 46.5327494, CAST(N'2019-06-26T17:25:44.530' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (171, N'27', 24.5761201, 46.5328236, CAST(N'2019-06-26T17:26:29.430' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (172, N'27', 24.5796256, 46.5329625, CAST(N'2019-06-26T17:27:26.903' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (173, N'27', 24.5818283, 46.5335463, CAST(N'2019-06-26T17:27:56.913' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (174, N'27', 24.5833992, 46.5349517, CAST(N'2019-06-26T17:28:28.417' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (175, N'27', 24.5843551, 46.5346317, CAST(N'2019-06-26T17:29:01.563' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (176, N'27', 24.5856368, 46.5341309, CAST(N'2019-06-26T17:29:31.817' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (177, N'27', 24.5893276, 46.5328713, CAST(N'2019-06-26T17:30:04.440' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (178, N'27', 24.5897343, 46.5326618, CAST(N'2019-06-26T17:30:36.610' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (179, N'27', 24.5923824, 46.5319202, CAST(N'2019-06-26T17:31:06.633' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (180, N'27', 24.5931018, 46.5308896, CAST(N'2019-06-26T17:31:37.267' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (181, N'27', 24.5980571, 46.5274915, CAST(N'2019-06-26T17:32:11.173' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (182, N'27', 24.6009079, 46.5246342, CAST(N'2019-06-26T17:33:25.433' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (183, N'27', 24.5986195, 46.5234808, CAST(N'2019-06-26T17:34:05.553' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (184, N'44', 24.5108932, 46.5124293, CAST(N'2019-06-26T18:14:28.240' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (185, N'44', 24.5117582, 46.5122102, CAST(N'2019-06-26T18:15:04.730' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (186, N'44', 24.5194087, 46.5159225, CAST(N'2019-06-26T18:15:35.200' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (187, N'44', 24.5220822, 46.5181129, CAST(N'2019-06-26T18:16:09.557' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (188, N'44', 24.5285971, 46.5205501, CAST(N'2019-06-26T18:17:01.267' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (189, N'44', 24.5314761, 46.5217604, CAST(N'2019-06-26T18:17:39.337' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (190, N'44', 24.5316149, 46.5218464, CAST(N'2019-06-26T18:18:10.297' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (191, N'44', 24.5317933, 46.5218644, CAST(N'2019-06-26T18:18:46.837' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (192, N'44', 24.5335499, 46.5226283, CAST(N'2019-06-26T18:19:10.543' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (193, N'44', 24.5354854, 46.5236093, CAST(N'2019-06-26T18:19:49.300' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (194, N'44', 24.5376774, 46.5247936, CAST(N'2019-06-26T18:20:12.570' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (195, N'44', 24.5384114, 46.5253747, CAST(N'2019-06-26T18:21:02.413' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (196, N'44', 24.538302, 46.5254008, CAST(N'2019-06-26T18:21:28.917' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (197, N'44', 24.5412585, 46.5267833, CAST(N'2019-06-26T18:22:06.687' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (198, N'44', 24.5450248, 46.5282241, CAST(N'2019-06-26T18:22:28.907' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (199, N'44', 24.5460929, 46.5291569, CAST(N'2019-06-26T18:23:01.943' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (200, N'44', 24.5491382, 46.5309113, CAST(N'2019-06-26T18:23:50.300' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (201, N'44', 24.5503605, 46.5315705, CAST(N'2019-06-26T18:24:26.867' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (202, N'44', 24.5509874, 46.5282463, CAST(N'2019-06-26T18:25:04.630' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (203, N'44', 24.5531062, 46.5284762, CAST(N'2019-06-26T18:25:42.377' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (204, N'44', 24.5558265, 46.5301754, CAST(N'2019-06-26T18:26:26.590' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (205, N'44', 24.5564647, 46.5307095, CAST(N'2019-06-26T18:26:57.010' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (206, N'44', 24.5560547, 46.5323722, CAST(N'2019-06-26T18:27:32.837' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (207, N'44', 24.5593472, 46.5331656, CAST(N'2019-06-26T18:28:05.400' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (208, N'44', 24.5586717, 46.5362952, CAST(N'2019-06-26T18:28:54.047' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (209, N'44', 24.5583394, 46.5369873, CAST(N'2019-06-26T18:29:33.837' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (210, N'44', 24.5597353, 46.5376215, CAST(N'2019-06-26T18:30:18.220' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (211, N'44', 24.5645152, 46.5354276, CAST(N'2019-06-26T18:30:59.003' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (212, N'44', 24.5663245, 46.534055, CAST(N'2019-06-26T18:31:43.167' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (213, N'44', 24.5696831, 46.5336531, CAST(N'2019-06-26T18:32:25.083' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (214, N'44', 24.5717209, 46.5330741, CAST(N'2019-06-26T18:33:12.573' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (215, N'44', 24.5720899, 46.5355354, CAST(N'2019-06-26T18:33:44.267' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (216, N'44', 24.5715249, 46.5376765, CAST(N'2019-06-26T18:34:22.497' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (217, N'44', 24.5732375, 46.538088, CAST(N'2019-06-26T18:34:55.057' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (218, N'44', 24.57484, 46.5358147, CAST(N'2019-06-26T18:35:39.437' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (219, N'44', 24.5753325, 46.5354479, CAST(N'2019-06-26T18:36:12.187' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (220, N'44', 24.5769845, 46.5359304, CAST(N'2019-06-26T18:36:42.217' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (221, N'44', 24.5793248, 46.5353079, CAST(N'2019-06-26T18:37:25.053' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (222, N'44', 24.5805958, 46.536034, CAST(N'2019-06-26T18:38:04.017' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (223, N'44', 24.5824444, 46.5354433, CAST(N'2019-06-26T18:39:08.580' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (224, N'44', 24.583781, 46.5356372, CAST(N'2019-06-26T18:39:39.477' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (225, N'44', 24.5846077, 46.5371273, CAST(N'2019-06-26T18:40:11.487' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (226, N'44', 24.5843133, 46.5378927, CAST(N'2019-06-26T18:40:44.063' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (227, N'44', 24.5844471, 46.5392219, CAST(N'2019-06-26T18:41:19.197' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (228, N'44', 24.58819, 46.5383225, CAST(N'2019-06-26T18:41:58.670' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (229, N'44', 24.5912833, 46.5367139, CAST(N'2019-06-26T18:42:31.187' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (230, N'44', 24.5930518, 46.53652, CAST(N'2019-06-26T18:43:03.793' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (231, N'44', 24.5946402, 46.5353405, CAST(N'2019-06-26T18:43:37.480' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (232, N'44', 24.5930986, 46.53487, CAST(N'2019-06-26T18:44:07.620' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (233, N'44', 24.5898796, 46.5337962, CAST(N'2019-06-26T18:44:52.480' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (234, N'44', 24.5892316, 46.532944, CAST(N'2019-06-26T18:45:22.763' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (235, N'44', 24.5897774, 46.5327493, CAST(N'2019-06-26T18:45:56.013' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (236, N'44', 24.5920198, 46.5320518, CAST(N'2019-06-26T18:46:28.430' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (237, N'44', 24.5950737, 46.5310698, CAST(N'2019-06-26T18:47:03.563' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (238, N'44', 24.5984578, 46.5276369, CAST(N'2019-06-26T18:47:48.077' AS DateTime))
INSERT [dbo].[BusTrace] ([Id], [BusId], [Longitude], [Latitude], [Timestamp]) VALUES (239, N'44', 24.6010125, 46.5248785, CAST(N'2019-06-26T18:48:24.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[BusTrace] OFF
SET IDENTITY_INSERT [dbo].[Line] ON 

INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (0, 44, 1, 16)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (1, 44, 2, 17)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (2, 44, 3, 18)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (3, 44, 4, 19)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (4, 44, 5, 20)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (5, 44, 6, 21)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (6, 44, 7, 22)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (7, 44, 8, 23)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (8, 44, 9, 24)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (9, 44, 10, 25)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (10, 44, 11, 26)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (11, 44, 12, 27)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (12, 44, 13, 28)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (13, 44, 14, 29)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (14, 44, 15, 30)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (15, 44, 16, 31)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (16, 44, 17, 32)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (17, 44, 18, 33)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (18, 44, 19, 34)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (19, 44, 20, 35)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (20, 44, 21, 36)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (21, 44, 22, 37)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (22, 44, 23, 38)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (23, 44, 24, 40)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (24, 44, 25, 41)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (25, 44, 26, 42)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (26, 44, 27, 43)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (27, 44, 28, 44)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (28, 44, 29, 45)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (29, 44, 30, 46)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (30, 44, 31, 47)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (31, 44, 32, 48)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (32, 44, 33, 49)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (33, 44, 34, 50)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (34, 44, 35, 51)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (35, 44, 36, 52)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (36, 44, 37, 53)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (37, 44, 38, 54)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (38, 44, 39, 55)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (39, 44, 40, 56)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (40, 44, 41, 57)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (41, 44, 42, 58)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (42, 44, 43, 59)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (43, 44, 44, 60)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (44, 44, 1, 61)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (45, 26, 1, 62)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (46, 26, 2, 63)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (47, 26, 3, 64)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (48, 26, 4, 65)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (49, 26, 5, 66)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (50, 26, 6, 67)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (51, 26, 45, 68)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (52, 26, 46, 69)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (53, 26, 47, 70)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (54, 26, 48, 71)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (55, 26, 49, 72)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (56, 26, 50, 73)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (57, 26, 51, 74)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (58, 26, 52, 75)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (59, 26, 53, 76)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (60, 26, 54, 77)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (61, 26, 55, 78)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (62, 26, 56, 79)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (63, 26, 57, 80)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (64, 26, 58, 81)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (65, 26, 59, 82)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (66, 26, 40, 84)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (67, 26, 41, 85)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (68, 26, 42, 86)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (69, 26, 43, 87)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (70, 26, 44, 88)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (71, 26, 1, 89)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (72, 27, 1, 90)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (73, 27, 2, 91)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (74, 27, 60, 92)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (75, 27, 61, 93)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (76, 27, 62, 94)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (77, 27, 63, 95)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (78, 27, 10, 96)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (79, 27, 11, 97)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (80, 27, 12, 98)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (81, 27, 76, 99)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (82, 27, 47, 100)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (83, 27, 64, 101)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (84, 27, 65, 107)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (85, 27, 66, 108)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (86, 27, 67, 109)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (87, 27, 68, 110)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (88, 27, 69, 111)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (89, 27, 70, 112)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (90, 27, 71, 113)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (91, 27, 56, 114)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (92, 27, 57, 115)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (93, 27, 72, 116)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (94, 27, 61, 117)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (95, 27, 73, 118)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (96, 27, 74, 119)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (97, 27, 75, 120)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (98, 27, 43, 121)
GO
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (99, 27, 44, 122)
INSERT [dbo].[Line] ([ID], [LineID], [StationID], [StationNr]) VALUES (100, 27, 1, 123)
SET IDENTITY_INSERT [dbo].[Line] OFF
SET IDENTITY_INSERT [dbo].[Measurements] ON 

INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (8, N'44', 22.5703566, 47.6848141, 4, 26.529590606689453, 0, 270, -1.0247496366500855, -0.23224465548992157, 12.292206764221191, -0.027479773387312889, -0.11570154875516892, -0.015609439462423325, CAST(N'2019-07-03T15:09:54.3334061' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (9, N'44', 22.5600151, 47.6849143, 4, 24.69194221496582, 0, 270, -1.2138973474502564, 0.42618092894554138, 9.1988039016723633, -0.0024342979304492474, 0.035793036222457886, -0.03760058805346489, CAST(N'2019-07-03T15:10:24.2665055' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (10, N'44', 22.5496237, 47.6849847, 4, 25.710657119750977, 0, 270, -1.9130256175994873, 1.4629019498825073, 9.3759803771972656, 0.023832906037569046, 0.053508128970861435, -0.030881071463227272, CAST(N'2019-07-03T15:10:54.8019442' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (11, N'44', 22.5402693, 47.6850993, 4, 20.486307144165039, 0, 270, -0.13886794447898865, 0.70152252912521362, 8.9162797927856445, 0.0067286808043718338, 0.03151698037981987, -0.016220305114984512, CAST(N'2019-07-03T15:11:25.4425026' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (12, N'44', 22.5309345, 47.6851382, 4, 23.809661865234375, 0, 271, -1.8220431804656982, 0.62251144647598267, 9.6776590347290039, -0.020760254934430122, 0.048010341823101044, 0.00638170912861824, CAST(N'2019-07-03T15:11:56.3035002' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (13, N'44', 22.5210975, 47.6852486, 6, 24.82154655456543, 0, 271, -2.2482240200042725, 0.33040991425514221, 8.861210823059082, 0.1472276896238327, -0.025293486192822456, 0.016155553981661797, CAST(N'2019-07-03T15:12:27.2945096' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (14, N'44', 22.5115895, 47.685356, 4, 21.642623901367188, 0, 269, -2.3056867122650146, 0.99601829051971436, 10.276227951049805, -0.051303517073392868, 0.31373673677444458, -0.034546259790658951, CAST(N'2019-07-03T15:12:57.2975043' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (15, N'44', 22.5055993, 47.6853108, 4, 16.687973022460938, 0, 269, -1.1899546384811401, 2.1692130565643311, 8.0399751663208, 0.13073432445526123, -0.82491606473922729, 0.11633745580911636, CAST(N'2019-07-03T15:13:28.3166008' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (16, N'44', 22.4986015, 47.6853097, 4, 17.040184020996094, 0, 269, 2.5953938961029053, 2.6839821338653564, 9.5004825592041016, 0.39768242835998535, -0.17006854712963104, -0.10601749271154404, CAST(N'2019-07-03T15:13:59.2705059' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (17, N'44', 22.4916932, 47.6853111, 4, 11.690582275390625, 0, 269, 0.91221868991851807, 1.3312168121337891, 10.245101928710938, -0.098340138792991638, 0.15979868173599243, -0.00033780848025344312, CAST(N'2019-07-03T15:14:30.2796078' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (18, N'44', 22.4883047, 47.6852798, 3.621999979019165, 3.1896317005157471, 0, 268, 1.6305011510849, 2.6217308044433594, 9.0312042236328125, 0.029330695047974586, -0.49138367176055908, 0.025929396972060204, CAST(N'2019-07-03T15:15:00.3098020' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (19, N'44', 22.4795558, 47.6842084, 4, 10.480077743530273, 0, 250, -0.46688359975814819, 0.70391678810119629, 10.877190589904785, 0.29261362552642822, -1.6880687475204468, -0.041876643896102905, CAST(N'2019-07-03T15:16:01.3901923' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (20, N'44', 22.4836717, 47.6852347, 4, 11.751714706420898, 0, 259, -0.34477555751800537, 2.542719841003418, 8.5044641494750977, 0.078810781240463257, -0.02407175675034523, 0.0045491131022572517, CAST(N'2019-07-03T15:16:02.7192059' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (21, N'44', 22.47617, 47.6835454, 4, 4.789492130279541, 0, 256, 0.6201171875, 0.88827598094940186, 9.9362401962280273, -0.027479773387312889, 0.079775340855121613, -0.0076681915670633316, CAST(N'2019-07-03T15:16:33.0904040' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (22, N'44', 22.4727109, 47.6835321, 6, 6.8146882057189941, 0, 272, -0.81405341625213623, -0.63687711954116821, 9.71357250213623, 0.0055069504305720329, 0.091992639005184174, -0.011944248341023922, CAST(N'2019-07-03T15:17:04.4776845' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (23, N'44', 22.4694605, 47.6829969, 6, 6.4364690780639648, 0, 255, -0.797293484210968, 1.2162915468215942, 11.051972389221191, -0.151485413312912, 0.30640634894371033, 0.09129197895526886, CAST(N'2019-07-03T15:17:35.3711887' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (24, N'44', 22.4642563, 47.6816021, 4, 15.818113327026367, 0, 246, 0.1891477108001709, 1.4437477588653565, 10.1421480178833, -0.11910955607891083, -0.085769139230251312, 0.036314107477664948, CAST(N'2019-07-03T15:18:04.3199884' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (25, N'44', 22.4587527, 47.6799015, 4, 7.8257107734680176, 0, 244, 1.1636176109313965, -1.18037748336792, 11.624204635620117, -0.027479773387312889, -0.19144883751869202, -0.077917695045471191, CAST(N'2019-07-03T15:18:35.3061867' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (26, N'44', 22.4563611, 47.6822859, 8, 14.306374549865723, 0, 341, 1.721483588218689, 1.9417568445205689, 8.7774114608764648, 0.053154438734054565, -0.062556266784667969, -0.12373258918523789, CAST(N'2019-07-03T15:19:05.3893892' AS DateTime2))
INSERT [dbo].[Measurements] ([Id], [BusId], [Longitude], [Latitude], [Position_Accuracy], [Speed], [Speed_Accuracy], [Direction], [Accel_x], [Accel_y], [Accel_z], [Gyro_x], [Gyro_y], [Gyro_z], [Timestamp]) VALUES (27, N'44', 22.4551493, 47.6867974, 6, 14.647964477539063, 0, 354, 0.39026680588722229, 1.4940274953842163, 9.6728706359863281, -0.013429872691631317, 0.16712905466556549, 0.014322957023978233, CAST(N'2019-07-03T15:19:39.1235982' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Measurements] OFF
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (1, N'Sapientia', 24.598617, 46.523454)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (2, N'Business', 24.599038, 46.527224)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (3, N'Regele Ferdinand', 24.589764, 46.533688)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (4, N'Piaţa Diamant', 24.591227, 46.536912)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (5, N'Înfrăţirii', 24.5820326, 46.5384713)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (6, N'Fortuna', 24.5842053, 46.5351228)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (7, N'Moldovei', 24.578815, 46.5352696)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (8, N'Macul Roşu', 24.5762405, 46.5357569)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (9, N'Dacia', 24.572695, 46.537805)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (10, N'Panduru', 24.5688484, 46.5336265)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (11, N'Izvoru Rece', 24.56352, 46.5348439)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (12, N'Predeal', 24.5620513, 46.5366702)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (13, N'Cireşului ', 24.5583722, 46.5361617)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (14, N'Dâmbul Pietros', 24.5553794, 46.5319203)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (15, N'Ciucaş', 24.5519007, 46.5290591)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (16, N'Gara CFR', 24.546724, 46.5307678)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (17, N'Autogara Voiajor', 24.544805, 46.5283072)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (18, N'Traian Vuia', 24.5390728, 46.5257986)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (19, N'Record 2', 24.531274, 46.5218967)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (20, N'Gheorghe Doja', 24.5290783, 46.5208112)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (21, N'Chimie', 24.5237158, 46.5181739)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (22, N'Metro', 24.5183173, 46.515467)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (23, N'Combinat', 24.5106461, 46.5116588)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (24, N'European Retail Park', 24.5110409, 46.5117342)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (25, N'Metro', 24.5182564, 46.5152953)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (26, N'Conserve', 24.5248302, 46.5185786)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (27, N'Record', 24.5315652, 46.5219164)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (28, N'Prodcomplex', 24.5377097, 46.5249653)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (29, N'Autogara Voiajor', 24.5460268, 46.5287363)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (30, N'Trecătorul', 24.5496798, 46.5305279)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (31, N'Olimp', 24.555106, 46.5295914)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (32, N'Cosmos', 24.5569914, 46.5328216)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (33, N'Avram Iancu', 24.5563021, 46.536224)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (34, N'Predeal', 24.5587706, 46.5380177)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (35, N'Izvoru  Rece', 24.5656437, 46.5348212)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (36, N'Eon', 24.5706962, 46.5335431)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (37, N'Dacia', 24.574212, 46.537433)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (38, N'Macul Roşu', 24.57556, 46.53547)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (39, N'Moldovei', 24.5790609, 46.535332)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (40, N'Poclos', 24.5844355, 46.5377614)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (41, N'Tudor Vladimirescu', 24.5848114, 46.5390979)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (42, N'Piaţa Diamant', 24.5912237, 46.5367688)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (43, N'Corina 2', 24.5876062, 46.532543)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (44, N'Business', 24.599536, 46.526451)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (45, N'Lalelelor', 24.5741787, 46.539094)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (46, N'Izvor', 24.56048, 46.539675)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (47, N' P-ţa Trandafirilor', 24.560172, 46.543701)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (48, N'Evidenţa Populaţiei', 24.560497, 46.54758)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (49, N'Cocoşul De Aur', 24.555873, 46.550721)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (50, N'Aleea Carpaţi', 24.557459, 46.553144)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (51, N'Ştrandul 1 Mai', 24.564191, 46.55706)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (52, N'Aleea Carpaţi', 24.5635936, 46.5566913)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (53, N'Darina', 24.558112, 46.553596)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (54, N'Electrica', 24.55822, 46.550567)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (55, N'Eroilor Martirii', 24.558356, 46.548261)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (56, N'P-ţa Teatrului', 24.562527, 46.546028)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (57, N'Poli 2', 24.561135, 46.539366)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (58, N'Europa', 24.570258, 46.538646)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (59, N'Buşteni ', 24.575226, 46.538763)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (60, N'Corina1', 24.588306, 46.533258)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (61, N'Pandurilor', 24.582385, 46.534209)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (62, N'Mari Cristi', 24.57885, 46.533297)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (63, N'MBO', 24.570482, 46.533741)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (64, N'Revoluţiei', 24.564427, 46.547754)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (65, N'P-ţa Republicii', 24.567163, 46.552251)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (66, N'22 Decembrie 1989', 24.575885, 46.557676)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (67, N'Spitalul Judeţean', 24.581545, 46.559175)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (68, N'Parcul Eroilor', 24.580105, 46.555698)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (69, N'Clinica de Oncologie', 24.578301, 46.55417)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (70, N'Braseria Universităţii', 24.573731, 46.550865)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (71, N'Nicolae Iorga', 24.569285, 46.546701)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (72, N'Budai Nagy Antal ', 24.565492, 46.534915)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (73, N'Erdely', 24.573676, 46.532998)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (74, N'Mari Cristi', 24.579488, 46.533048)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (75, N'B-dul 1 Decembrie 1918', 24.583729, 46.534781)
INSERT [dbo].[Station] ([StationID], [StationName], [Longitude], [Latitude]) VALUES (76, N'Crinului', 24.557995, 46.537457)
ALTER TABLE [dbo].[Line]  WITH CHECK ADD  CONSTRAINT [FK_Line_Station] FOREIGN KEY([StationID])
REFERENCES [dbo].[Station] ([StationID])
GO
ALTER TABLE [dbo].[Line] CHECK CONSTRAINT [FK_Line_Station]
GO
ALTER DATABASE [BusDB] SET  READ_WRITE 
GO
