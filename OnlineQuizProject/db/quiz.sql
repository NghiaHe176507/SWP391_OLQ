USE [master]
GO
/****** Object:  Database [Quiz]    Script Date: 20/3/2024 2:10:26 am ******/
CREATE DATABASE [Quiz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Quiz', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Quiz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Quiz_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Quiz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Quiz] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Quiz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Quiz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Quiz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Quiz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Quiz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Quiz] SET ARITHABORT OFF 
GO
ALTER DATABASE [Quiz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Quiz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Quiz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Quiz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Quiz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Quiz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Quiz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Quiz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Quiz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Quiz] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Quiz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Quiz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Quiz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Quiz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Quiz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Quiz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Quiz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Quiz] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Quiz] SET  MULTI_USER 
GO
ALTER DATABASE [Quiz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Quiz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Quiz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Quiz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Quiz] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Quiz] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Quiz] SET QUERY_STORE = ON
GO
ALTER DATABASE [Quiz] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Quiz]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 20/3/2024 2:10:26 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[mail] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[displayname] [nvarchar](50) NOT NULL,
	[account_status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountInfo]    Script Date: 20/3/2024 2:10:26 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountInfo](
	[accountInfo_id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[dob] [date] NOT NULL,
	[account_id] [int] NOT NULL,
 CONSTRAINT [PK_AccountInfo] PRIMARY KEY CLUSTERED 
(
	[accountInfo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 20/3/2024 2:10:26 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[exam_id] [int] IDENTITY(1,1) NOT NULL,
	[exam_title] [nvarchar](50) NOT NULL,
	[group_id] [int] NOT NULL,
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NULL,
	[time] [time](0) NULL,
	[status_id] [int] NOT NULL,
	[lecture_id] [int] NOT NULL,
	[attempt] [int] NULL,
	[isPractice] [bit] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamQuestionMapping]    Script Date: 20/3/2024 2:10:26 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamQuestionMapping](
	[mapping_id] [int] IDENTITY(1,1) NOT NULL,
	[question_id] [int] NOT NULL,
	[exam_id] [int] NOT NULL,
 CONSTRAINT [PK_ListQuestOfExam] PRIMARY KEY CLUSTERED 
(
	[mapping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 20/3/2024 2:10:26 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[group_id] [int] IDENTITY(1,1) NOT NULL,
	[group_name] [nvarchar](50) NOT NULL,
	[lecture_id] [int] NOT NULL,
	[topic_id] [int] NOT NULL,
	[status_id] [int] NOT NULL,
	[group_invite_code] [nvarchar](50) NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OptionAnswer]    Script Date: 20/3/2024 2:10:26 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OptionAnswer](
	[optionAnswer_id] [int] IDENTITY(1,1) NOT NULL,
	[answer_content] [nvarchar](4000) NOT NULL,
	[isCorrect] [bit] NOT NULL,
	[question_id] [int] NOT NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[optionAnswer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 20/3/2024 2:10:26 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[question_id] [int] IDENTITY(1,1) NOT NULL,
	[topic_id] [int] NOT NULL,
	[question_content] [nvarchar](4000) NOT NULL,
	[inBank] [bit] NOT NULL,
	[question_answer_detail] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Register]    Script Date: 20/3/2024 2:10:26 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Register](
	[register_id] [int] IDENTITY(1,1) NOT NULL,
	[register_date] [date] NULL,
	[student_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
 CONSTRAINT [PK_Register] PRIMARY KEY CLUSTERED 
(
	[register_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 20/3/2024 2:10:26 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[result_id] [int] IDENTITY(1,1) NOT NULL,
	[exam_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[score] [float] NULL,
	[comment_content] [nvarchar](4000) NULL,
	[attempt_number] [int] NOT NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 20/3/2024 2:10:26 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleAccess]    Script Date: 20/3/2024 2:10:26 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleAccess](
	[roleAccess_id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NOT NULL,
	[url_id] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_RoleAccess] PRIMARY KEY CLUSTERED 
(
	[roleAccess_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleFeature]    Script Date: 20/3/2024 2:10:26 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleFeature](
	[roleFeature_id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NOT NULL,
	[account_id] [int] NOT NULL,
 CONSTRAINT [PK_RoleFeature] PRIMARY KEY CLUSTERED 
(
	[roleFeature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 20/3/2024 2:10:26 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentAnswer]    Script Date: 20/3/2024 2:10:26 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAnswer](
	[studentAnswer_id] [int] IDENTITY(1,1) NOT NULL,
	[exam_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
	[option_answer_id] [int] NULL,
	[student_id] [int] NOT NULL,
	[attempt_number] [int] NOT NULL,
 CONSTRAINT [PK_StudentAnswer] PRIMARY KEY CLUSTERED 
(
	[studentAnswer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 20/3/2024 2:10:26 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[topic_id] [int] IDENTITY(1,1) NOT NULL,
	[topic_name] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[topic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Url]    Script Date: 20/3/2024 2:10:26 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Url](
	[url_id] [nvarchar](4000) NOT NULL,
	[url] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_Url] PRIMARY KEY CLUSTERED 
(
	[url_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([account_id], [mail], [password], [displayname], [account_status]) VALUES (1, N'nghia@gmail.com', N'1', N'Nghia', N'Active')
INSERT [dbo].[Account] ([account_id], [mail], [password], [displayname], [account_status]) VALUES (2, N'than@gmail.com', N'1', N'Than', N'Active')
INSERT [dbo].[Account] ([account_id], [mail], [password], [displayname], [account_status]) VALUES (4, N'tuan@gmail.com', N'1', N'Tuan', N'Active')
INSERT [dbo].[Account] ([account_id], [mail], [password], [displayname], [account_status]) VALUES (1009, N'nghia2@gmail.com', N'1', N'Nghia Day', N'Active')
INSERT [dbo].[Account] ([account_id], [mail], [password], [displayname], [account_status]) VALUES (1010, N'nghia22@gmail.com', N'1', N'Nghia Day', N'Active')
INSERT [dbo].[Account] ([account_id], [mail], [password], [displayname], [account_status]) VALUES (1011, N'nghia223@gmail.com', N'1', N'Nghia ', N'Active')
INSERT [dbo].[Account] ([account_id], [mail], [password], [displayname], [account_status]) VALUES (1012, N'tuan223@gmail.com', N'1', N'Dat', N'Active')
INSERT [dbo].[Account] ([account_id], [mail], [password], [displayname], [account_status]) VALUES (1013, N'tuan225@gmail.com', N'1', N'Than', N'Active')
INSERT [dbo].[Account] ([account_id], [mail], [password], [displayname], [account_status]) VALUES (1014, N'tuan2@gmail.com', N'1', N'Than', N'Active')
INSERT [dbo].[Account] ([account_id], [mail], [password], [displayname], [account_status]) VALUES (1015, N'tuan22355@gmail.com', N'1', N'Than', N'Active')
INSERT [dbo].[Account] ([account_id], [mail], [password], [displayname], [account_status]) VALUES (1016, N'dat22355@gmail.com', N'1', N'Than', N'Active')
INSERT [dbo].[Account] ([account_id], [mail], [password], [displayname], [account_status]) VALUES (1017, N'than2@gmail.com', N'123456789', N'Nghia Day', N'Active')
INSERT [dbo].[Account] ([account_id], [mail], [password], [displayname], [account_status]) VALUES (1018, N'minhtuanha2829@gmail.com', N'123456789', N'tuanne', N'Active')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountInfo] ON 

INSERT [dbo].[AccountInfo] ([accountInfo_id], [fullname], [dob], [account_id]) VALUES (1, N'Nghia', CAST(N'1999-01-14' AS Date), 1)
INSERT [dbo].[AccountInfo] ([accountInfo_id], [fullname], [dob], [account_id]) VALUES (3, N'Than', CAST(N'1999-01-01' AS Date), 2)
INSERT [dbo].[AccountInfo] ([accountInfo_id], [fullname], [dob], [account_id]) VALUES (5, N'Tuan', CAST(N'1999-01-01' AS Date), 4)
INSERT [dbo].[AccountInfo] ([accountInfo_id], [fullname], [dob], [account_id]) VALUES (1010, N'Phạm Văn Nghĩa', CAST(N'1999-01-01' AS Date), 1009)
INSERT [dbo].[AccountInfo] ([accountInfo_id], [fullname], [dob], [account_id]) VALUES (1011, N'Phạm Văn Nghĩa', CAST(N'1999-01-19' AS Date), 1010)
INSERT [dbo].[AccountInfo] ([accountInfo_id], [fullname], [dob], [account_id]) VALUES (1012, N'Tuan Ngu', CAST(N'1999-01-01' AS Date), 1011)
INSERT [dbo].[AccountInfo] ([accountInfo_id], [fullname], [dob], [account_id]) VALUES (1013, N'Tuan ', CAST(N'1999-01-01' AS Date), 1012)
INSERT [dbo].[AccountInfo] ([accountInfo_id], [fullname], [dob], [account_id]) VALUES (1014, N'Tuan ', CAST(N'1999-01-01' AS Date), 1013)
INSERT [dbo].[AccountInfo] ([accountInfo_id], [fullname], [dob], [account_id]) VALUES (1015, N'Dat', CAST(N'1999-01-01' AS Date), 1014)
INSERT [dbo].[AccountInfo] ([accountInfo_id], [fullname], [dob], [account_id]) VALUES (1016, N'Dat', CAST(N'1999-01-01' AS Date), 1015)
INSERT [dbo].[AccountInfo] ([accountInfo_id], [fullname], [dob], [account_id]) VALUES (1017, N'Dat', CAST(N'1999-01-01' AS Date), 1016)
INSERT [dbo].[AccountInfo] ([accountInfo_id], [fullname], [dob], [account_id]) VALUES (1018, N'Tuan Ngu', CAST(N'1999-01-01' AS Date), 1017)
INSERT [dbo].[AccountInfo] ([accountInfo_id], [fullname], [dob], [account_id]) VALUES (1019, N'Hà Minh Tuấn', CAST(N'2003-09-23' AS Date), 1018)
SET IDENTITY_INSERT [dbo].[AccountInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([exam_id], [exam_title], [group_id], [startDate], [endDate], [time], [status_id], [lecture_id], [attempt], [isPractice]) VALUES (4, N'PT', 7, CAST(N'2024-03-20T00:00:00.000' AS DateTime), NULL, CAST(N'00:30:00' AS Time), 1, 5, NULL, 1)
INSERT [dbo].[Exam] ([exam_id], [exam_title], [group_id], [startDate], [endDate], [time], [status_id], [lecture_id], [attempt], [isPractice]) VALUES (5, N'PT', 7, CAST(N'2024-03-20T01:26:26.813' AS DateTime), CAST(N'2024-03-21T00:00:00.000' AS DateTime), CAST(N'00:30:00' AS Time), 1, 5, 1, 0)
SET IDENTITY_INSERT [dbo].[Exam] OFF
GO
SET IDENTITY_INSERT [dbo].[ExamQuestionMapping] ON 

INSERT [dbo].[ExamQuestionMapping] ([mapping_id], [question_id], [exam_id]) VALUES (6, 16, 4)
INSERT [dbo].[ExamQuestionMapping] ([mapping_id], [question_id], [exam_id]) VALUES (7, 17, 4)
INSERT [dbo].[ExamQuestionMapping] ([mapping_id], [question_id], [exam_id]) VALUES (8, 18, 4)
INSERT [dbo].[ExamQuestionMapping] ([mapping_id], [question_id], [exam_id]) VALUES (9, 19, 5)
INSERT [dbo].[ExamQuestionMapping] ([mapping_id], [question_id], [exam_id]) VALUES (10, 20, 5)
INSERT [dbo].[ExamQuestionMapping] ([mapping_id], [question_id], [exam_id]) VALUES (11, 21, 5)
SET IDENTITY_INSERT [dbo].[ExamQuestionMapping] OFF
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([group_id], [group_name], [lecture_id], [topic_id], [status_id], [group_invite_code]) VALUES (1, N'SE1755', 5, 1, 1, N'640N4N')
INSERT [dbo].[Group] ([group_id], [group_name], [lecture_id], [topic_id], [status_id], [group_invite_code]) VALUES (3, N'SE1760', 5, 2, 1, N'AB2MTI')
INSERT [dbo].[Group] ([group_id], [group_name], [lecture_id], [topic_id], [status_id], [group_invite_code]) VALUES (4, N'SE1753', 5, 1, 1, N'6URL04')
INSERT [dbo].[Group] ([group_id], [group_name], [lecture_id], [topic_id], [status_id], [group_invite_code]) VALUES (5, N'SE1755', 5, 3, 1, N'559424')
INSERT [dbo].[Group] ([group_id], [group_name], [lecture_id], [topic_id], [status_id], [group_invite_code]) VALUES (6, N'SE1755', 5, 9, 1, N'1A94R5')
INSERT [dbo].[Group] ([group_id], [group_name], [lecture_id], [topic_id], [status_id], [group_invite_code]) VALUES (7, N'SE1755', 5, 15, 1, N'6QWU50')
INSERT [dbo].[Group] ([group_id], [group_name], [lecture_id], [topic_id], [status_id], [group_invite_code]) VALUES (9, N'SE1760', 5, 21, 1, N'S2FCOU')
INSERT [dbo].[Group] ([group_id], [group_name], [lecture_id], [topic_id], [status_id], [group_invite_code]) VALUES (11, N'SE1760', 5, 20, 3, NULL)
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
SET IDENTITY_INSERT [dbo].[OptionAnswer] ON 

INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (47, N'1', 0, 16)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (48, N'2', 1, 16)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (49, N'3', 0, 16)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (50, N'1', 0, 17)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (51, N'2', 0, 17)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (52, N'3', 1, 17)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (53, N'1', 0, 18)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (54, N'4', 1, 18)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (55, N'3', 0, 18)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (56, N'4', 1, 18)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (57, N'1', 0, 19)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (58, N'2', 1, 19)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (59, N'3', 0, 19)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (60, N'1', 0, 20)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (61, N'2', 0, 20)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (62, N'3', 1, 20)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (63, N'1', 0, 21)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (64, N'4', 1, 21)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (65, N'3', 0, 21)
INSERT [dbo].[OptionAnswer] ([optionAnswer_id], [answer_content], [isCorrect], [question_id]) VALUES (66, N'4', 1, 21)
SET IDENTITY_INSERT [dbo].[OptionAnswer] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([question_id], [topic_id], [question_content], [inBank], [question_answer_detail]) VALUES (16, 15, N'1 + 1 = ?', 1, NULL)
INSERT [dbo].[Question] ([question_id], [topic_id], [question_content], [inBank], [question_answer_detail]) VALUES (17, 15, N'1 + 2 = ?', 0, NULL)
INSERT [dbo].[Question] ([question_id], [topic_id], [question_content], [inBank], [question_answer_detail]) VALUES (18, 15, N'2 + 2 = ?', 0, NULL)
INSERT [dbo].[Question] ([question_id], [topic_id], [question_content], [inBank], [question_answer_detail]) VALUES (19, 15, N'1 + 1 = ?', 0, NULL)
INSERT [dbo].[Question] ([question_id], [topic_id], [question_content], [inBank], [question_answer_detail]) VALUES (20, 15, N'1 + 2 = ?', 0, NULL)
INSERT [dbo].[Question] ([question_id], [topic_id], [question_content], [inBank], [question_answer_detail]) VALUES (21, 15, N'2 + 2 = ?', 1, NULL)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Register] ON 

INSERT [dbo].[Register] ([register_id], [register_date], [student_id], [group_id]) VALUES (70, CAST(N'2024-03-20' AS Date), 1, 7)
SET IDENTITY_INSERT [dbo].[Register] OFF
GO
SET IDENTITY_INSERT [dbo].[Result] ON 

INSERT [dbo].[Result] ([result_id], [exam_id], [student_id], [score], [comment_content], [attempt_number]) VALUES (1, 5, 1, 6.67, NULL, 1)
INSERT [dbo].[Result] ([result_id], [exam_id], [student_id], [score], [comment_content], [attempt_number]) VALUES (2, 5, 1, 3.33, NULL, 2)
SET IDENTITY_INSERT [dbo].[Result] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'Lecture')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (3, N'Student')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[RoleAccess] ON 

INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (2, 1, N'AccountManagementForAdmin')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (3, 1, N'UpdateAccountByAdmin')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (4, 1, N'DeleteAccountByAdmin')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (5, 1, N'CreateAccountByAdmin')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (6, 1, N'DeleteGroupByAdmin')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (7, 1, N'TopicManagementForAdmin')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (8, 1, N'GroupManagementForAdmin')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (9, 1, N'DeleteTopicByAdmin')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (10, 1, N'CreateTopicByAdmin')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (11, 1, N'ForgotPassword')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (13, 2, N'CreateGroupByLecture')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (14, 2, N'UpdateAccount')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (15, 2, N'DeleteGroupByLecture')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (16, 2, N'ViewListExam')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (18, 3, N'Search')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (19, 3, N'UpdateAccount')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (20, 3, N'ShowResultOfStudentAfterExam')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (21, 3, N'ViewDetailAnswerAfterExam')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (22, 2, N'SearchStudent')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (23, 2, N'GroupManagementForLecture')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (24, 2, N'CreateExamByLecture')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (25, 3, N'DoExamByStudent')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (26, 2, N'ChangePasswordByLecture')
INSERT [dbo].[RoleAccess] ([roleAccess_id], [role_id], [url_id]) VALUES (27, 3, N'ChangePasswordByStudent')
SET IDENTITY_INSERT [dbo].[RoleAccess] OFF
GO
SET IDENTITY_INSERT [dbo].[RoleFeature] ON 

INSERT [dbo].[RoleFeature] ([roleFeature_id], [role_id], [account_id]) VALUES (1, 3, 1)
INSERT [dbo].[RoleFeature] ([roleFeature_id], [role_id], [account_id]) VALUES (2, 1, 2)
INSERT [dbo].[RoleFeature] ([roleFeature_id], [role_id], [account_id]) VALUES (3, 2, 4)
INSERT [dbo].[RoleFeature] ([roleFeature_id], [role_id], [account_id]) VALUES (1007, 2, 1009)
INSERT [dbo].[RoleFeature] ([roleFeature_id], [role_id], [account_id]) VALUES (1008, 3, 1010)
INSERT [dbo].[RoleFeature] ([roleFeature_id], [role_id], [account_id]) VALUES (1009, 3, 1011)
INSERT [dbo].[RoleFeature] ([roleFeature_id], [role_id], [account_id]) VALUES (1010, 3, 1012)
INSERT [dbo].[RoleFeature] ([roleFeature_id], [role_id], [account_id]) VALUES (1011, 2, 1013)
INSERT [dbo].[RoleFeature] ([roleFeature_id], [role_id], [account_id]) VALUES (1012, 3, 1014)
INSERT [dbo].[RoleFeature] ([roleFeature_id], [role_id], [account_id]) VALUES (1013, 2, 1015)
INSERT [dbo].[RoleFeature] ([roleFeature_id], [role_id], [account_id]) VALUES (1014, 3, 1016)
INSERT [dbo].[RoleFeature] ([roleFeature_id], [role_id], [account_id]) VALUES (1015, 3, 1017)
INSERT [dbo].[RoleFeature] ([roleFeature_id], [role_id], [account_id]) VALUES (1016, 3, 1018)
SET IDENTITY_INSERT [dbo].[RoleFeature] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (1, N'Active')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (2, N'Pending')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (3, N'Closed')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentAnswer] ON 

INSERT [dbo].[StudentAnswer] ([studentAnswer_id], [exam_id], [question_id], [option_answer_id], [student_id], [attempt_number]) VALUES (1, 5, 19, 58, 1, 1)
INSERT [dbo].[StudentAnswer] ([studentAnswer_id], [exam_id], [question_id], [option_answer_id], [student_id], [attempt_number]) VALUES (2, 5, 20, 62, 1, 1)
INSERT [dbo].[StudentAnswer] ([studentAnswer_id], [exam_id], [question_id], [option_answer_id], [student_id], [attempt_number]) VALUES (3, 5, 21, 64, 1, 1)
INSERT [dbo].[StudentAnswer] ([studentAnswer_id], [exam_id], [question_id], [option_answer_id], [student_id], [attempt_number]) VALUES (4, 5, 19, 57, 1, 2)
INSERT [dbo].[StudentAnswer] ([studentAnswer_id], [exam_id], [question_id], [option_answer_id], [student_id], [attempt_number]) VALUES (5, 5, 19, 58, 1, 2)
INSERT [dbo].[StudentAnswer] ([studentAnswer_id], [exam_id], [question_id], [option_answer_id], [student_id], [attempt_number]) VALUES (6, 5, 20, 62, 1, 2)
INSERT [dbo].[StudentAnswer] ([studentAnswer_id], [exam_id], [question_id], [option_answer_id], [student_id], [attempt_number]) VALUES (7, 5, 21, 64, 1, 2)
INSERT [dbo].[StudentAnswer] ([studentAnswer_id], [exam_id], [question_id], [option_answer_id], [student_id], [attempt_number]) VALUES (8, 5, 21, 65, 1, 2)
INSERT [dbo].[StudentAnswer] ([studentAnswer_id], [exam_id], [question_id], [option_answer_id], [student_id], [attempt_number]) VALUES (9, 5, 21, 66, 1, 2)
SET IDENTITY_INSERT [dbo].[StudentAnswer] OFF
GO
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (1, N'CSD201')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (2, N'CSI104')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (3, N'PRF192')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (4, N'PRO192')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (5, N'MAD101')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (6, N'OSG202')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (7, N'NWC203c')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (8, N'SSG104')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (9, N'JPD113')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (10, N'DBI202')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (11, N'WED201c')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (12, N'MAS291')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (13, N'JPD123')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (14, N'IOT102')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (15, N'PRJ301')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (16, N'SWE201c')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (17, N'SWP391')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (18, N'ITE302c')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (19, N'SWR302')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (20, N'SWT301')
INSERT [dbo].[Topic] ([topic_id], [topic_name]) VALUES (21, N'FER202')
SET IDENTITY_INSERT [dbo].[Topic] OFF
GO
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'AccountManagementForAdmin', N'/admin/account-management')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'ChangePasswordByLecture', N'/change-password-lecture')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'ChangePasswordByStudent', N'/change-password-student')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'CreateAccountByAdmin', N'/admin/account-management/create-account')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'CreateExamByLecture', N'/create-exam')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'CreateGroupByLecture', N'/group-management/create-group')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'CreateTopicByAdmin', N'/admin/topic-management/create-topic')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'DeleteAccountByAdmin', N'/admin/account-management/delete-account')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'DeleteGroupByAdmin', N'/admin/group-management/delete-group')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'DeleteGroupByLecture', N'/group-management/delete-group')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'DeleteTopicByAdmin', N'/admin/topic-management/delete-topic')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'DoExamByStudent', N'/take-exam')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'ForgotPassword', N'/forgotpassword')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'GroupManagementForAdmin', N'/admin/group-management')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'GroupManagementForLecture', N'/group-management')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'Logout', N'/logout')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'Register', N'/register')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'Search', N'/search')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'SearchStudent', N'/search-student')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'ShowResultOfStudentAfterExam', N'/result-after-exam')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'TopicManagementForAdmin', N'/admin/topic-management')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'UpdateAccount', N'/updateaccount')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'UpdateAccountByAdmin', N'/admin/account-management/update-account')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'ViewDetailAnswerAfterExam', N'/view-total')
INSERT [dbo].[Url] ([url_id], [url]) VALUES (N'ViewListExam', N'/view-list-exam')
GO
/****** Object:  Index [IX_AccountInfo]    Script Date: 20/3/2024 2:10:26 am ******/
ALTER TABLE [dbo].[AccountInfo] ADD  CONSTRAINT [IX_AccountInfo] UNIQUE NONCLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountInfo]  WITH CHECK ADD  CONSTRAINT [FK_AccountInfo_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[AccountInfo] CHECK CONSTRAINT [FK_AccountInfo_Account]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Group] FOREIGN KEY([group_id])
REFERENCES [dbo].[Group] ([group_id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Group]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Status] FOREIGN KEY([status_id])
REFERENCES [dbo].[Status] ([status_id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Status]
GO
ALTER TABLE [dbo].[ExamQuestionMapping]  WITH CHECK ADD  CONSTRAINT [FK_ListQuestOfExam_Exam] FOREIGN KEY([exam_id])
REFERENCES [dbo].[Exam] ([exam_id])
GO
ALTER TABLE [dbo].[ExamQuestionMapping] CHECK CONSTRAINT [FK_ListQuestOfExam_Exam]
GO
ALTER TABLE [dbo].[ExamQuestionMapping]  WITH CHECK ADD  CONSTRAINT [FK_ListQuestOfExam_Question] FOREIGN KEY([question_id])
REFERENCES [dbo].[Question] ([question_id])
GO
ALTER TABLE [dbo].[ExamQuestionMapping] CHECK CONSTRAINT [FK_ListQuestOfExam_Question]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Class_AccountInfo] FOREIGN KEY([lecture_id])
REFERENCES [dbo].[AccountInfo] ([accountInfo_id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Class_AccountInfo]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Class_Status] FOREIGN KEY([status_id])
REFERENCES [dbo].[Status] ([status_id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Class_Status]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Class_Topic] FOREIGN KEY([topic_id])
REFERENCES [dbo].[Topic] ([topic_id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Class_Topic]
GO
ALTER TABLE [dbo].[OptionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([question_id])
REFERENCES [dbo].[Question] ([question_id])
GO
ALTER TABLE [dbo].[OptionAnswer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[Register]  WITH CHECK ADD  CONSTRAINT [FK_Register_AccountInfo] FOREIGN KEY([student_id])
REFERENCES [dbo].[AccountInfo] ([accountInfo_id])
GO
ALTER TABLE [dbo].[Register] CHECK CONSTRAINT [FK_Register_AccountInfo]
GO
ALTER TABLE [dbo].[Register]  WITH CHECK ADD  CONSTRAINT [FK_Register_Group] FOREIGN KEY([group_id])
REFERENCES [dbo].[Group] ([group_id])
GO
ALTER TABLE [dbo].[Register] CHECK CONSTRAINT [FK_Register_Group]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_AccountInfo] FOREIGN KEY([student_id])
REFERENCES [dbo].[AccountInfo] ([accountInfo_id])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_AccountInfo]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Exam] FOREIGN KEY([exam_id])
REFERENCES [dbo].[Exam] ([exam_id])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Exam]
GO
ALTER TABLE [dbo].[RoleAccess]  WITH CHECK ADD  CONSTRAINT [FK_RoleAccess_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[RoleAccess] CHECK CONSTRAINT [FK_RoleAccess_Role]
GO
ALTER TABLE [dbo].[RoleAccess]  WITH CHECK ADD  CONSTRAINT [FK_RoleAccess_Url] FOREIGN KEY([url_id])
REFERENCES [dbo].[Url] ([url_id])
GO
ALTER TABLE [dbo].[RoleAccess] CHECK CONSTRAINT [FK_RoleAccess_Url]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Account]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Role]
GO
ALTER TABLE [dbo].[StudentAnswer]  WITH CHECK ADD  CONSTRAINT [FK_StudentAnswer_AccountInfo] FOREIGN KEY([student_id])
REFERENCES [dbo].[AccountInfo] ([accountInfo_id])
GO
ALTER TABLE [dbo].[StudentAnswer] CHECK CONSTRAINT [FK_StudentAnswer_AccountInfo]
GO
ALTER TABLE [dbo].[StudentAnswer]  WITH CHECK ADD  CONSTRAINT [FK_StudentAnswer_Answer] FOREIGN KEY([option_answer_id])
REFERENCES [dbo].[OptionAnswer] ([optionAnswer_id])
GO
ALTER TABLE [dbo].[StudentAnswer] CHECK CONSTRAINT [FK_StudentAnswer_Answer]
GO
ALTER TABLE [dbo].[StudentAnswer]  WITH CHECK ADD  CONSTRAINT [FK_StudentAnswer_Exam] FOREIGN KEY([exam_id])
REFERENCES [dbo].[Exam] ([exam_id])
GO
ALTER TABLE [dbo].[StudentAnswer] CHECK CONSTRAINT [FK_StudentAnswer_Exam]
GO
USE [master]
GO
ALTER DATABASE [Quiz] SET  READ_WRITE 
GO
