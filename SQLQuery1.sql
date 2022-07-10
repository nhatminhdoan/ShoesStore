USE [master]
GO
/****** Object:  Database [project]    Script Date: 3/23/2022 10:33:18 AM ******/
CREATE DATABASE [project]
ALTER DATABASE [project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [project] SET ARITHABORT OFF 
GO
ALTER DATABASE [project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [project] SET RECOVERY FULL 
GO
ALTER DATABASE [project] SET  MULTI_USER 
GO
ALTER DATABASE [project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'project', N'ON'
GO
ALTER DATABASE [project] SET QUERY_STORE = OFF
GO
USE [project]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/23/2022 10:33:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/23/2022 10:33:18 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/23/2022 10:33:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NULL,
	[Phone] [nvarchar](50) NULL,
	[Total] [money] NULL,
	[userid] [int] NOT NULL,
	[OrderDate] [date] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/23/2022 10:33:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[productID] [int] NOT NULL,
	[orderID] [int] NOT NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[productID] ASC,
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 3/23/2022 10:33:18 AM ******/
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
	[cateID] [int] NOT NULL,
	[sell_ID] [int] NULL,
	[amount] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (1, N'dat', N'123', 1, 1)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (2, N'hung', N'123', 0, 0)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (3, N'linh', N'123', 0, 0)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (4, N'Katell', N'123', 0, 0)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (5, N'Zahir', N'123', 1, 0)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (6, N'Conan', N'123', 1, 0)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (7, N'Cade', N'123', 1, 0)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (8, N'Micah', N'123', 0, 0)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (9, N'Rowan', N'123', 1, 1)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (10, N'Kirby', N'123', 1, 0)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (11, N'Tanisha', N'123', 0, 1)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (12, N'Howard', N'123', 0, 1)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (13, N'Tana', N'123', 0, 0)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (14, N'Hadassah', N'123', 1, 0)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (15, N'Echo', N'123', 1, 0)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (16, N'Slade', N'123', 0, 0)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (17, N'Devin', N'123', 1, 0)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (18, N'Rowan', N'123', 1, 0)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (19, N'Rafael', N'123', 1, 0)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (20, N'Madaline', N'123', 0, 1)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (21, N'Vera', N'123', 0, 1)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (22, N'Declan', N'ZKE7QZ', 1, 1)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (23, N'Katell', N'SFS0IW', 1, 1)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (24, N'Summer', N'PSQ7LC', 0, 1)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (25, N'Robin', N'KIS9AF', 1, 1)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (27, N'admin', N'123', 1, 1)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (28, N'mra', N'mra', 0, 0)
GO
INSERT [dbo].[Account] ([uID], [username], [pass], [isSell], [isAdmin]) VALUES (29, N'mrb', N'123', 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'GIÀY ADIDAS')
GO
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'GIÀY NIKE')
GO
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'GIÀY BITI''S')
GO
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'GIÀY CONVERSE')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([id], [CustomerName], [Phone], [Total], [userid], [OrderDate]) VALUES (1, NULL, NULL, 780.0000, 2, CAST(N'2022-03-23' AS Date))
GO
INSERT [dbo].[Order] ([id], [CustomerName], [Phone], [Total], [userid], [OrderDate]) VALUES (2, N'120 VT', N'1231231', 270.0000, 2, CAST(N'2022-03-23' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([productID], [orderID], [price], [quantity]) VALUES (2, 1, 120.0000, 2)
GO
INSERT [dbo].[OrderDetail] ([productID], [orderID], [price], [quantity]) VALUES (3, 1, 130.0000, 2)
GO
INSERT [dbo].[OrderDetail] ([productID], [orderID], [price], [quantity]) VALUES (3, 2, 130.0000, 1)
GO
INSERT [dbo].[OrderDetail] ([productID], [orderID], [price], [quantity]) VALUES (4, 1, 140.0000, 2)
GO
INSERT [dbo].[OrderDetail] ([productID], [orderID], [price], [quantity]) VALUES (4, 2, 140.0000, 1)
GO
SET IDENTITY_INSERT [dbo].[product] ON 
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (2, N'Giày chạy bộ', N'https://canary.contestimg.wish.com/api/webimage/5d5bd678d55c843e49fe3077-normal.jpg?cache_buster=ddfc80fb52c6bd85a67c68ceb94a91d7', 120.0000, N'Giày Adidas Nova Run EE9266
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 2, 6, 10)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (3, N'Giày du lịch', N'https://canary.contestimg.wish.com/api/webimage/5da6e559dcf2d00d2fbc707c-normal.jpg?cache_buster=d9139cea7e503395b907432f89e292d6', 130.0000, N'Dép đúc thể thao nam Adidas Adilette Boost Slides Đen - EH2256
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 1, 7, 11)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (4, N'Giày adidas 2A', N'https://image.yes24.vn/Upload/ProductImage/thethaochinhang/2063162_L.jpg?width=550&height=550', 140.0000, N'Giày thể thao nam Adidas Enerergy Falcon EE9844
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 2, 1, 12)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (5, N'Giày adidas 2B', N'https://image.yes24.vn/Upload/ProductImage/thethaochinhang/2063770_L.jpg?width=550&height=550', 150.0000, N'Giày đá bóng nam chính hãng Adidas Predator 18.4 FXG DB2007
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 1, 6, 18)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (6, N'Giày adidas 2C', N'https://image.yes24.vn/Upload/ProductImage/GmarketSport/2016304_L.jpg?width=550&height=550', 160.0000, N'Giày đá bóng nam chính hãng Adidas Copa Tango 18.3 TF DB2410
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 2, 7, 19)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (7, N'Giày adidas 2D', N'https://image.yes24.vn/Upload/ProductImage/GmarketSport/2058803_L.jpg?width=550&height=550', 170.0000, N'Giày đá bóng nam chính hãng Adidas X TANGO 18.4 TF DB2479
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 1, 14, 22)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (8, N'New Men''s Running Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a05a08b26e56dcf17a643-normal.jpg?cache_buster=6d01b751858e14e68932bb234cdc44c1', 150.0000, N'Comfortable Sports Shoes Men Athletic Outdoor Cushioning Sneakers for Walking&Jogging (EUR Size 39-48)', N'New Men''s Running Shoes Comfortable Sports Shoes Men Athletic Outdoor Cushioning Sneakers for Walking&Jogging (EUR Size 39-48)', 4, 15, 12)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (9, N'Men Hiking Shoes Waterproof Non', N'https://canary.contestimg.wish.com/api/webimage/5dc3c309d8b69d0de8949a21-large.jpg?cache_buster=68ad269a9f7b07d0effa9e48c1dc5c0f', 180.0000, N'Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-47 3 Colors
', N'Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-47 3 Colors
', 3, 14, 13)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (10, N'Winter Men''s Snow Boots Plus Velvet', N'https://canary.contestimg.wish.com/api/webimage/5da3d0b594a0f07fdec6c5ac-large.jpg?cache_buster=a2471ea62eba44e7c0b0f4d2b4c64681', 180.0000, N'Winter Men''s Snow Boots Plus Velvet Cotton Shoes Men''s Shoes Martin Cotton Boots Warm Shoes
', N'Winter Men''s Snow Boots Plus Velvet Cotton Shoes Men''s Shoes Martin Cotton Boots Warm Shoes
', 4, 15, 16)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (11, N'New Trend Men Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5df1f07d1fc34e0c50f78eb7-large.jpg?cache_buster=36188c130400df0faa4256aad8e90109', 150.0000, N'New Trend Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-48
', N'New Trend Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-48
', 3, 17, 17)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (12, N'Mens Skid Resistant Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5f3fb6d1b2a7ef003f6bd8a4-large.jpg?cache_buster=c9295f971ce194c1e68f6144f11314c6', 165.0000, N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoor Sport Shoes Fashion Sneakers
', N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoor Sport Shoes Fashion Sneakers
', 3, 19, 20)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (13, N'NEW Spring White Shoes Men', N'https://canary.contestimg.wish.com/api/webimage/5d0235c9ae115f0be32755ef-large.jpg?cache_buster=fd2c105001ca1cbb03795818542906cc', 185.0000, N'NEW Spring White Shoes Men Shoes Men''s Casual Shoes Fashion Sneakers Street Cool Man Footwear
', N'NEW Spring White Shoes Men Shoes Men''s Casual Shoes Fashion Sneakers Street Cool Man Footwear
', 3, 18, 21)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (14, N'Winter Outdoor Waterproof', N'https://canary.contestimg.wish.com/api/webimage/5d70b17d55d5981ab5789f86-large.jpg?cache_buster=19f34456a6b274b940c839db21c2ab51', 200.0000, N'Winter Outdoor Waterproof Non-slip Plus Velvet Warm Snow Boots Cotton Boots Men''s Shoes
', N'Winter Outdoor Waterproof Non-slip Plus Velvet Warm Snow Boots Cotton Boots Men''s Shoes
', 4, 1, 23)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (15, N'Men''s Fashion Casual Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a06d9e6a1c62df8877125-large.jpg?cache_buster=d17e757a3f8465edc71812b95b4b1a57', 100.0000, N'Men''s Fashion Casual Shoes Sports Running Shoes Men''s Shoes
', N'Men''s Fashion Casual Shoes Sports Running Shoes Men''s Shoes
', 4, 6, 24)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (16, N'Mens Skid Resistant Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a02d1344e882b1a41bca4-large.jpg?cache_buster=bc4ce4d229ed4e42dbba614acb622899', 120.0000, N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors
', N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors
', 4, 7, 25)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (17, N'Men''s Modern Classic Lace Up Lined', N'https://canary.contestimg.wish.com/api/webimage/5c9543744578cb33ad0f56cd-large.jpg?cache_buster=ed84658c453c742ad13b9d565566ed06', 100.0000, N'Men''s Modern Classic Lace Up Lined Perforated Dress Oxfords Shoes Flexible and Comfort oxfords
', N'Men''s Modern Classic Lace Up Lined Perforated Dress Oxfords Shoes Flexible and Comfort oxfords
', 3, 1, 26)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (19, N'Giày thể thao đi chơi với gấu', N'https://cdn.hoang-phuc.com/media/catalog/product/cache/911a4dad289f521f5a511212882e4276/3/1/31167yw-a09-vuong.jpg', 100.0000, N'Doraemon', NULL, 1, 1, 12)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (20, N'giày ', N'data:image/jpeg;base64,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', 123.0000, N'Giày vớ vẩn ấy mà', N'Giày vớ vẩn ấy mà', 1, 1, 12)
GO
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [amount]) VALUES (21, N'Giayyy', N'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXxlbnwwfHwwfHw%3D&w=1000&q=80', 314.0000, N'giày ngu ngốc', N'Giày ngốc nghếch', 2, 1, 10)
GO
SET IDENTITY_INSERT [dbo].[product] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([userid])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_product] FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_Category]
GO
USE [master]
GO
ALTER DATABASE [project] SET  READ_WRITE 
GO
