USE [master]
GO
/****** Object:  Database [QLSVTT]    Script Date: 4/12/2024 8:54:59 PM ******/
CREATE DATABASE [QLSVTT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLSVTT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QLSVTT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLSVTT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\QLSVTT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLSVTT] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLSVTT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLSVTT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLSVTT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLSVTT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLSVTT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLSVTT] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLSVTT] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLSVTT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLSVTT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLSVTT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLSVTT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLSVTT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLSVTT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLSVTT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLSVTT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLSVTT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLSVTT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLSVTT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLSVTT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLSVTT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLSVTT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLSVTT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLSVTT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLSVTT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLSVTT] SET  MULTI_USER 
GO
ALTER DATABASE [QLSVTT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLSVTT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLSVTT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLSVTT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLSVTT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLSVTT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLSVTT] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLSVTT] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLSVTT]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/12/2024 8:55:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](max) NULL,
	[RoleID] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK__TaiKhoan__3214EC2738ACB4DD] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/12/2024 8:55:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](30) NULL,
	[PhoneNumber] [nvarchar](11) NULL,
	[Address] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[CompanyAddress] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_EmployeeID] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Internship]    Script Date: 4/12/2024 8:55:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Internship](
	[InternShipID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[EmployeeID] [int] NULL,
	[TeacherID] [int] NULL,
	[Start_Day] [date] NULL,
	[End_Day] [date] NULL,
 CONSTRAINT [PK__ThucTap__3214EC2771FF90AF] PRIMARY KEY CLUSTERED 
(
	[InternShipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/12/2024 8:55:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IDRole] [int] NOT NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[IDRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Score]    Script Date: 4/12/2024 8:55:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Score](
	[ScoreID] [int] IDENTITY(1,1) NOT NULL,
	[Score1] [decimal](18, 2) NULL,
	[Score2] [decimal](18, 2) NULL,
	[Score3] [decimal](18, 2) NULL,
	[Score4] [decimal](18, 2) NULL,
	[Score5] [decimal](18, 2) NULL,
	[Assessment] [nvarchar](max) NULL,
	[TopicID] [int] NULL,
 CONSTRAINT [PK__Diem__3214EC27CAFB2D41] PRIMARY KEY CLUSTERED 
(
	[ScoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 4/12/2024 8:55:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentCode] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[Gender] [nvarchar](10) NULL,
	[DateOfBirth] [date] NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](11) NULL,
	[Classroom] [nvarchar](30) NULL,
	[GPAScore] [decimal](18, 2) NULL,
	[LetterScore] [nvarchar](5) NULL,
	[Address] [nvarchar](100) NULL,
 CONSTRAINT [PK__SinhVien__3214EC27B1D3DDDC] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 4/12/2024 8:55:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Gender] [nvarchar](10) NULL,
	[DateOfBirth] [date] NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](11) NULL,
	[Office] [nvarchar](50) NULL,
 CONSTRAINT [PK__GiaoVien__3214EC27B141F025] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 4/12/2024 8:55:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[StudentID] [int] NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK__DeTai__3214EC275488090C] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Status]) VALUES (1, N'leduc', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', 1, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Status]) VALUES (2, N'20103100393', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 4, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Status]) VALUES (4, N'trungmm@gmail.com', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 2, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Status]) VALUES (5, N'son@gmail.com', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 3, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [RoleID], [Status]) VALUES (6, N'20103100308', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 4, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [Name], [Email], [PhoneNumber], [Address], [CompanyName], [CompanyAddress], [Note]) VALUES (1, N'Nguyễn Văn Khương', N'khuong@gmail.com', N'0654487244', N'Huyện Vụ Bản - Nam Định', N'VNPT HNI', N'Số 75 A/B Đinh Tiên Hoàng, Phường Tràng Tiền, quận Hoàn Kiếm, Hà Nội', N'không có')
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Email], [PhoneNumber], [Address], [CompanyName], [CompanyAddress], [Note]) VALUES (2, N'Huỳnh Công Sơn', N'son@gmail.com', N'0865521285', N'Huyện Kinh Môn - Hải Dương', N'VNPT Technology', N'Số 165 Cầu Giấy - Quan Hoa - Cầu Giấy - Hà Nội', N'không có')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Internship] ON 

