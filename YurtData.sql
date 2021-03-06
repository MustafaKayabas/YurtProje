USE [YurtData]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_login]    Script Date: 3.01.2021 18:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_login](@nickName nvarchar(15),@password nvarchar(20))
returns char(1)
as
begin
declare @isMatch char(1)
declare @Count int
set @Count = (select Count(*) from tbl_User where nickName=@nickName and password=@password)

if(@Count > 0)

begin
set @isMatch='E'
end

else
begin
set @isMatch='H'
end

return @isMatch

end
GO
/****** Object:  UserDefinedFunction [dbo].[userMatch]    Script Date: 3.01.2021 18:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[userMatch](
@nickName nvarchar(15),
@email nvarchar(250),
@phoneNo nvarchar(50))
returns nvarchar(20)
as
begin
declare @isMatch char(1)
set @isMatch = 'H'
declare @nickNo int
declare @emailNo int
declare @phone int
set @nickNo = (select  Count(*) from tbl_User where nickname = @nickname)
set @emailNo = (select  Count(*) from tbl_User where emailAddress = @email)
set @phone = (select  Count(*) from tbl_User where phoneNo = @phoneNo)

if(@nickNo>0)

begin
set @isMatch='N'
end


if(@emailNo>0 and @isMatch!='N')

begin
set @isMatch='E'
end


if(@phone>0 and @isMatch!='N' and @isMatch!='E')

begin
set @isMatch='P'
end


return @isMatch

end
GO
/****** Object:  Table [dbo].[tbl_City]    Script Date: 3.01.2021 18:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_City](
	[cityNo] [int] IDENTITY(1,1) NOT NULL,
	[cityName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tbl_City] PRIMARY KEY CLUSTERED 
(
	[cityNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DormitoryContact]    Script Date: 3.01.2021 18:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DormitoryContact](
	[dormNo] [int] NOT NULL,
	[dormAddress] [nvarchar](1000) NOT NULL,
	[dormPhone] [nvarchar](11) NOT NULL,
	[dormEmailAddress] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_DormitoryContact] PRIMARY KEY CLUSTERED 
(
	[dormNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DormitoryServices]    Script Date: 3.01.2021 18:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DormitoryServices](
	[dormNo] [int] NOT NULL,
	[roomCleaningDayWeekly] [int] NOT NULL,
	[laundryRoom] [bit] NOT NULL,
	[eveningDinner] [bit] NOT NULL,
	[breakfast] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_DormitoryServices] PRIMARY KEY CLUSTERED 
(
	[dormNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DormitoryPublicPlaces]    Script Date: 3.01.2021 18:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DormitoryPublicPlaces](
	[dormNo] [int] NOT NULL,
	[sportsArea] [bit] NOT NULL,
	[gym] [bit] NOT NULL,
	[pool] [bit] NOT NULL,
	[musicRoom] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_DormitoryPublicPlaces] PRIMARY KEY CLUSTERED 
(
	[dormNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DormitoryCharge]    Script Date: 3.01.2021 18:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DormitoryCharge](
	[dormNo] [int] NOT NULL,
	[onePersonRoomCharge] [int] NULL,
	[twoPersonRoomCharge] [int] NULL,
	[threePersonRoomCharge] [int] NULL,
	[fourPersonRoomCharge] [int] NULL,
 CONSTRAINT [PK_tbl_DormitoryCharge] PRIMARY KEY CLUSTERED 
(
	[dormNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Dormitory]    Script Date: 3.01.2021 18:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Dormitory](
	[dormNo] [int] IDENTITY(1,1) NOT NULL,
	[dormName] [nvarchar](100) NOT NULL,
	[cityNo] [int] NOT NULL,
	[roomCount] [int] NULL,
	[gender] [nchar](1) NOT NULL,
 CONSTRAINT [PK_tbl_Dormitory] PRIMARY KEY CLUSTERED 
(
	[dormNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_yurtGetir]    Script Date: 3.01.2021 18:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_yurtGetir](@yurtName nvarchar(50))
RETURNS TABLE

as
          RETURN(select Dr.dormNo,Dr.dormName, 
               case gender when 'E' then 'Erkek' when 'K' then 'Kız' end as gender, 
               cityName, roomCount,dormAddress,dormPhone,dormEmailAddress,
			   case sportsArea when 1 then 'Var' when 0  then 'Yok' end as sportsArea,
			   case gym when 1 then 'Var' when 0  then 'Yok' end as gym,
			   case pool when 1 then 'Var' when 0  then 'Yok' end as pool,
			   case musicRoom when 1 then 'Var' when 0  then 'Yok' end as musicRoom,
			   roomCleaningDayWeekly,
			   case laundryRoom when 1 then 'Var' when 0  then 'Yok' end as laundryRom,
			    case eveningDinner when 1 then 'Var' when 0  then 'Yok' end as eveningDinner,
				 case breakfast when 1 then 'Var' when 0  then 'Yok' end as breakfast,
				 onePersonRoomCharge,twoPersonRoomCharge,
				 threePersonRoomCharge,fourPersonRoomCharge

               from tbl_Dormitory Dr, tbl_DormitoryCharge DrCh, tbl_DormitoryContact DrCo, 
               tbl_DormitoryPublicPlaces DrPu, tbl_DormitoryServices DrSe, tbl_City Ci 
               where Dr.dormNo = DrCh.dormNo 
               and   Dr.dormNo = DrCo.dormNo 
               and   Dr.dormNo = DrPu.dormNo 
               and   Dr.dormNo = DrSe.dormNo 
               and   Dr.cityNo = Ci.cityNo
			   and   Dr.dormName=@yurtName)
GO
/****** Object:  Table [dbo].[tbl_Campus]    Script Date: 3.01.2021 18:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Campus](
	[campusNo] [int] IDENTITY(1,1) NOT NULL,
	[campusName] [nvarchar](100) NOT NULL,
	[campusAddress] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_tbl_Campus] PRIMARY KEY CLUSTERED 
(
	[campusNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_OfficeContact]    Script Date: 3.01.2021 18:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OfficeContact](
	[officeNo] [int] IDENTITY(1,1) NOT NULL,
	[officeCityNo] [int] NOT NULL,
	[officeAddress] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_tbl_OfficeContact] PRIMARY KEY CLUSTERED 
(
	[officeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_School]    Script Date: 3.01.2021 18:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_School](
	[schoolNo] [int] IDENTITY(1,1) NOT NULL,
	[schoolName] [nvarchar](50) NOT NULL,
	[campusNo] [int] NOT NULL,
	[cityNo] [int] NOT NULL,
 CONSTRAINT [PK_tbl_school] PRIMARY KEY CLUSTERED 
(
	[schoolNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SiteContact]    Script Date: 3.01.2021 18:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SiteContact](
	[siteID] [int] IDENTITY(1,1) NOT NULL,
	[siteName] [nvarchar](100) NOT NULL,
	[siteEmailAddress] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_SiteContact] PRIMARY KEY CLUSTERED 
(
	[siteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 3.01.2021 18:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[userNo] [int] IDENTITY(1,1) NOT NULL,
	[nickName] [nvarchar](15) NOT NULL,
	[userType] [char](1) NOT NULL,
	[schoolNo] [int] NULL,
	[phoneNo] [nvarchar](20) NULL,
	[emailAddress] [nvarchar](100) NOT NULL,
	[gender] [char](1) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[personName] [nvarchar](60) NOT NULL,
	[personLastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[userNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Campus] ON 

INSERT [dbo].[tbl_Campus] ([campusNo], [campusName], [campusAddress]) VALUES (1, N'Kavacık(Güney)', N'Kavacık, 34810 Beykoz/İstanbul')
INSERT [dbo].[tbl_Campus] ([campusNo], [campusName], [campusAddress]) VALUES (5, N'Kavacık(Kuzey)', N'Kavacık, 34810 Beykoz/İstanbul')
INSERT [dbo].[tbl_Campus] ([campusNo], [campusName], [campusAddress]) VALUES (6, N'Haliç', N'Cibali, Atatürk Blv. No:27, 34083 Fatih / Unkapanı/Fatih/İstanbul')
INSERT [dbo].[tbl_Campus] ([campusNo], [campusName], [campusAddress]) VALUES (7, N'Ankara', N'Üniversiteler Mahallesi,
Dumlupınar Bulvarı No:1
06800 Çankaya/Ankara')
INSERT [dbo].[tbl_Campus] ([campusNo], [campusName], [campusAddress]) VALUES (8, N'Esentepe', N'Kemalpaşa Esentepe Kampüsü, Üniversite Cd., 54050 Serdivan/Sakarya')
INSERT [dbo].[tbl_Campus] ([campusNo], [campusName], [campusAddress]) VALUES (9, N'Hendek', N'Başpınar, Sakarya Ünv. Eğitim Fakültesi, 54300 Hendek/Sakarya')
SET IDENTITY_INSERT [dbo].[tbl_Campus] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_City] ON 

INSERT [dbo].[tbl_City] ([cityNo], [cityName]) VALUES (1, N'İstanbul')
INSERT [dbo].[tbl_City] ([cityNo], [cityName]) VALUES (2, N'Ankara')
INSERT [dbo].[tbl_City] ([cityNo], [cityName]) VALUES (3, N'Sakarya')
SET IDENTITY_INSERT [dbo].[tbl_City] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Dormitory] ON 

INSERT [dbo].[tbl_Dormitory] ([dormNo], [dormName], [cityNo], [roomCount], [gender]) VALUES (3, N'ÜniYurt', 3, 135, N'E')
INSERT [dbo].[tbl_Dormitory] ([dormNo], [dormName], [cityNo], [roomCount], [gender]) VALUES (4, N'Adatoria', 3, 150, N'K')
INSERT [dbo].[tbl_Dormitory] ([dormNo], [dormName], [cityNo], [roomCount], [gender]) VALUES (5, N'Armoni', 1, 160, N'K')
INSERT [dbo].[tbl_Dormitory] ([dormNo], [dormName], [cityNo], [roomCount], [gender]) VALUES (6, N'Başarı', 1, 120, N'E')
INSERT [dbo].[tbl_Dormitory] ([dormNo], [dormName], [cityNo], [roomCount], [gender]) VALUES (7, N'Masal', 2, 110, N'K')
INSERT [dbo].[tbl_Dormitory] ([dormNo], [dormName], [cityNo], [roomCount], [gender]) VALUES (8, N'Yurt Akademi', 2, 160, N'E')
INSERT [dbo].[tbl_Dormitory] ([dormNo], [dormName], [cityNo], [roomCount], [gender]) VALUES (10, N'Mert Erdogan Yurdu', 2, 180, N'E')
SET IDENTITY_INSERT [dbo].[tbl_Dormitory] OFF
GO
INSERT [dbo].[tbl_DormitoryCharge] ([dormNo], [onePersonRoomCharge], [twoPersonRoomCharge], [threePersonRoomCharge], [fourPersonRoomCharge]) VALUES (3, 25000, 20000, 15000, 13000)
INSERT [dbo].[tbl_DormitoryCharge] ([dormNo], [onePersonRoomCharge], [twoPersonRoomCharge], [threePersonRoomCharge], [fourPersonRoomCharge]) VALUES (4, 25000, 20000, 15000, 13000)
INSERT [dbo].[tbl_DormitoryCharge] ([dormNo], [onePersonRoomCharge], [twoPersonRoomCharge], [threePersonRoomCharge], [fourPersonRoomCharge]) VALUES (5, 35000, 30000, 25000, 20000)
INSERT [dbo].[tbl_DormitoryCharge] ([dormNo], [onePersonRoomCharge], [twoPersonRoomCharge], [threePersonRoomCharge], [fourPersonRoomCharge]) VALUES (6, 40000, 35000, 30000, 25000)
INSERT [dbo].[tbl_DormitoryCharge] ([dormNo], [onePersonRoomCharge], [twoPersonRoomCharge], [threePersonRoomCharge], [fourPersonRoomCharge]) VALUES (7, 30000, 24000, 18000, 12000)
INSERT [dbo].[tbl_DormitoryCharge] ([dormNo], [onePersonRoomCharge], [twoPersonRoomCharge], [threePersonRoomCharge], [fourPersonRoomCharge]) VALUES (10, 25000, 21000, 18000, 15000)
GO
INSERT [dbo].[tbl_DormitoryContact] ([dormNo], [dormAddress], [dormPhone], [dormEmailAddress]) VALUES (3, N'Esentepe Serdivan, Sakarya', N'5390134923', N'uniyurt@gmail.com')
INSERT [dbo].[tbl_DormitoryContact] ([dormNo], [dormAddress], [dormPhone], [dormEmailAddress]) VALUES (4, N'Esentepe Serdivan, Sakarya', N'5242488484', N'adatoria@gmail.com')
INSERT [dbo].[tbl_DormitoryContact] ([dormNo], [dormAddress], [dormPhone], [dormEmailAddress]) VALUES (5, N'Kavacık, İstanbul', N'5455544088', N'armoni@gmail.com')
INSERT [dbo].[tbl_DormitoryContact] ([dormNo], [dormAddress], [dormPhone], [dormEmailAddress]) VALUES (6, N'Kavacık, İstanbul', N'5288221914', N'basari@gmail.com')
INSERT [dbo].[tbl_DormitoryContact] ([dormNo], [dormAddress], [dormPhone], [dormEmailAddress]) VALUES (7, N'Merkez ,Ankara', N'5328849238', N'masalyurt@gmail.com')
INSERT [dbo].[tbl_DormitoryContact] ([dormNo], [dormAddress], [dormPhone], [dormEmailAddress]) VALUES (10, N'Ankara', N'5396253858', N'mert.erdogan@gmail.com')
GO
INSERT [dbo].[tbl_DormitoryPublicPlaces] ([dormNo], [sportsArea], [gym], [pool], [musicRoom]) VALUES (3, 1, 1, 1, 1)
INSERT [dbo].[tbl_DormitoryPublicPlaces] ([dormNo], [sportsArea], [gym], [pool], [musicRoom]) VALUES (4, 0, 1, 0, 1)
INSERT [dbo].[tbl_DormitoryPublicPlaces] ([dormNo], [sportsArea], [gym], [pool], [musicRoom]) VALUES (5, 1, 1, 1, 1)
INSERT [dbo].[tbl_DormitoryPublicPlaces] ([dormNo], [sportsArea], [gym], [pool], [musicRoom]) VALUES (6, 1, 1, 1, 1)
INSERT [dbo].[tbl_DormitoryPublicPlaces] ([dormNo], [sportsArea], [gym], [pool], [musicRoom]) VALUES (7, 1, 1, 1, 1)
INSERT [dbo].[tbl_DormitoryPublicPlaces] ([dormNo], [sportsArea], [gym], [pool], [musicRoom]) VALUES (10, 1, 1, 0, 0)
GO
INSERT [dbo].[tbl_DormitoryServices] ([dormNo], [roomCleaningDayWeekly], [laundryRoom], [eveningDinner], [breakfast]) VALUES (3, 2, 1, 1, 1)
INSERT [dbo].[tbl_DormitoryServices] ([dormNo], [roomCleaningDayWeekly], [laundryRoom], [eveningDinner], [breakfast]) VALUES (4, 2, 1, 0, 0)
INSERT [dbo].[tbl_DormitoryServices] ([dormNo], [roomCleaningDayWeekly], [laundryRoom], [eveningDinner], [breakfast]) VALUES (5, 3, 1, 1, 1)
INSERT [dbo].[tbl_DormitoryServices] ([dormNo], [roomCleaningDayWeekly], [laundryRoom], [eveningDinner], [breakfast]) VALUES (6, 4, 1, 1, 1)
INSERT [dbo].[tbl_DormitoryServices] ([dormNo], [roomCleaningDayWeekly], [laundryRoom], [eveningDinner], [breakfast]) VALUES (7, 4, 1, 1, 1)
INSERT [dbo].[tbl_DormitoryServices] ([dormNo], [roomCleaningDayWeekly], [laundryRoom], [eveningDinner], [breakfast]) VALUES (10, 4, 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tbl_OfficeContact] ON 

INSERT [dbo].[tbl_OfficeContact] ([officeNo], [officeCityNo], [officeAddress]) VALUES (1, 3, N'Medeniyet Caddesi, Esentepe Mahallesi no:21, Serdivan/Sakarya')
INSERT [dbo].[tbl_OfficeContact] ([officeNo], [officeCityNo], [officeAddress]) VALUES (2, 1, N'Vatan Caddesi, Oğuzhan Sokak no:14, Fatih/istanbul')
SET IDENTITY_INSERT [dbo].[tbl_OfficeContact] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_School] ON 

INSERT [dbo].[tbl_School] ([schoolNo], [schoolName], [campusNo], [cityNo]) VALUES (1, N'Medipol Üniversitesi', 1, 1)
INSERT [dbo].[tbl_School] ([schoolNo], [schoolName], [campusNo], [cityNo]) VALUES (3, N'Medipol Üniversitesi', 5, 1)
INSERT [dbo].[tbl_School] ([schoolNo], [schoolName], [campusNo], [cityNo]) VALUES (4, N'Medipol Üniversitesi', 6, 1)
INSERT [dbo].[tbl_School] ([schoolNo], [schoolName], [campusNo], [cityNo]) VALUES (5, N'Orta Doğu Teknik Üniversitesi', 7, 2)
INSERT [dbo].[tbl_School] ([schoolNo], [schoolName], [campusNo], [cityNo]) VALUES (7, N'Sakarya Üniversitesi', 8, 3)
INSERT [dbo].[tbl_School] ([schoolNo], [schoolName], [campusNo], [cityNo]) VALUES (8, N'Sakarya Üniversitesi', 9, 3)
SET IDENTITY_INSERT [dbo].[tbl_School] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_SiteContact] ON 

INSERT [dbo].[tbl_SiteContact] ([siteID], [siteName], [siteEmailAddress]) VALUES (1, N'yurtBul', N'theripperjackx@gmail.com')
SET IDENTITY_INSERT [dbo].[tbl_SiteContact] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_User] ON 

INSERT [dbo].[tbl_User] ([userNo], [nickName], [userType], [schoolNo], [phoneNo], [emailAddress], [gender], [password], [personName], [personLastName]) VALUES (1, N'b181210046', N'A', 3, N'5332437373', N'mustafa.kayabas@ogr.sakarya.edu.tr', N'E', N'123', N'Mustafa', N'Kayabaş')
INSERT [dbo].[tbl_User] ([userNo], [nickName], [userType], [schoolNo], [phoneNo], [emailAddress], [gender], [password], [personName], [personLastName]) VALUES (2, N'theripperjack', N'K', 7, N'5389136825', N'theripperjackx@gmail.com', N'E', N'prepernburn', N'Mustafa', N'Kayabaş')
INSERT [dbo].[tbl_User] ([userNo], [nickName], [userType], [schoolNo], [phoneNo], [emailAddress], [gender], [password], [personName], [personLastName]) VALUES (3, N'ahmetyy', N'K', 5, N'5313242122', N'ahmet@gmail.com', N'E', N'ahmet123', N'Ahmet', N'Yılmaz')
INSERT [dbo].[tbl_User] ([userNo], [nickName], [userType], [schoolNo], [phoneNo], [emailAddress], [gender], [password], [personName], [personLastName]) VALUES (5, N'ahmetyy', N'K', NULL, N'5313242122', N'ahmet@gmail.com', N'E', N'ahmet123', N'Ahmet', N'Yılmaz')
INSERT [dbo].[tbl_User] ([userNo], [nickName], [userType], [schoolNo], [phoneNo], [emailAddress], [gender], [password], [personName], [personLastName]) VALUES (6, N'enesbatur', N'K', 5, N'5313242122', N'enesbaturcaturcutur@gmail.com', N'E', N'kalem12321', N'enes', N'batur')
INSERT [dbo].[tbl_User] ([userNo], [nickName], [userType], [schoolNo], [phoneNo], [emailAddress], [gender], [password], [personName], [personLastName]) VALUES (7, N'', N'K', NULL, N'', N'', N'E', N'', N'sdfds', N'dsfsd')
INSERT [dbo].[tbl_User] ([userNo], [nickName], [userType], [schoolNo], [phoneNo], [emailAddress], [gender], [password], [personName], [personLastName]) VALUES (8, N'pengus', N'K', 4, N'5389741212', N'ozlem192@gmail.com', N'K', N'melak321', N'Özlem', N'Odacı')
INSERT [dbo].[tbl_User] ([userNo], [nickName], [userType], [schoolNo], [phoneNo], [emailAddress], [gender], [password], [personName], [personLastName]) VALUES (9, N'sweetbite', N'K', 3, N'5389136252', N'dogu99@gmail.com', N'E', N'fatheeer', N'Doğukan', N'Heşimli')
INSERT [dbo].[tbl_User] ([userNo], [nickName], [userType], [schoolNo], [phoneNo], [emailAddress], [gender], [password], [personName], [personLastName]) VALUES (10, N'swetewfs', N'K', 1, N'5302532432', N'dgkfdsa@gmail.c0m', N'E', N'fesdafsda', N'Doğukan', N'Baş')
INSERT [dbo].[tbl_User] ([userNo], [nickName], [userType], [schoolNo], [phoneNo], [emailAddress], [gender], [password], [personName], [personLastName]) VALUES (11, N'serenat', N'K', 4, N'05389672468', N'serenatvarol@gmail.com', N'E', N'silgi123', N'Serenat', N'Varol')
INSERT [dbo].[tbl_User] ([userNo], [nickName], [userType], [schoolNo], [phoneNo], [emailAddress], [gender], [password], [personName], [personLastName]) VALUES (1011, N'merterdogan', N'K', 7, N'5326863525', N'merterdogan@gmail.com', N'E', N'silgi123', N'Mert', N'Erdoğan')
SET IDENTITY_INSERT [dbo].[tbl_User] OFF
GO
ALTER TABLE [dbo].[tbl_Dormitory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Dormitory_tbl_City] FOREIGN KEY([cityNo])
REFERENCES [dbo].[tbl_City] ([cityNo])
GO
ALTER TABLE [dbo].[tbl_Dormitory] CHECK CONSTRAINT [FK_tbl_Dormitory_tbl_City]
GO
ALTER TABLE [dbo].[tbl_DormitoryCharge]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DormitoryCharge_tbl_Dormitory] FOREIGN KEY([dormNo])
REFERENCES [dbo].[tbl_Dormitory] ([dormNo])
GO
ALTER TABLE [dbo].[tbl_DormitoryCharge] CHECK CONSTRAINT [FK_tbl_DormitoryCharge_tbl_Dormitory]
GO
ALTER TABLE [dbo].[tbl_DormitoryContact]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DormitoryContact_tbl_Dormitory] FOREIGN KEY([dormNo])
REFERENCES [dbo].[tbl_Dormitory] ([dormNo])
GO
ALTER TABLE [dbo].[tbl_DormitoryContact] CHECK CONSTRAINT [FK_tbl_DormitoryContact_tbl_Dormitory]
GO
ALTER TABLE [dbo].[tbl_DormitoryPublicPlaces]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DormitoryPublicPlaces_tbl_Dormitory] FOREIGN KEY([dormNo])
REFERENCES [dbo].[tbl_Dormitory] ([dormNo])
GO
ALTER TABLE [dbo].[tbl_DormitoryPublicPlaces] CHECK CONSTRAINT [FK_tbl_DormitoryPublicPlaces_tbl_Dormitory]
GO
ALTER TABLE [dbo].[tbl_DormitoryServices]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DormitoryServices_tbl_Dormitory] FOREIGN KEY([dormNo])
REFERENCES [dbo].[tbl_Dormitory] ([dormNo])
GO
ALTER TABLE [dbo].[tbl_DormitoryServices] CHECK CONSTRAINT [FK_tbl_DormitoryServices_tbl_Dormitory]
GO
ALTER TABLE [dbo].[tbl_School]  WITH CHECK ADD  CONSTRAINT [FK_tbl_School_tbl_Campus] FOREIGN KEY([campusNo])
REFERENCES [dbo].[tbl_Campus] ([campusNo])
GO
ALTER TABLE [dbo].[tbl_School] CHECK CONSTRAINT [FK_tbl_School_tbl_Campus]
GO
ALTER TABLE [dbo].[tbl_School]  WITH CHECK ADD  CONSTRAINT [FK_tbl_School_tbl_City] FOREIGN KEY([cityNo])
REFERENCES [dbo].[tbl_City] ([cityNo])
GO
ALTER TABLE [dbo].[tbl_School] CHECK CONSTRAINT [FK_tbl_School_tbl_City]
GO
ALTER TABLE [dbo].[tbl_User]  WITH CHECK ADD  CONSTRAINT [FK_tbl_User_tbl_School] FOREIGN KEY([schoolNo])
REFERENCES [dbo].[tbl_School] ([schoolNo])
GO
ALTER TABLE [dbo].[tbl_User] CHECK CONSTRAINT [FK_tbl_User_tbl_School]
GO
/****** Object:  StoredProcedure [dbo].[userAdd]    Script Date: 3.01.2021 18:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[userAdd](
@Nickname nvarchar(50),
@CampusName nvarchar(50),
@TelNo nvarchar(50),
@Email nvarchar(250),
@gender char(1),
@password nvarchar(20),
@personName nvarchar(60),
@personLastName nvarchar(50)
)
as
begin
insert into tbl_User values(@Nickname,'K',(select schoolNo from tbl_Campus Ca,tbl_School S,tbl_City C where C.cityNo=s.cityNo and Ca.campusNo=S.campusNo 
and campusName=@CampusName),@TelNo,@Email,@gender,@password,@personName,@personLastName)
end
GO
