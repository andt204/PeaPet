USE [master]
GO
/****** Object:  Database [Ass]    Script Date: 11/11/2023 1:59:10 AM ******/
CREATE DATABASE [Ass]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ass', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\Ass.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ass_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\Ass_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Ass] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ass].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ass] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ass] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ass] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ass] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ass] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ass] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ass] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ass] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ass] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ass] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ass] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ass] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ass] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ass] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ass] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ass] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ass] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ass] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ass] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ass] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ass] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ass] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ass] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ass] SET  MULTI_USER 
GO
ALTER DATABASE [Ass] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ass] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ass] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ass] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ass] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ass] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Ass] SET QUERY_STORE = OFF
GO
USE [Ass]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/11/2023 1:59:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[firstName] [varchar](255) NULL,
	[lastName] [varchar](255) NULL,
	[address] [varchar](255) NULL,
	[dob] [date] NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
 CONSTRAINT [PK__Account__DD771E3C696BFCB4] PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/11/2023 1:59:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[AccountID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/11/2023 1:59:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11/11/2023 1:59:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[o_id] [int] IDENTITY(1,1) NOT NULL,
	[p_id] [int] NULL,
	[u_id] [int] NULL,
	[o_quantity] [int] NULL,
	[o_date] [varchar](450) NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[o_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/11/2023 1:59:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [firstName], [lastName], [address], [dob], [isSell], [isAdmin]) VALUES (1, N'admin', N'1', N'An', N'Do Truong', N'Ha Noi', CAST(N'2003-04-20' AS Date), 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [firstName], [lastName], [address], [dob], [isSell], [isAdmin]) VALUES (2, N'a', N'1', N'Giang', N'Nguyen Van', N'Ho Chi Minh', CAST(N'2000-05-21' AS Date), 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [firstName], [lastName], [address], [dob], [isSell], [isAdmin]) VALUES (3, N'b', N'1', N'Thanh', N'Bui Van', N'Hai Phong', CAST(N'1988-09-08' AS Date), 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [firstName], [lastName], [address], [dob], [isSell], [isAdmin]) VALUES (4, N'c', N'1', N'Phong', N'Nguyen Dac', N'Da Nang', CAST(N'1985-03-30' AS Date), 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [firstName], [lastName], [address], [dob], [isSell], [isAdmin]) VALUES (5, N'Zahir', N'NPX7OF', N'Nguyen', N'Nguyen Thao', N'Can Tho', CAST(N'1999-06-17' AS Date), 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [firstName], [lastName], [address], [dob], [isSell], [isAdmin]) VALUES (6, N'Conan', N'WIZ5VZ', N'Lam', N'Nguyen Duc ', N'Hai Duong', CAST(N'1990-04-28' AS Date), 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [firstName], [lastName], [address], [dob], [isSell], [isAdmin]) VALUES (7, N'Cade', N'ZSW2LU', N'Lap', N'Do Tu ', N'
Bac Giang', CAST(N'1981-02-10' AS Date), 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [firstName], [lastName], [address], [dob], [isSell], [isAdmin]) VALUES (9, N'Rowan', N'VAI6XR', N'Hoan', N'Dang Thi Kim', N'Ha Noi', CAST(N'2005-05-26' AS Date), 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [firstName], [lastName], [address], [dob], [isSell], [isAdmin]) VALUES (10, N'Kirby', N'DNX6JK', N'Hung', N'Ngo Le', N'Ha Noi', CAST(N'1991-03-14' AS Date), 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [firstName], [lastName], [address], [dob], [isSell], [isAdmin]) VALUES (12, N'Howard', N'TSR5MR', N'Quyen', N'Do Van', N'Ho Chi Minh', CAST(N'2004-02-02' AS Date), 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [firstName], [lastName], [address], [dob], [isSell], [isAdmin]) VALUES (13, N'Tana', N'EHS8CM', N'Khang', N'Tran Van', N'Ha Noi', CAST(N'1986-11-24' AS Date), 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [firstName], [lastName], [address], [dob], [isSell], [isAdmin]) VALUES (14, N'Hadassah', N'YOY7ZW', N'Dung', N'Nguyen Thi', N'Ho Chi Minh', CAST(N'2002-06-08' AS Date), 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [firstName], [lastName], [address], [dob], [isSell], [isAdmin]) VALUES (15, N'Echo', N'IGE8TN', N'Lam', N'Cao Hai', N'Ha Noi', CAST(N'1991-03-14' AS Date), 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [firstName], [lastName], [address], [dob], [isSell], [isAdmin]) VALUES (16, N'Slade', N'OFO6QS', N'Hoa', N'Nguyen Trung', N'Ha Noi', CAST(N'1996-12-09' AS Date), 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [firstName], [lastName], [address], [dob], [isSell], [isAdmin]) VALUES (17, N'Devin', N'IBM6RZ', N'Trung', N'Tran Quoc', N'Ha Noi', CAST(N'2005-05-26' AS Date), 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [firstName], [lastName], [address], [dob], [isSell], [isAdmin]) VALUES (18, N'Rowan', N'ZYS9VI', N'Mai', N'Nguyen Ngoc', N'Bac Ninh', CAST(N'1994-07-13' AS Date), 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [firstName], [lastName], [address], [dob], [isSell], [isAdmin]) VALUES (19, N'Rafael', N'WZA0IH', N'Kim', N'Bui Thi', N'Ho Chi Minh', CAST(N'1998-01-05' AS Date), 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [firstName], [lastName], [address], [dob], [isSell], [isAdmin]) VALUES (20, N'Madaline', N'QMW4EN', N'Nguyet', N'Nguyen Thi', N'Ha Noi', CAST(N'1987-08-22' AS Date), 0, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'DOG')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'CAT')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'HAMSTER')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'RABBIT')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (5, N'PARROT')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (6, N'TURTLE')
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([o_id], [p_id], [u_id], [o_quantity], [o_date]) VALUES (41, 3, 4, 1, N'2023-11-10')
INSERT [dbo].[orders] ([o_id], [p_id], [u_id], [o_quantity], [o_date]) VALUES (42, 4, 1, 1, N'2023-11-10')
INSERT [dbo].[orders] ([o_id], [p_id], [u_id], [o_quantity], [o_date]) VALUES (43, 3, 1, 3, N'2023-11-10')
INSERT [dbo].[orders] ([o_id], [p_id], [u_id], [o_quantity], [o_date]) VALUES (44, 4, 1, 1, N'2023-11-10')
INSERT [dbo].[orders] ([o_id], [p_id], [u_id], [o_quantity], [o_date]) VALUES (45, 4, 1, 2, N'2023-11-10')
INSERT [dbo].[orders] ([o_id], [p_id], [u_id], [o_quantity], [o_date]) VALUES (46, 5, 1, 1, N'2023-11-10')
INSERT [dbo].[orders] ([o_id], [p_id], [u_id], [o_quantity], [o_date]) VALUES (47, 3, 1, 1, N'2023-11-10')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (3, N'Mini Lop Rabbit', N'https://www.greenchimneys.org/wp-content/uploads/2023/01/ANIMAL_Thumb_Srpuce-the-rabbit-230x230.jpg', 300.0000, N'Mini Lop Rabbit', N'The Mini Lop Rabbit is a Dutch breed of rabbit. They are known for their floppy ears and soft fur.', 4, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (4, N'Macaw', N'https://www.hawkcreek.org/wp-content/uploads/2018/03/skye.jpg', 500.0000, N'Macaw', N'The Macaw is a South American breed of parrot. They are known for their ability to talk and mimic human speech.', 5, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (5, N'Maine Coon', N'https://www.toutagri.fr/wp-content/uploads/2018/12/Maine-Coon-4-230x230.jpg', 7000.0000, N'Maine Coon', N'The Maine Coon is an American breed of cat. They are known for their long, thick fur.', 2, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (6, N'Campbell''s Dwarf Hamster', N'https://trumpet.vn/thumbs/230x230x1/upload/product/thiet-ke-chua-co-ten-30-4289.png', 150.0000, N'Campbell''s Dwarf Hamster', N'The Campbell''s Dwarf Hamster is a Siberian breed of hamster. They are known for their gentle and cuddly personality.', 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (7, N'Labrador Retriever', N'data:image/jpeg;base64,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', 1200.0000, N'Labrador Retriever', N'The Labrador Retriever is a Canadian breed of dog. They are known for their friendly and swimming ability.', 1, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (8, N'British Longhair', N'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/BLH_cat_transparent.png/230px-BLH_cat_transparent.png', 500.0000, N'British Longhair', N'The British Longhair is a British breed of cat. They are known for their long, thick, and soft fur.', 2, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (9, N'Winter White Dwarf Hamster', N'https://allthingshamster.com/wp-content/uploads/2021/07/Hamster-with-green-background-230x230.jpg', 200.0000, N'Winter White Dwarf Hamster', N'The Winter White Dwarf Hamster is a Siberian breed of hamster. They are known for their gentle and cuddly personality.', 3, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (10, N'Sulcata Tortoise', N'https://www.cbreptile.com/wp-content/uploads/2017/07/Sulcata-tortoises-1.jpg', 200.0000, N'Sulcata Tortoise', N'The Sulcata Tortoise is an African breed of tortoise. They are known for their large size and long lifespan.', 6, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (11, N'Poodle', N'data:image/jpeg;base64,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', 1500.0000, N'Poodle', N'The Poodle is a German breed of dog. They are known for their curly fur and intelligent nature.', 1, 9)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (12, N'Angora Rabbit', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRk25jbkshy_4zzrpM8FYSIE-OkC4WxfTucUw&usqp=CAU', 400.0000, N'Angora Rabbit', N'The Angora Rabbit is a Turkish breed of rabbit. They are known for their long, soft fur.', 4, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (13, N'Cockatiel', N'https://www.oiseaux.net/photos/arnaud.delberghe/images/id/calopsitte.elegante.adel.1p.230.h.jpg', 300.0000, N'Cockatiel', N'The Cockatiel is an Australian breed of parrot. They are known for their friendly and talkative nature.', 5, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (14, N'Golden Retriever', N'https://ioupsi-joke.com/market/2309/tn3_IMG_8693.jpeg', 1000.0000, N'Golden Retriever', N'The Golden Retriever is a large, friendly, and intelligent breed of dog. They are known for their gentle nature and love of people.', 1, 9)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (15, N'German Shepherd', N'https://c.stocksy.com/a/9HD000/z3/51035.jpg', 100.0000, N'German Shepherd', N'The German Shepherd is a large, loyal, and protective breed of dog. They are known for their intelligence and trainability.', 1, 10)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (16, N'French Bulldog', N'https://dogsforsaleireland.ie/wp-content/uploads/2021/09/788C66FF-6E1C-4BCB-A146-B680723FE2B8-230x230.jpeg', 1200.0000, N'French Bulldog', N'The French Bulldog is a small, friendly, and affectionate breed of dog. They are known for their playful nature and love of attention.', 1, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (17, N'Siamese Cat', N'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUWFRgVFhYYGRgZGBgYHBgYGhoaGBkcGBgZGRgYGBgcIS4lHB4rHxgYJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QGBISGDEdGCExMTQxNDExNDQ0NDExMT80NDQ0MTExNDQ0ND8xNDE0PzExNDExMTExMTExMTExMTExMf/AABEIAOEA4QMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAAEAAECAwUGB//EADwQAAEDAgQDBgUDAgUEAwAAAAEAAhEDIQQxQVESYXEFIoGRobEGMsHR8BPh8RRCBzNSYnIVgpKiFlNU/8QAGAEBAQEBAQAAAAAAAAAAAAAAAAECAwT/xAAfEQEBAQEAAgMBAQEAAAAAAAAAARECEiEDMUFxURP/2gAMAwEAAhEDEQA/APJ0ycpgopJImnh2nN0HpbxhVV6Jab+BFwUFaZOmQJMnUUCKSRTIEkGkqxjN1aAs2rOVIpKwUgrA1SAUtanMQDAnhThIC6zrWGDU8KcJoU1cQhKFNKE0xCEi1ShIppiHCmIViUK6YqhRcxWkKJCuoofSVTmkIshMWrU6ZvIRJEfphJNTxqKspC6rlWYc3/N1pkZRYk8i7T8p9OYSpvzCjVT9PwFUp8JI29dZUEVXZLeIaWPTQ/RDHJLMESlKRTSgStYxMxquYySpVk/SaFMMOxRFJm3mrHuLSOe6nivkECdOBc9SkQud+2zFOwKJuVaiolMpJIIhIKSg5AgknCYoEkkkgYpk6ZBFNKdSDFpEUlPgSRApU8ObqtX4IAvANl0jmuc2Fa14iM+R+6qxro/ZW4TAOeAW73Go5rWezUcKZeBw2yI3Gq2cN8KNqGGPc2bjiA15jSUV2b2IWd59+X7ro8NUawAGLD0zWpz69s2uNxnwNjWSQxrxux4nlYrNHYGJBg4epI/2/VekD4g70TZaVLthr7Sl55pLY8hdgKrTDmOByuPqrDT4e6M9fsu+7bwfFLmkzBy9oXH/ANKQTJup4yNbappU4zVeJeCZ0H4ERWp2k29yga4gdVnr0siDEnJNTVCuDp+HphTKrY5ThMWEE6SaEDBRcpwogIEmCcpkCKZOVEuQIlRJUSVcykVcQzRCfiV4ZyKmxg2QC8SSN/TGySgxy07K3CU3FwgEoqyLwB70hdnPBeB7Kc+OMANm02PoujpYajRHcGeZXPVcaZgGEnsrPaXNNhrut89MWNut2mMm/tCoxeLBaGzcyLaEtIN9s1yPaLqjH8Li7iETe/giatcNe5jKn6jW/I8AjiEA3BvN4PMLVtMar394AFW0KjpiVkYauS6+aOw9nnqk/wBHW9n1ZHA435oDtXsoiXtuIkhZVfHhjuIujSOi3exe121QWm9rg6hX0OTc6XATqBG/RZVY3jaG+QEnzldL8Q9nHDvdVF2FvEzqbR4LleLfdcfkdOVrU1RJpUniy4tq2hWsMqLBZM62SotKZSYZTQoqLiotCdyvo4cu6IBipBhOhWgcNw6SlTMomghhXnRWs7P3KP4QLnyTtrDQJ5YYoZggNEQzDclIVDspNJOsKeRixmFHJT/ogoYd5c6NFqMYs3qozP8Ap4SWp+mElPKjhRSdujOzwQSCc0OKo2VmGrjjFovuvTdsZ2Ca7ET2V2gG912SlVZKBq4UzITnrKdTY6HtTs1mJIqA9+IMR3oHzcjZc7jex30iHAtgHIZ33VuHqvZaY+q1G0y+mSbn7XXfZf65Zn8ZlGkOOVtYOk0S7ZZOAxDQSNVssII7pu4RbfdXmei1j9tUX067K7BIhr2kiWyM2kfRbnZtCzazgGVHlzixo4WgE27ugR9PENDGscMumfiqR3nWmT4np0Vsie2h8QM48BVkAlreJvmMl5PxkZ/ma9W+JavBhnUx81ThYBqciVzmH+HGxL7nbQZ2XLv3XTn1HIsqokNdsfJdRQ7GYx0hgJ53jojhhdSAufgvljjqOFqHJhWjR7FquFwB1XUtoQr2WWpxC9VzuE+FiDLn56AWRzfhdh/uK2WBEtWpxyl6rnXfCbNHuUm9gOZkQ70XTtVjW7H0BS8cp5VxWIwdRsjgMbi6zHuIMBpHUL0Ys3VFbBMeIcGnw+q59fDv1W53jzwtJzRFAcN4XRY74ckTTMcjceaxH0HMPC9sEeXgVy64vLXlopsEXEId1ObDJTIyi6Ip07LnqajhqAblmieJSawKLmlA8JKPCU6g5JnZTf8AcepgKyn2c0HJlr5cX3Wm2lNyYv4KZ4RkJ639Mh6r0+SeMX02hwAlpPJoKZ/Z7nf2ePAG+pKtw+IdFrfnl6ItrC/5iY8b9ApqsKpRDHAkNkaNcOLxHEQU7qtwQHAcwD6haGN7NbEtaN+fWVgV2cJiCIPNdOesYvITtDBuouD2mWOJg/6deE81v/C+FqPcHud3RkN1k4jFOczgNxINxtstnszGuDQA7lEfRb56msXmuiqYdrzlbW0ifDJE9j4MB3EbgG05KvAMdHEQL5RIPiMoR7XACGnvEaaDcgrVu0kwJVotqVy4wQwd3/kcz9FeaKjgKPC5xgXz38kWIWftWY/DgFRbTCOrNVKCsMEKBAnPwCsc8KowgubCtDORQweNh6q1jx0800XNI1BHsojhm8jmOIfsqqr4/f6XUKdcSBxRyJt6qjSYNjP/AHfQqTc9R1hDU6pmC0dQr2ETEkHQHXo5UWvosI+ZwPIwhcT2eHWdDwdxDvAjNFhnPzCi6mdM1LJRy+K7INMlwBLfOPJCU3k2XYvki3zc/YjZZGM7ON3MBB1b9W7hcO/i/Y3Ov9AMaBmneAckG6sAYKc4sLh6/ftrKL8kkF/WhJPRlB4gSRH7fykGEiwsPVGNo3v5K5jJ0gBbKDot4c89Bp4o39WBJudttuiFeIeXfk/ZQe+brX4gw4qOep9lVVex4hzfLNCvdMhSpUyT9VVTpdkscRckbQtrs/slrTLWXOpV/ZWEsLD7rcpU4C7c8udoR9Lhb3ip4GgS0uOZ15KnFPutbCMAYAFftGZUEffVNSrTMiOaLxbdclly2SCfEhL6SLqzpH21QDnX1lGlwizpEboSoTrEbj6qVYrLhsnbGRVbiQcwegVkgjJFW8x5bKIfpPuoFvMjyVlOkXZE+KqJxOce6oxOEkG3/jY/ujGYQi0SEQyh1KYMmlWc2AQSBv8AMByOo5Iv9UwCBI5j8gqb8PvPLcclQ0OA7rgL5Ee6ewbTr9WnnqiWEOH5+BZjKpyJg+nQIunUi48x9QqCg233U2gZaqFBwdln6HmFZO9t/uFRgdudiB8vZ3X7D5X/AGK5I0nzBhvXNepMZNjcb/mq5L4t7CdBrU7kCXtH9wGref2XD5fi33HTnv8AK5r9I/6/dJZX9Z/vHmnXH/n06bHamlP5smps4pDgBGivDuEhut7ct1W+pDoIzsDudldYZ3abYDUGy60e2QQ1s7oLD0yclqfQuZSk5LUwmEjM2VOGo6LXwrI6R5rpzGLReGZwxe0Zq6rXgXTMZaEFjXQYXT8ZVVaknNbeBqd0LnGkF0LZw1v4UhRmJbIOd9lgVSQ/7rdNfdZuPptJ4grUgUtzIsdtD9ioOI2zF1ZXpEwRkhzGRCiq6kb/AEVTDoJVWJqhoOcIfDVnE8z6eCi43cNSBgm/RaVNhA7rZ6oXBsMRIEarQpcOh8VqRmp02u1DVPg5KIgbp3VAP7lpUXUwbGPVC18ENHR6otzhEgz6+yr/AFANc9D90AFTC5B0Ecs+oUabC0nhOWY0I36rSa5ptHhp4KL6Az+lx90AtMNPI5xlfcc0XTqGL5zE78iFQGbwR+X6K6mfwqglhGht+WVrxPr+e6G4drIhhOtiEZA/9Nof/Uz/AMAktSRy80kXXCUahjLIEndxHNXFswSQAc/DbmsZ3aQb8vLnkFJuNBbM3vfn0Xid8X9qFpaIkw6CVHBiAhjiA5kGA6ZVmFetRK16UQtLDVAbT6LFZUV+HxEOF1156YsdK0mBr0QmNptcNPzmp0HgjM+CbEztP5qun4yxX0odI06+y28M+Wjfa3sVnhoBvb85I3CkDZZhVt8hHt52Q1R8HTNGVN/dBVq1+fv4KiNUAjP1+sXWbXqBsjNvLRHvfI0/OSxu0ni/8KVYzcRW4ncOmd7/AFROAdAM2Mz1QeBp8TnHTLzR4ZFycogaLnrbXw1UZ3J62vyWlQxB1bHTLyWAxxGlrZI5laMzrqF0lYsbTXtIuPMZdVB7hlbxWfTxBBznY+8hGPhwBgdPtyWkM0gTFj5X9iphpNrdD90PbWY53A8UxoibOI8fRBdDjlkDlnBG4VzHvH92m35ZZdSs5riJlw0NpG3NWDFyLWOoOXRID5m9uY0PMFTAGRus5mIbIm08/NG0Jix4h6qglgifK6u57Z9FAAEc4zUHVCANgfwH81VZXyN/b7plVxs/AnVXHh/67t0/9S7dDuKjxLyY9GwY3FOF5Wx2fjg4cwubBVtKtwmQkiWuzZXEJGvB3WDh8Q5/ygzsFs4Xsyu8AkcI5rU5rF6jf7L7StwjRE4rFnNpWMzsnhg8Tg7luri6owgGHt5iD1C6SWRnR1HtBrrHP80RVJ4BkIRmFpv+ZviLEeKJp4NrIhxI5og9r5HVZeOctJkALK7SyJTq+iK6WJtcrMx784KKomx1QWIbK59dNyI9nAAzE95aDIzN75LPw1pHijmDfkpKtEU3C0aTdE03B1i3Uz9wg6IDTfImPP8AhPRdw3J6/stSpYPY0a9J9vFEMdACBpvDpgeeqMocMC/hqFuVmxaGFw7p8FW7BF2pBRNKo2e6YPoiWPJzA5OC1GfbExNJwbDrxcWv5qjhbINwZ8DbLqumDAbG/VUVcG24Asbjrt0WlYow2YjSf3HNQwuNcyzspiea2BS4ek+R2KFxOCBJcMjZw2O4UB1DEAwRnwkxum/UkTFnehWaymWEcjY8iFfReQSOh8Sgt/QdsfNJT/qn7JkHh7zuqw669sq9mUjALGy6TFrQYv4rB7W+C6bySzhB6x7Lzyt15kai1OwuzhWf3vlGe56KXafw9VomCJCP+H6gazh1m/5r4KyxMrtMBQpUmjgYBGsSfNE4jEyBFznZY1PEWAlOcTva0dF08pieNE/rOOfL+FNrj1E57INtUTPPx6KxtaLzKz5L4tGnUix80SyoJWO3EeKmzE357qeS41/1LGOqyMdXlRqYuBMoM1OIhTrokFWA/NkHUOyniMRbpZCOriyxa1E6Bly0Q+0LMov7yNpvU1cX2i/L6J3MknzUcyoOqnxyWp0mC6L4KmytEHP36IOnUJzRUTBC1Klgqg9pkC15hG06uehF/us9jRM7bbIxouF0lZsHtfMEG8fwfdXNE5nMX+jhsUDxyLWcLW6qdPF3vGZED1WpWbF7WEgg335jdVwQNzl1GikasHofeyc1BkdCqKTTDgq/0uEg+B8JhFsMHxj7KVUAt9UTQ/6KdPxJIqp7nF/ELiwyFpuYO0oxz3AWHn/Cva4N20uYiD9E76oka530tfJePydMDvwoeO8CeoEePJc7ifgug5xfTc6mZvwnibfPun6Quua8nIfnRVQZuc/BXyMcpS+FX8PdqAkT8wIB8VhY+g+k7hqNLTpOR5g5Fejt4ssrzGkKGJwjKrCx7GubMkOHsc/JJ0PNabwcvdW8ca+voV1jvg7CEyGOaTeGveBzQWL+C8O8GHVGHcOJHKxzWvKDAGJAzI81Cpjmj+4Kdf4DqA92oHt3uD4yhqvwtUY08RyOX1TRW7FzrZSOLDYvdBP7Ne3MclS+i4EzNrLOxvBVfF+6H/qrZ6oZ8qp4V0wcMfF1p4XHB0QVy751KlQqlpBBV8WNd4yoOFNKwaHaogAn9losxrSBdZsWUfTN0VSdHmgKFYORTAkq0fTqAWN5CJFQAxuJH2WYxpRlAkyHDSx2K681iiv1b8iLFDVnZ+f8IlrY6QfPP3UqtGRlIgey2iNGrxNvqFc1wjcEQfBBsYWmJ1t0Kv4fLPzSVFpqQSOYjwhW063dKD4ST6JM4gDOkhXTBPEN0kFBSTRqYioCGNzBLjJyJ+yrFcEhrCSWnw6KvH9+WCzsm+B+ZXdlN7smAZIM6kLyY6C2cUDSfPzVzaUXJFt1DF1YhoN9/oEMx5DSDJPNNQQXl0H+0HzSZxSRPQ/RJwkXsLZJw3hiczaJ8iqFTBO8gkclN22do8/opUma6m5U6lKcjwnQpRTRpBoiIEnX2nRNWwzHZj0SaJkH5h+SoGo4Ah06AOGX8ouMjHdkaiCPUbLAxnZkyIM9F3YN4LgSBKpewOFmiLjiO/RTxNseUY/sx7L8JjfdY1YRmvbThGxdrSMvwIPG/DWGqSH029RY+isi68YeP2US3RenV/gXCxxd9oBz4iUNV/w8Y4dyq8bEgELpsYebOcVdQxRbquox3wDiWiWuY/kZafqsHGdgYmn89F/Vo4va6egdgO0xMcvZbtDFgrgXOcwwQWnmCPdH4btItSxZXfUcSIutDDVhouKw3abSM4Wlhu0Yi6kti5rtW0w/X+dkXRpiBOhuuZwXaUarapdoAtnX3nf0XbnqOd5o+pgmm8X90NWwxbfMa8kZg8UHD6Kb3TPqteqz9M1jNekq2rTAnp7AKNYgE8zCHrV+9wnb6BRUv0klR/WDl5pKaY0qTO8HuHegt4f9OoB8FAVAHfqk9024dnKb4AaDaTJ5bWzUKg4gTkXEtiPmvnyXmdYTGFxl2pJDtByU+K8vveBGSTgWzAmALTlOyekeIOg2m+kFEEXtMC/pomNKRcy4GRvY781W10k8MwBlqCERInP5s+SC6k0EXEJxGUqphJ3Uy2cs0EKzAbXndCuqOaLslrc3A/RW46qWgOPy5Hlz6KFB4LXObFwYJ1hRUGV2OvbiO9iPyyVWm5390RHd0M81VSw3G0lzBxxBJ5bK+jhzw2cRB8D5qom8Q3cTp9VNrRoVVWdBHGO7EcQ1O0aIhrZM2IG2Y6oGgQBpGuV1VWY4QWX3bOm426IoAWB8lGq0TAyIg/RBVQcHNgiD/pPrdU4prmwWd4Wlpjig7cuSKdUY2GgXEx+aqgu7wgQfLNANUwtKoO9Sa4XkOAnxCxsT8E4KrJFPgm8scW+mS6ZlLhBLjedNeqcUgBJsDzk9FqdWGR55jv8ADeATQrmBo8SPMQg6XwLjGiQ+kSchxEfRel1nluhDSM412gKdIAwWmQ2TGvQlPIx5VicDiqE8dJ5AtxM77estn2Q7O2tnW2lexMDWiBF78h1G6yO1OwMNXtVpNJP97LEeLbjRJhrjOy/ibgI4zabnluu87OxTKrOJrg4akadQuQ7a/wAPW8IOGcWumCHklhHUCQUH2X8L47DOD2V2MgiQOIg8i1dOepE6mu7xOGBPCTnkfZYvanZjyHBtSHEcIIGWma2/1H06fE93E62QMEmMgE7bN4jmTtfnCddy/Sc8uD/+C4n/APSPVJdzLd//AFKSx5NYqxP+Y7/tUn/K3x90ySwsSo/MFGlm/wD5hJJIguj8x6hNRzd1KdJICaefgVLD5pJIBcbk/wD4lY+A+RnQ+6SSn6t+m5TzPT6JM+RJJVEK3yn80VeAzKZJIDBmOqj/AGu6pJJQBoOv1RGIzZ+ap0kgIGSrGbfBJJKLn/P4FBUflPUe5TJII0839QjsPkUklqCQ+bwKy+1P8sf8/umSVFeO/wAlnUe4R1L5WdXewSSWQSkkkor/2Q==', 600.0000, N'Siamese Cat', N'The Siamese Cat is a medium-sized, vocal, and affectionate breed of cat. They are known for their distinctive appearance and playful nature.', 2, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (18, N'Guinea Pig', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMa_GPn4gbol2LA09p6YIglQd47h_1U15EYw&usqp=CAU', 500.0000, N'Guinea Pig', N'The Guinea Pig is a small, social, and gentle breed of rodent. They are known for their playful nature and love of companionship.', 3, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (19, N'Dwarf Hamster', N'https://allthingshamster.com/wp-content/uploads/2021/07/Hamster-in-home-230x230.jpg', 200.0000, N'Dwarf Hamster', N'The Dwarf Hamster is a small, friendly, and gentle breed of rodent. They are known for their cuddly nature and love of attention.', 3, 17)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (20, N'Lionhead Rabbit', N'https://static.wixstatic.com/media/cf949c_7dcc7637ef692633700d551dcdcb91b0.png/v1/fill/w_230,h_230,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/cf949c_7dcc7637ef692633700d551dcdcb91b0.png', 1000.0000, N'Lionhead Rabbit', N'The Lionhead Rabbit is a medium-sized, friendly, and affectionate breed of rabbit. They are known for their distinctive mane of fur and gentle nature.', 4, 2)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (22, N'Yellow Foot Tortoise', N'https://cdn.shoplightspeed.com/shops/619790/files/45018865/230x230x1/captive-bred-sulcata-tortoise-baby.jpg', 300.0000, N'Yellow Foot Tortoise', N'"The yellow-footed tortoise (Chelonoidis denticulatus), also known as the Brazilian giant tortoise, is a species of tortoise in the family Testudinidae and is closely related to the red-footed tortoise (C. carbonarius). It is found in the Amazon Basin of South America. The species name has often been misspelled as denticulata, an error introduced in the 1980s when Chelonoidis was elevated to genus and mistakenly treated as feminine, an error recognized and fixed in 2017.

With an average length of 40 cm (15.75 in) and the largest known specimen at 94 cm (37 in), this is the sixth-largest tortoise species on Earth, after the Galapagos tortoise, the Aldabra tortoise, the African spurred tortoise (Geochelone sulcata, typical size 76 cm (30 in)), the leopard tortoise (Stigmochelys pardalis), and the Asian forest tortoise (Manouria emys emys, typical size 60 cm (23.6 in))."', 6, 1)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_product]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_Account] FOREIGN KEY([u_id])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_Account]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_product] FOREIGN KEY([p_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_Account] FOREIGN KEY([sell_ID])
REFERENCES [dbo].[Account] ([uID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_Account]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_Category]
GO
USE [master]
GO
ALTER DATABASE [Ass] SET  READ_WRITE 
GO