INSERT [dbo].[Internship] ([InternShipID], [StudentID], [EmployeeID], [TeacherID], [Start_Day], [End_Day]) VALUES (1, 1, 1, 1, CAST(N'2023-02-23' AS Date), CAST(N'2023-03-25' AS Date))
INSERT [dbo].[Internship] ([InternShipID], [StudentID], [EmployeeID], [TeacherID], [Start_Day], [End_Day]) VALUES (2, 4, 2, 2, CAST(N'2023-02-23' AS Date), CAST(N'2023-03-24' AS Date))
INSERT [dbo].[Internship] ([InternShipID], [StudentID], [EmployeeID], [TeacherID], [Start_Day], [End_Day]) VALUES (3, 5, 1, 3, CAST(N'2023-02-21' AS Date), CAST(N'2023-03-22' AS Date))
INSERT [dbo].[Internship] ([InternShipID], [StudentID], [EmployeeID], [TeacherID], [Start_Day], [End_Day]) VALUES (4, 10, 2, 2, CAST(N'2023-01-15' AS Date), CAST(N'2023-02-16' AS Date))
INSERT [dbo].[Internship] ([InternShipID], [StudentID], [EmployeeID], [TeacherID], [Start_Day], [End_Day]) VALUES (5, 9, 2, 1, CAST(N'2023-12-23' AS Date), CAST(N'2024-01-24' AS Date))
SET IDENTITY_INSERT [dbo].[Internship] OFF
GO
INSERT [dbo].[Roles] ([IDRole], [Role]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([IDRole], [Role]) VALUES (2, N'Teacher')
INSERT [dbo].[Roles] ([IDRole], [Role]) VALUES (3, N'Employee')
INSERT [dbo].[Roles] ([IDRole], [Role]) VALUES (4, N'Student')
GO
SET IDENTITY_INSERT [dbo].[Score] ON 

INSERT [dbo].[Score] ([ScoreID], [Score1], [Score2], [Score3], [Score4], [Score5], [Assessment], [TopicID]) VALUES (1, CAST(7.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), N'Trung Bình', 2)
INSERT [dbo].[Score] ([ScoreID], [Score1], [Score2], [Score3], [Score4], [Score5], [Assessment], [TopicID]) VALUES (2, CAST(8.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Khá', 3)
INSERT [dbo].[Score] ([ScoreID], [Score1], [Score2], [Score3], [Score4], [Score5], [Assessment], [TopicID]) VALUES (3, CAST(9.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), N'Giỏi', 4)
INSERT [dbo].[Score] ([ScoreID], [Score1], [Score2], [Score3], [Score4], [Score5], [Assessment], [TopicID]) VALUES (4, CAST(9.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), N'Giỏi', 1)
INSERT [dbo].[Score] ([ScoreID], [Score1], [Score2], [Score3], [Score4], [Score5], [Assessment], [TopicID]) VALUES (5, CAST(4.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), N'Trung Bình', 5)
SET IDENTITY_INSERT [dbo].[Score] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentID], [StudentCode], [LastName], [FirstName], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Classroom], [GPAScore], [LetterScore], [Address]) VALUES (1, N'20103100393', N'lê anh', N'đức', N'Nam', CAST(N'2002-11-07' AS Date), N'leduc7112002@gmail.com', N'0813250204', N'DHTI14A2CL', CAST(3.53 AS Decimal(18, 2)), N'B+', N'T.p Yên Bái')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [LastName], [FirstName], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Classroom], [GPAScore], [LetterScore], [Address]) VALUES (2, N'20103100002', N'Nguyễn Hoài', N'Nam', N'Nam', CAST(N'2002-03-26' AS Date), N'nambg2603@gmail.com', N'0855327713', N'DHTI14A1HN', CAST(3.42 AS Decimal(18, 2)), N'B ', N'Tỉnh Bắc Giang.')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [LastName], [FirstName], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Classroom], [GPAScore], [LetterScore], [Address]) VALUES (3, N'20103100137', N'Nguyễn Thanh', N'Tùng', N'Nam', CAST(N'2002-04-10' AS Date), N'thanhtung02.uneti@gmail.com', N'0898253433', N'DHTI14A2HN', CAST(3.39 AS Decimal(18, 2)), N'B ', N'Tỉnh Bắc Giang.')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [LastName], [FirstName], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Classroom], [GPAScore], [LetterScore], [Address]) VALUES (4, N'20103100308', N'Thân Thị', N'Hà', N'Nữ', CAST(N'2002-11-04' AS Date), N'hathantth04@gmail.com
', N'0767039217', N'DHTI14A4HN', CAST(3.30 AS Decimal(18, 2)), N'B ', N'Huyện Việt Yên - Tỉnh Bắc Giang')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [LastName], [FirstName], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Classroom], [GPAScore], [LetterScore], [Address]) VALUES (5, N'20103100954', N'Phạm Văn', N'Phong', N'Nam', CAST(N'2002-09-18' AS Date), N'pvphong.dhti14a12hn@sv.uneti.edu.vn', N'0974507584', N'DHTI14A12HN', CAST(3.26 AS Decimal(18, 2)), N'B ', N'TP Bắc Giang, Tỉnh Bắc Giang')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [LastName], [FirstName], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Classroom], [GPAScore], [LetterScore], [Address]) VALUES (6, N'20103100652', N'Trương Thị', N'Thuận', N'Nữ', CAST(N'2002-06-29' AS Date), N'ttthuan.dhti14a11hn@sv.uneti.edu.vn', N'0398817164', N'DHTI14A11HN', CAST(3.25 AS Decimal(18, 2)), N'B ', N'Huyện Lục Nam, Tỉnh Bắc Giang.')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [LastName], [FirstName], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Classroom], [GPAScore], [LetterScore], [Address]) VALUES (7, N'20103100235', N'Trần Hoàng', N'Anh', N'Nam', CAST(N'2002-10-06' AS Date), N'hoanganhtran0927@gmail.com', N'0355718846', N'DHTI14A5HN', CAST(3.19 AS Decimal(18, 2)), N'B ', N'Huyện Hiệp Hoà, Tỉnh Bắc Giang')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [LastName], [FirstName], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Classroom], [GPAScore], [LetterScore], [Address]) VALUES (8, N'20103100695', N'Nguyễn Văn', N'Long', N'Nam', CAST(N'2002-10-08' AS Date), N'nvlongdb@gmail.com', N'0984847610', N'DHTI14A4HN', CAST(3.16 AS Decimal(18, 2)), N'B ', N'Huyện Hiệp Hoà, Tỉnh Bắc Giang.')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [LastName], [FirstName], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Classroom], [GPAScore], [LetterScore], [Address]) VALUES (9, N'20103100427', N'Lương Việt', N'Hoàng', N'Nam', CAST(N'2002-04-08' AS Date), N'lvhoang842002@gmail.com', N'0964952230', N'DHTI14A7HN', CAST(3.07 AS Decimal(18, 2)), N'B ', N'Huyện Việt Yên - Tỉnh Bắc Giang')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [LastName], [FirstName], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Classroom], [GPAScore], [LetterScore], [Address]) VALUES (10, N'20103100172', N'Trần Văn', N'Đức', N'Nam', CAST(N'2002-09-10' AS Date), N'phamhuyenlinh1407@gmail.com', N'0396955238', N'DHTI14A2HN', CAST(3.04 AS Decimal(18, 2)), N'B ', N'Huyện Lạng Giang,Tỉnh Bắc Giang.')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [LastName], [FirstName], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Classroom], [GPAScore], [LetterScore], [Address]) VALUES (11, N'20103100643', N'Ngô Thế', N'Thái', N'Nam', CAST(N'2002-01-20' AS Date), N'thai2012002@gmail.com', N'0964178382', N'DHTI14A10HN', CAST(2.97 AS Decimal(18, 2)), N'C+', N'Huyện Việt Yên, Tỉnh Bắc Giang.')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [LastName], [FirstName], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Classroom], [GPAScore], [LetterScore], [Address]) VALUES (12, N'20103100392', N'nguyễn văn', N'a', N'Nam', CAST(N'2002-11-23' AS Date), N'a@gmail.com', N'0813250555', N'DHTI14A5HN', CAST(3.80 AS Decimal(18, 2)), N'A', N'hải phòng')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [LastName], [FirstName], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Classroom], [GPAScore], [LetterScore], [Address]) VALUES (13, N'20103100321', N'nguyễn thị', N'b', N'Nữ', CAST(N'2002-12-11' AS Date), N'b@gmail.com', N'0813250333', N'DHTI14A10HN', CAST(1.20 AS Decimal(18, 2)), N'D', N'thái bình')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [LastName], [FirstName], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Classroom], [GPAScore], [LetterScore], [Address]) VALUES (14, N'20103100222', N'nguyễn thành', N'sơn', N'Nam', CAST(N'2002-11-11' AS Date), N'son11@gmail.com', N'0813250204', N'DHTI14A2CL', CAST(1.90 AS Decimal(18, 2)), N'D+', N'thanh hóa')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [LastName], [FirstName], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Classroom], [GPAScore], [LetterScore], [Address]) VALUES (15, N'20103100111', N'nguyễn trọng', N'hiếu', N'Nam', CAST(N'2002-02-22' AS Date), N'hieu@gmail.com', N'0813250222', N'DHTI14A2CL', CAST(1.80 AS Decimal(18, 2)), N'D+', N'T.p Yên Bái')
INSERT [dbo].[Student] ([StudentID], [StudentCode], [LastName], [FirstName], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Classroom], [GPAScore], [LetterScore], [Address]) VALUES (16, N'20103100112', N'phạm hoàng', N'dương', N'Nữ', CAST(N'2002-02-09' AS Date), N'duong@gmail.com', N'0813250111', N'DHTI14A6HN', CAST(2.20 AS Decimal(18, 2)), N'C', N'hải phòng')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([TeacherID], [LastName], [FirstName], [Address], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Office]) VALUES (1, N'Mai Mạnh', N'Trừng', N'Cầu Giấy - Hà Nội', N'Nam', CAST(N'1986-02-01' AS Date), N'trungmm@gmail.com', N'0974507584', N'Phó bộ môn')
INSERT [dbo].[Teacher] ([TeacherID], [LastName], [FirstName], [Address], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Office]) VALUES (2, N'Lê Thị Thảo', N'Hiếu', N'Hoàng Mai - Hà Nội', N'Nữ', CAST(N'1988-11-04' AS Date), N'hieultt@gmail.com', N'0898253433', N'Giảng viên')
INSERT [dbo].[Teacher] ([TeacherID], [LastName], [FirstName], [Address], [Gender], [DateOfBirth], [Email], [PhoneNumber], [Office]) VALUES (3, N'Bùi Văn', N'Tân', N'Hai Bà Trưng - Hà Nội', N'Nam', CAST(N'1980-08-12' AS Date), N'tanbv@gmail.com', N'0396955238', N'Trưởng bộ môn')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
GO
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([TopicID], [Title], [Description], [StudentID], [EmployeeID]) VALUES (1, N'Sử dụng ASP.Net làm Web bán hàng', N'thêm, sửa, xóa, quản lý, chức năng thanh toán, giỏ hàng', 1, 1)
INSERT [dbo].[Topic] ([TopicID], [Title], [Description], [StudentID], [EmployeeID]) VALUES (2, N'Sử dụng PHP, Mysql làm phần mềm quản lý sinh viên', N'thêm, sửa, xóa, quản lý, chức năng thông kế, báo cáo', 4, 2)
INSERT [dbo].[Topic] ([TopicID], [Title], [Description], [StudentID], [EmployeeID]) VALUES (3, N'Web bán hàng', N'Luận văn tốt nghiệp', 5, 1)
INSERT [dbo].[Topic] ([TopicID], [Title], [Description], [StudentID], [EmployeeID]) VALUES (4, N'Web quản lý', N'Luận văn tốt nghiệp', 10, 2)
INSERT [dbo].[Topic] ([TopicID], [Title], [Description], [StudentID], [EmployeeID]) VALUES (5, N'Web quản lý thi cử', N'Luận văn tốt nghiệp', 9, 2)
SET IDENTITY_INSERT [dbo].[Topic] OFF
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF__TaiKhoan__LoaiTa__49C3F6B7]  DEFAULT ('user') FOR [RoleID]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([IDRole])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Roles]
GO
ALTER TABLE [dbo].[Internship]  WITH CHECK ADD  CONSTRAINT [FK__ThucTap__MaGiaoV__5441852A] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([TeacherID])
GO
ALTER TABLE [dbo].[Internship] CHECK CONSTRAINT [FK__ThucTap__MaGiaoV__5441852A]
GO
ALTER TABLE [dbo].[Internship]  WITH CHECK ADD  CONSTRAINT [FK__ThucTap__MaSV__52593CB8] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Internship] CHECK CONSTRAINT [FK__ThucTap__MaSV__52593CB8]
GO
ALTER TABLE [dbo].[Internship]  WITH CHECK ADD  CONSTRAINT [FK_Internship_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Internship] CHECK CONSTRAINT [FK_Internship_Employee]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK__Diem__MaDeTai__59FA5E80] FOREIGN KEY([TopicID])
REFERENCES [dbo].[Topic] ([TopicID])
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK__Diem__MaDeTai__59FA5E80]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK__DeTai__MaSV__571DF1D5] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK__DeTai__MaSV__571DF1D5]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_Employee]
GO
USE [master]
GO
ALTER DATABASE [QLSVTT] SET  READ_WRITE 
GO
