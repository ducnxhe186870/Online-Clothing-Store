--Create Database FrontShop
USE [FrontShop]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[gmail] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[gender] [bit] NOT NULL,
	[roleID] [int] NOT NULL,
	[accStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[gmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[addID] [int] IDENTITY(1,1) NOT NULL,
	[gmail] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[city] [nvarchar](max) NOT NULL,
	[district] [nvarchar](max) NOT NULL,
	[ward] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[addID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[caID] [int] IDENTITY(1,1) NOT NULL,
	[caName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[caID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[proColorID] [int] IDENTITY(1,1) NOT NULL,
	[proColorName] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[proColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combo](
	[comboID] [int] IDENTITY(1,1) NOT NULL,
	[comboName] [nvarchar](max) NOT NULL,
	[Total_Money] [float] NOT NULL,
	[conboStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Combo] PRIMARY KEY CLUSTERED 
(
	[comboID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combo Detail](
	[comboID] [int] NOT NULL,
	[proID] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[proID] [int] NOT NULL,
	[RateStar] [int] NOT NULL,
	[Feedback] [nvarchar](max) NOT NULL,
	[gmail] [nvarchar](100) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orID] [int] IDENTITY(1,1) NOT NULL,
	[orDate] [date] NOT NULL,
	[gmail] [nvarchar](100) NOT NULL,
	[totalMoney] [float] NOT NULL,
	[orStatusID] [int] NOT NULL,
	[addID] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[orID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Detail](
	[orID] [int] NOT NULL,
	[stockID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_Order Detail] PRIMARY KEY CLUSTERED 
(
	[orID] ASC,
	[stockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[postID] [int] IDENTITY(1,1) NOT NULL,
	[tittle] [nvarchar](100) NOT NULL,
	[gmail] [nvarchar](100) NOT NULL,
	[toppic] [nvarchar](100) NOT NULL,
	[img] [nvarchar](max) NOT NULL,
	[detail] [nvarchar](max) NOT NULL,
	[date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[proID] [int] IDENTITY(1,1) NOT NULL,
	[proName] [nvarchar](200) NOT NULL,
	[proDetail] [nvarchar](max) NOT NULL,
	[proPrice] [float] NOT NULL,
	[caID] [int] NOT NULL,
	[proStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[proID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product Image](
	[proID] [int] NOT NULL,
	[proImg] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleID] [int] NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop Information](
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Facebook] [nvarchar](100) NOT NULL,
	[Gmail] [nvarchar](100) NOT NULL,
	[Phone] [nchar](20) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[sizeID] [int] IDENTITY(1,1) NOT NULL,
	[sizeName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[sizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[orStatusID] [int] NOT NULL,
	[orStatusName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[orStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[stockID] [int] IDENTITY(1,1) NOT NULL,
	[proID] [int] NOT NULL,
	[proColorID] [int] NOT NULL,
	[proSizeID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[stockStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[stockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([gmail], [password], [name], [gender], [roleID], [accStatus]) VALUES (N'minhnhhe186549@fpt.edu.vn', N'123456789abc', N'Nguyễn Hoàng Minh', 1, 1, 1)
INSERT [dbo].[Account] ([gmail], [password], [name], [gender], [roleID], [accStatus]) VALUES (N'ducnxhe186870@fpt.edu.vn', N'123456789abc', N'Nguyễn Xuân Đức', 1, 1, 1)
INSERT [dbo].[Account] ([gmail], [password], [name], [gender], [roleID], [accStatus]) VALUES (N'baonqhe170954@fpt.edu.vn', N'123456789abc', N'Nguyễn Quốc Bảo', 1, 1, 1)
INSERT [dbo].[Account] ([gmail], [password], [name], [gender], [roleID], [accStatus]) VALUES (N'anhndhe176501@fpt.edu.vn', N'123456789abc', N'Nguyễn Đức Anh', 1, 1, 1)
INSERT [dbo].[Account] ([gmail], [password], [name], [gender], [roleID], [accStatus]) VALUES (N'anhnlhe161897@fpt.edu.vn', N'123456789abc', N'Nguyễn Lan Anh', 0, 1, 1)
INSERT [dbo].[Account] ([gmail], [password], [name], [gender], [roleID], [accStatus]) VALUES (N'hminhh134@gmail.com', N'123456789a', N'Hoàng Minh', 1, 3, 1)
INSERT [dbo].[Account] ([gmail], [password], [name], [gender], [roleID], [accStatus]) VALUES (N'ducnx2004@gmail.com', N'123456789a', N'Xuân Đức', 1, 2, 1)
INSERT [dbo].[Account] ([gmail], [password], [name], [gender], [roleID], [accStatus]) VALUES (N'baonq@gmail.com', N'123456789a', N'Quốc Bảo', 1, 4, 1)
INSERT [dbo].[Account] ([gmail], [password], [name], [gender], [roleID], [accStatus]) VALUES (N'anhnd@gmail.com', N'123456789a', N'Đức Anh', 1, 4, 1)
INSERT [dbo].[Account] ([gmail], [password], [name], [gender], [roleID], [accStatus]) VALUES (N'anhnl@gmail.com', N'123456789a', N'Lan Anh', 0, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([addID], [gmail], [phone], [address], [city], [district], [ward]) VALUES (1, N'minhnhhe186549@fpt.edu.vn', N'09160xxxxx', N'21, ngõ 55/44', N'Hà Nội', N'Hoài Đức', N'Kim Chung')
INSERT [dbo].[Address] ([addID], [gmail], [phone], [address], [city], [district], [ward]) VALUES (2, N'ducnxhe186870@fpt.edu.vn', N'09660xxxxx', N'12', N'Thành phố Hà Nội', N'Quận Nam Từ Liêm', N'Phường Cầu Diễn')
INSERT [dbo].[Address] ([addID], [gmail], [phone], [address], [city], [district], [ward]) VALUES (3, N'baonqhe170954@fpt.edu.vn', N'03265xxxxx', N'21, 22/44 đường Đại Tự', N'Thành phố Hà Nội', N'Huyện Hoài Đức', N'Xã Kim Chung')
INSERT [dbo].[Address] ([addID], [gmail], [phone], [address], [city], [district], [ward]) VALUES (4, N'anhndhe176501@fpt.edu.vn', N'03838xxxxx', N'Số 12, đường Cốc Pài', N'Tỉnh Hà Giang', N'Huyện Xín Mần', N'Thị trấn Cốc Pài')
INSERT [dbo].[Address] ([addID], [gmail], [phone], [address], [city], [district], [ward]) VALUES (5, N'anhnlhe161897@fpt.edu.vn', N'09780xxxxx', N'46', N'Thành phố Hà Nội', N'Quận Tây Hồ', N'Phường Xuân La')
INSERT [dbo].[Address] ([addID], [gmail], [phone], [address], [city], [district], [ward]) VALUES (6, N'hminhh134@gmail.com', N'09160xxxxx', N'', N'', N'', N'')
INSERT [dbo].[Address] ([addID], [gmail], [phone], [address], [city], [district], [ward]) VALUES (7, N'ducnx2004@gmail.com', N'09660xxxxx', N'', N'', N'', N'')
INSERT [dbo].[Address] ([addID], [gmail], [phone], [address], [city], [district], [ward]) VALUES (8, N'anhnl@gmail.com', N'09780xxxxx', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([caID], [caName]) VALUES (1, N'Tshirt')
INSERT [dbo].[Categories] ([caID], [caName]) VALUES (2, N'Shirt')
INSERT [dbo].[Categories] ([caID], [caName]) VALUES (3, N'Polo')
INSERT [dbo].[Categories] ([caID], [caName]) VALUES (4, N'Sweater')
INSERT [dbo].[Categories] ([caID], [caName]) VALUES (5, N'Hoodie')
INSERT [dbo].[Categories] ([caID], [caName]) VALUES (6, N'Jacket')
INSERT [dbo].[Categories] ([caID], [caName]) VALUES (7, N'Short ')
INSERT [dbo].[Categories] ([caID], [caName]) VALUES (8, N'Pants')
INSERT [dbo].[Categories] ([caID], [caName]) VALUES (9, N'Accessories')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([proColorID], [proColorName]) VALUES (1, N'Black     ')
INSERT [dbo].[Color] ([proColorID], [proColorName]) VALUES (2, N'While     ')
INSERT [dbo].[Color] ([proColorID], [proColorName]) VALUES (3, N'Beige     ')
INSERT [dbo].[Color] ([proColorID], [proColorName]) VALUES (4, N'Blue      ')
INSERT [dbo].[Color] ([proColorID], [proColorName]) VALUES (5, N'Gray      ')
INSERT [dbo].[Color] ([proColorID], [proColorName]) VALUES (6, N'Dark Gray ')
INSERT [dbo].[Color] ([proColorID], [proColorName]) VALUES (7, N'Light Gray')
INSERT [dbo].[Color] ([proColorID], [proColorName]) VALUES (8, N'Brown     ')
INSERT [dbo].[Color] ([proColorID], [proColorName]) VALUES (9, N'Green     ')
INSERT [dbo].[Color] ([proColorID], [proColorName]) VALUES (10, N'Dark Green')
INSERT [dbo].[Color] ([proColorID], [proColorName]) VALUES (11, N'Yellow    ')
INSERT [dbo].[Color] ([proColorID], [proColorName]) VALUES (12, N'Red       ')
INSERT [dbo].[Color] ([proColorID], [proColorName]) VALUES (13, N'Dark Blue ')
INSERT [dbo].[Color] ([proColorID], [proColorName]) VALUES (14, N'Camo      ')
INSERT [dbo].[Color] ([proColorID], [proColorName]) VALUES (23, N'Orange    ')
INSERT [dbo].[Color] ([proColorID], [proColorName]) VALUES (24, N'Orange    ')
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Combo] ON 

INSERT [dbo].[Combo] ([comboID], [comboName], [Total_Money], [conboStatus]) VALUES (1, N'Monumental', 1830000, 1)
INSERT [dbo].[Combo] ([comboID], [comboName], [Total_Money], [conboStatus]) VALUES (2, N'Blissful', 2100000, 1)
INSERT [dbo].[Combo] ([comboID], [comboName], [Total_Money], [conboStatus]) VALUES (3, N'Aura', 1752000, 1)
INSERT [dbo].[Combo] ([comboID], [comboName], [Total_Money], [conboStatus]) VALUES (4, N'Trendy', 1211000, 1)

SET IDENTITY_INSERT [dbo].[Combo] OFF
GO
INSERT [dbo].[Combo Detail] ([comboID], [proID]) VALUES (1, 1)
INSERT [dbo].[Combo Detail] ([comboID], [proID]) VALUES (1, 20)
INSERT [dbo].[Combo Detail] ([comboID], [proID]) VALUES (1, 11)
INSERT [dbo].[Combo Detail] ([comboID], [proID]) VALUES (1,32)

INSERT [dbo].[Combo Detail] ([comboID], [proID]) VALUES (2, 33)
INSERT [dbo].[Combo Detail] ([comboID], [proID]) VALUES (2, 3)
INSERT [dbo].[Combo Detail] ([comboID], [proID]) VALUES (2, 21)
INSERT [dbo].[Combo Detail] ([comboID], [proID]) VALUES (2, 43)

INSERT [dbo].[Combo Detail] ([comboID], [proID]) VALUES (3, 2)
INSERT [dbo].[Combo Detail] ([comboID], [proID]) VALUES (3, 22)
INSERT [dbo].[Combo Detail] ([comboID], [proID]) VALUES (3, 41)
INSERT [dbo].[Combo Detail] ([comboID], [proID]) VALUES (3, 47)

INSERT [dbo].[Combo Detail] ([comboID], [proID]) VALUES (4, 5)
INSERT [dbo].[Combo Detail] ([comboID], [proID]) VALUES (4, 19)
INSERT [dbo].[Combo Detail] ([comboID], [proID]) VALUES (4, 28)
INSERT [dbo].[Combo Detail] ([comboID], [proID]) VALUES (4, 37)
GO
INSERT [dbo].[Feedback] ([proID], [RateStar], [Feedback], [gmail]) VALUES (2, 5, N'2 - RD Please Wake Up Tshirt - M - Black     : This tshirt is very Good
', N'hminhh134@gmail.com')
INSERT [dbo].[Feedback] ([proID], [RateStar], [Feedback], [gmail]) VALUES (4, 4, N'4 - Mr. Tshirt - S - Green     : I like this color
', N'hminhh134@gmail.com')
INSERT [dbo].[Feedback] ([proID], [RateStar], [Feedback], [gmail]) VALUES (3, 5, N'3 - Title Tshirt - M - Dark Gray : Cool', N'minhnhhe186549@fpt.edu.vn')
INSERT [dbo].[Feedback] ([proID], [RateStar], [Feedback], [gmail]) VALUES (76, 5, N'76 - ADT Quilted Bucker Hat - Free Size - Black     : Good good', N'hminhh134@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([orID], [orDate], [gmail], [totalMoney], [orStatusID], [addID]) VALUES (1, CAST(N'2025-01-28' AS Date), N'8502dinhvando@gmail.com', 780000, 5, 1)
INSERT [dbo].[Order] ([orID], [orDate], [gmail], [totalMoney], [orStatusID], [addID]) VALUES (2, CAST(N'2025-02-27' AS Date), N'8502dinhvando@gmail.com', 390000, 3, 1)
INSERT [dbo].[Order] ([orID], [orDate], [gmail], [totalMoney], [orStatusID], [addID]) VALUES (3, CAST(N'2025-02-28' AS Date), N'8502dinhvando@gmail.com', 210000, 3, 2)
INSERT [dbo].[Order] ([orID], [orDate], [gmail], [totalMoney], [orStatusID], [addID]) VALUES (4, CAST(N'2025-02-28' AS Date), N'8502dinhvando@gmail.com', 1203000, 4, 2)
INSERT [dbo].[Order] ([orID], [orDate], [gmail], [totalMoney], [orStatusID], [addID]) VALUES (5, CAST(N'2025-02-08' AS Date), N'8502dinhvando@gmail.com', 390000, 4, 2)
INSERT [dbo].[Order] ([orID], [orDate], [gmail], [totalMoney], [orStatusID], [addID]) VALUES (6, CAST(N'2025-02-08' AS Date), N'8502dinhvando@gmail.com', 780000, 4, 2)
INSERT [dbo].[Order] ([orID], [orDate], [gmail], [totalMoney], [orStatusID], [addID]) VALUES (1005, CAST(N'2025-02-01' AS Date), N'8502dinhvando@gmail.com', 780000, 5, 2)
INSERT [dbo].[Order] ([orID], [orDate], [gmail], [totalMoney], [orStatusID], [addID]) VALUES (1006, CAST(N'2025-02-11' AS Date), N'8502dinhvando@gmail.com', 990000, 1, 1)
INSERT [dbo].[Order] ([orID], [orDate], [gmail], [totalMoney], [orStatusID], [addID]) VALUES (1007, CAST(N'2025-02-25' AS Date), N'do08052002@gmail.com', 780000, 1, 3)
INSERT [dbo].[Order] ([orID], [orDate], [gmail], [totalMoney], [orStatusID], [addID]) VALUES (1008, CAST(N'2025-02-25' AS Date), N'sinhnthe163662@fpt.edu.vn', 1670000, 4, 4)
INSERT [dbo].[Order] ([orID], [orDate], [gmail], [totalMoney], [orStatusID], [addID]) VALUES (1009, CAST(N'2025-02-25' AS Date), N'sinhnthe163662@fpt.edu.vn', 530000, 1, 4)
INSERT [dbo].[Order] ([orID], [orDate], [gmail], [totalMoney], [orStatusID], [addID]) VALUES (1010, CAST(N'2025-02-25' AS Date), N'8502dinhvando@gmail.com', 740000, 1, 1)
SET IDENTITY_INSERT [dbo].[Order] ON
GO
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (1, 3, 2, 390000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (2, 7, 1, 390000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (3, 26, 1, 210000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (4, 7, 1, 390000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (4, 20, 1, 210000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (4, 34, 1, 190000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (4, 177, 1, 413000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (5, 7, 1, 390000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (6, 9, 1, 390000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (6, 10, 1, 390000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (1005, 3, 2, 390000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (1006, 7, 1, 390000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (1006, 12, 1, 390000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (1006, 27, 1, 210000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (1007, 7, 2, 390000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (1008, 13, 2, 410000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (1008, 103, 1, 850000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (1009, 57, 1, 530000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (1010, 80, 1, 390000)
INSERT [dbo].[Order Detail] ([orID], [stockID], [quantity], [price]) VALUES (1010, 113, 1, 350000)
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([postID], [tittle], [gmail], [toppic], [img], [detail], [date]) VALUES (1, N'APPROX 7600 ', N'minhnhhe186549@fpt.edu.vn', N'Sale', N'img/sale_post2.jpg ', N'7600m – ở một độ cao tưởng chừng như bất khả thi để duy trì sự sống, ta có một góc nhìn gần như toàn diện nhất về mọi thứ ở xung quanh ta. Và khi đã chinh phục được điều không thể ấy rồi, liệu chúng ta có ham muốn chinh phục những đỉnh cao mới không?

Bộ sản phẩm Kỷ niệm sinh nhât tròn 1 năm của Clothes Store, đánh dấu sự chuyển mình của Clothes Store trong những sản phẩm sắp tới.
', CAST(N'2025-01-1' AS Date))
INSERT [dbo].[Post] ([postID], [tittle], [gmail], [toppic], [img], [detail], [date]) VALUES (2, N'INVASION ', N'minhnhhe186549@fpt.edu.vn', N'News', N'img/news_post2.jpg ', N'An unwarranted intrusion from synthetic identity originated from globalization into already established traditional values.

–

INVASION – the conquest of the future era. Every single design in this collection is a vital part of the big picture – a visual sketch of the so called new world citizen’s costumes, which can be encapsulated in 2 words: utility & versaltility.

–

INVASION – sự xâm chiếm của kỷ nguyên tương lai. Các thiết kế trong collection tạo ra một bản phác hoạ trực quan về trang phục của những công dân thế giới mới theo phong cách: Untility & Versatility.
', CAST(N'2025-01-11' AS Date))
INSERT [dbo].[Post] ([postID], [tittle], [gmail], [toppic], [img], [detail], [date]) VALUES (3, N'NATIVE SPIRIT ', N'minhnhhe186549@fpt.edu.vn', N'Product  ', N'img/product_post3.jpg  ', N'“𝘈 𝘱𝘪𝘦𝘤𝘦 𝘰𝘧 𝘰𝘶𝘳 𝘤𝘰𝘶𝘯𝘵𝘳𝘺 𝘵𝘩𝘢𝘵 𝘸𝘦 𝘵𝘢𝘬𝘦 𝘸𝘪𝘵𝘩 𝘶𝘴.”

𝗡𝗔𝗧𝗜𝗩𝗘 𝗦𝗣𝗜𝗥𝗜𝗧.

𝘈 𝘴𝘱𝘦𝘤𝘪𝘢𝘭 𝘦𝘥𝘪𝘵𝘪𝘰𝘯 𝘵𝘰 𝘤𝘦𝘭𝘦𝘣𝘳𝘢𝘵𝘦 𝘵𝘩𝘦 𝘓𝘶𝘯𝘢𝘳 𝘕𝘦𝘸 𝘠𝘦𝘢𝘳 𝘚𝘚20 – 𝘊𝘢𝘯𝘩 𝘛𝘺.
The question of whether Vietnamese young generations can acknowlege the magnificent beauty of their own landscapes has been constantly popping up in our mind recently. Will you be able to name the place if a random short video appears in front of you ?

–

Một điều khiến chúng tôi trăn trở trong những năm tháng gần đây, người trẻ Việt Nam hiện nay liệu có biết rằng đất nước mình đẹp đến thế nào? Khi một thước phim xuất thần hiện ra trước mắt, bạn có thể trả lời được câu hỏi: “Đây là đâu?” không? 
', CAST(N'2025-01-11' AS Date))
INSERT [dbo].[Post] ([postID], [tittle], [gmail], [toppic], [img], [detail], [date]) VALUES (4, N'PRELUDE ', N'minhnhhe186549@fpt.edu.vn', N'Sale', N'img/sale_post1.jpg ', N'We’re never sure of what the future holds. Maybe a couple of years from now, the world will be nothing but ruined cities and abandoned areas. The reckless life has finally taken a toll on every single one of us.
PRELUDE – Câu chuyện được kể lại dưới một góc nhìn hoàn toàn cá nhân, lấy cảm hứng từ đợt giãn cách đặc biệt vừa qua. PRELUDE là một thế giới giả tưởng hậu tận thế, một thế giới còn sót lại một chút ít nền văn minh xưa cũ.
Bộ sản phẩm Kỷ niệm ngày đầu ra mắt sản phẩm, đánh dấu sự chuyển mình của Clothes Store trong những sản phẩm sắp tới. 
', CAST(N'2025-01-11' AS Date))
INSERT [dbo].[Post] ([postID], [tittle], [gmail], [toppic], [img], [detail], [date]) VALUES (5, N'RAIDER ', N'minhnhhe186549@fpt.edu.vn', N'Product ', N'img/product_post1.jpg ', N'RAIDER

/’reidə/

A person who attacks an enemy in the enemy’s territory.

–

Những chiến binh dẫn đầu trong mọi cuộc đụng độ. 
', CAST(N'2025-01-11' AS Date))
INSERT [dbo].[Post] ([postID], [tittle], [gmail], [toppic], [img], [detail], [date]) VALUES (6, N'THE HUMAN PSYCHE’S DOWNFALL  ', N'minhnhhe186549@fpt.edu.vn', N'News', N'img/news_post3.jpg ', N'We, human beings, are all born social creatures. As one of the consequences, we can feel what other people feel. That’s what we’re blessed with.
 
 
However, we often have to deal with problems coming from inside and outside of us. Some of us are blessed enough to have more “positive” feelings than others, while the rest find it hard to wake up every day trying to feel better.
', CAST(N'2025-01-11' AS Date))
INSERT [dbo].[Post] ([postID], [tittle], [gmail], [toppic], [img], [detail], [date]) VALUES (7, N'THE NEW AGE ', N'minhnhhe186549@fpt.edu.vn', N'Product ', N'img/product_post2.jpg ', N'THE NEW AGE – marked the new transformation of Clothes Store.
Everyone fight for something. Some fight for wealth, some fight for power. But we, we fight for changes, for the freedom of youth. And I can promise you, we will never stop.
–
Mỗi người đều chiến đấu vì điều mà họ tin tưởng.
Có những người lựa chọn mục tiêu chỉ đơn giản là tiền bạc hay địa vị xã hội.
Còn chúng tôi đấu tranh cho những sự thay đổi đột phá, bỏ đi những lối mòn cản trở tự do, giải phóng bản thân khỏi mọi loại xiềng xích, dù là hữu hình hay vô hình.
THEY OBEY.
WE Clothes Store.
', CAST(N'2025-01-11' AS Date))
INSERT [dbo].[Post] ([postID], [tittle], [gmail], [toppic], [img], [detail], [date]) VALUES (8, N'THE OBLIVIOUS LEAD ', N'minhnhhe186549@fpt.edu.vn', N'News ', N'img/news_post1.jpg ', N'Với cảm hứng từ Leather & Metal, thiết kế trong Collection mới nhất của [ Clothes Store ] được cải biên từ những bộ trang phục đặc trưng đan xen các yếu tố bí ẩn của dòng phim trinh thám cổ điển.

Sử dụng da Polyurethane cao cấp xuyên suốt Collection, cùng logo nổi sau lưng các sản phẩm chủ đạo, có thể nói Clothes Store chính là brand tiên phong áp dụng thành công kỹ thuật dập nổi với độ hoàn thiện cực cao trên loại chất liệu khó nhằn này.

Chốt/khóa kim loại (Metal Buckle) – có mặt trên hầu hết các sản phẩm – là chi tiết được Clothes Store đặc biệt đầu tư. Ngoài truyền tải nội dung Collection, Metal Buckle còn được Team thiết kế như một món phụ kiện cao cấp đích thực.
', CAST(N'2025-01-11' AS Date))
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (1, N'RD Flower Tshirt', N'RD FLOWER TSHIRT✦ Chất liệu: Cotton 260gsm✦ Fitting: Oversized.✦ Chi tiết:+ Sản phẩm thuộc Bộ sưu tập “REALITY & DREAM” - mang cảm hứng về những chiêm nghiệm trong cuộc sống, những cảm xúc khi sống giữa bao khoảnh khắc “mơ” và “thật” hằng ngày đang diễn ra+ Hình in được thiết kế độc quyền, in khổ lớn trên áo. Sản phẩm kết hợp giữa kỹ thuật in và thêu trên cùng một sản phẩm.+ Chi tiết bảng tên collection được đính sau gáy áo+ Phần bo cổ áo, tay áo, gấu áo được xử lý kĩ lưỡng.', 390000, 1, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (2, N'RD Please Wake Up Tshirt', N'RD PLEASE WAKEUP TSHIRT✦ Chất liệu: Cotton 260gsm✦ Fitting: Oversized.✦ Chi tiết:+ Sản phẩm thuộc Bộ sưu tập “REALITY & DREAM” - mang cảm hứng về những chiêm nghiệm trong cuộc sống, những cảm xúc khi sống giữa bao khoảnh khắc “mơ” và “thật” hằng ngày đang diễn ra+ Hình in được thiết kế độc quyền, in khổ lớn trên áo. Sản phẩm kết hợp giữa kỹ thuật in và thêu trên cùng một sản phẩm.+ Chi tiết thông tin collection được đính sau gáy áo+ Phần bo cổ áo, tay áo, gấu áo được xử lý kĩ lưỡng.', 390000, 1, 0)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (3, N'Title Tshirt', N'TITLE TSHIRT
✦ Chất liệu: Cotton 260gsm Washed
✦ Fitting: Oversized.
✦ Chi tiết:
+ Chất liệu dày dặn và đứng form. Vải được xử lí kĩ thuật Acid Washed đem lại sự cá tính cho thiết kế sản phẩm
+ Hình in được thiết kế độc quyền, in khổ lớn trên áo, sử dụng hiệu ứng in nứt trên Logo tạo sự Vintage.
+ Phần bo cổ áo được xử lý kĩ lưỡng.
', 410000, 1, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (4, N'Mr. Tshirt', N'MR/ MRS TSHIRT
✦ Chất liệu: Cotton 250gsm.
✦ Fitting: Oversized fit.
✦ Chi tiết:
+ Thiết kế với chủ đề "Happy Ending" - hướng đến một cái kết hạnh phúc
+ Hình in thiết kế độc quyền nổi bật ở phần thân áo
', 210000, 1, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (5, N'Palm Tshirt
', N'✦ Chất liệu: Cotton 2c.
✦ Fitting: Oversized fit.
✦ Chi tiết:
+ Áo được thiết kế để sử dụng được cả mặt trong và ngoài.
+ Hiệu ứng wash đem lại phong cách ấn tượng, trẻ trung.
+ Chi tiết bảng kim loại logo thương hiệu đính kèm ở đuôi áo.
', 210000, 1, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (6, N'BYB Pocket Tshirt
', N'✦Chất liệu: Cotton 2c.
✦ Fitting: Oversized fit.
✦ Chi tiết:
+ Sản phẩm mang thiết kế phối cổ tạo cảm giác năng động, trẻ trung.
+ Hình in logo thương hiệu được đặt tinh tế cùng túi ngực tạo thêm điểm nhấn cho chiếc tshirt bạn mang hằng ngày.
✦ Hướng dẫn bảo quản:
+ Sản phẩm bền nhất khi giặt tay. Nếu giặt máy, hãy giặt ở nhiệt độ thường.
+ Khi phơi tránh ánh nắng trực tiếp. Nên treo sản phẩm để sản phẩm có độ bền phom dáng.
', 190000, 1, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (7, N'Holiday Tshirt', N'HOLIDAY TSHIRT
✦ Chất liệu: Cotton 260gsm.
✦ Fitting: Oversized fit.
✦ Chi tiết: Phiên bản Update 2023 
+ Là sản phẩm best seller năm 2022 được cải tiến và hoàn thiện chất lượng hơn.
+ Kĩ thuật in chìm sắc nét 
+ Graphic được thiết kế độc quyền, mang phong cách retro được in khổ lớn, màu sắc khác biệt, vintage hơn so với phiên bản trước. 
+ Chi tiết cổ viền áo được cải thiện dày dặn hơn, tạo cảm giác thoải mái khi mặc 
+ Chi tiết bảng kim loại logo thương hiệu đính kèm ở đuôi áo.
', 410000, 1, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (8, N'Backyard Beach Tshirt
', N'✦ Chất liệu: Cotton 2c.
✦ Fitting: Oversized fit.
✦ Chi tiết:
+ Thiết kế sản phẩm nằm trong bộ sưu tập chủ đề "OUTDOOR" - là niềm cảm hứng về câu chuyện của mỗi chuyến đi, mỗi trải nghiệm. 
+ Chi tiết bảng kim loại logo thương hiệu đính kèm ở đuôi áo.
', 410000, 1, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (9, N'Goodvibe Tshirt
', N'✦ Chất liệu: Cotton 2c.
✦ Fitting: Oversized fit.
✦ Chi tiết:
+ Thiết kế sản phẩm nằm trong bộ sưu tập chủ đề "OUTDOOR" - là niềm cảm hứng về câu chuyện của mỗi chuyến đi, mỗi trải nghiệm. 
+ Chi tiết bảng kim loại logo thương hiệu đính kèm ở đuôi áo.
', 410000, 1, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (10, N'Blunt Tshirt', N'BLUNT TSHIRT
✦ Chất liệu: Washed Cotton 100% 250gsm 
✦ Fitting: Oversized
✦ Chi tiết:
+ Sản phẩm dành cho ngày 420. 
+ Ứng dụng công nghệ in lưới, được đóng gói đặc biệt và ấn chứa 1 điều bất ngờ ẩn trong áo
+ Chất liệu cotton 100%, định lượng 250gsm dày dặn và đứng form.
', 410000, 1, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (11, N'Ripped Flannel
', N'RIPPED FLANNEL
✦ Chất liệu: Flannel 380gsm
✦ Fitting: Oversized. 
✦ Chi tiết: 
+ Sản phẩm thuộc BST "ADVENTURISM"
+ Sản phẩm sử dụng chất liệu flannel 380gsm, dày dặn, chắc chắn tạo độ bền.
+ Chi tiết cúc được thiết kế và sản xuất độc quyền.
+ Thiết kế túi độc đáo tạo sự cá tính cho sản phẩm.


', 530000, 2, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (12, N'Buckle Shirt', N'BUCKLE SHIRT
✦ Chất liệu: Ripstop
✦ Fitting: Loose fit.
✦ Chi tiết:
+ Thiết kế thuộc dòng sản phẩm "CANDLES THE NEW EXPLORERS" với cảm hứng từ sự tự do khám phá, sáng tạo trong mỗi chuyến đi.
+ Chi tiết khóa Buckle tạo sự cá tính cho thiết kế
', 470000, 2, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (13, N'Essential Polo
', N'✦ Chất liệu: Cotton 2c.
✦ Fitting: Oversized fit.
✦ Chi tiết:
+ Thiết kế thuộc dòng sản phẩm "CANDLES ESSENTIAL"
+ Hình in nổi mang logo thương hiệu trước áo.
+ Chi tiết bảng kim loại logo thương hiệu đính kèm ở đuôi áo.
', 390000, 3, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (14, N'ATB Polo
', N'✦ Chất liệu: Cotton 2c.
✦ Fitting: Oversized fit.
✦ Chi tiết:
+ Thiết kế thuộc dòng sản phẩm "CANDLES ESSENTIAL"
+ Hình in nổi mang logo thương hiệu trước áo.
+ Chi tiết bảng kim loại logo thương hiệu đính kèm ở đuôi áo.
', 550000, 3, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (15, N'Coldzy Knit Sweater', N'COLDZY KNIT SWEATER
✦ Chất liệu: Len AC
✦ Fitting: Oversized fit.
✦ Chi tiết:
+ Thiết kế sản phẩm nằm trong bộ sưu tập chủ đề “COLDZY” với niềm cảm hứng về một bộ trang phục thoải mái, dễ chịu như khoảnh khắc giao mùa và mang tính thời trang cao.
+ Hình in được thiết kế độc quyền, in khổ lớn trên áo.
+ Chi tiết bảng logo được đính trên tay áo.
', 595000, 4, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (16, N'Lifetime Sweater', N'✦ Chất liệu: Nỉ chân cua 380 GSM
✦ Fitting: Boxy fit.
✦ Chi tiết:
+ Chất liệu dày dặn và đứng form. Vải được xử lí kĩ thuật Acid Washed đem lại sự cá tính cho thiết kế sản phẩm
+ Hình in được thiết kế độc quyền, in khổ lớn trên áo với hiệu ứng nứt tạo sự vintage.
+ Phần bo cổ áo, tay áo, gấu áo được xử lý kĩ lưỡng.
', 390000, 4, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (17, N'Title Sweater
', N'TITLE SWEATE
✦ Chất liệu: Cotton 380 GSM Washed
✦ Fitting: Boxy fit.
✦ Chi tiết:
+ Chất liệu dày dặn và đứng form. Vải được xử lí kĩ thuật Acid Washed đem lại sự cá tính cho thiết kế sản phẩm
+ Hình in được thiết kế độc quyền, in khổ lớn trên áo, sử dụng hiệu ứng in nứt trên Logo tạo sự Vintage.
+ Phần bo cổ áo, tay áo, gấu áo được xử lý kĩ lưỡng.
', 488000, 4, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (18, N'Entrance Sweater', N'ENTRANCE SWEATER 
✦ Chất liệu: Nỉ
✦ Fitting: Oversize.
✦ Chi tiết:
+ Sản phẩm thuộc Bộ sưu tập “REALITY & DREAM” - mang cảm hứng về những chiêm nghiệm trong cuộc sống, những cảm xúc khi sống giữa bao khoảnh khắc “mơ” và “thật” hằng ngày đang diễn ra.
+ Hình in khổ lớn mặt sau áo được thiết kế độc quyền
+ Hình in với hiệu ứng nứt tạo sự vintage cho áo
+ Phần bo cổ áo, gấu áo, tay áo được xử lý chắc chắn, dày dặn.
', 585000, 4, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (19, N'The Piece Sweater', N'THE PIECE SWEATER
✦ Chất liệu: Nỉ
✦ Fitting: Oversize.
✦ Chi tiết:
+ Sản phẩm thuộc Bộ sưu tập “REALITY & DREAM” - mang cảm hứng về những chiêm nghiệm trong cuộc sống, những cảm xúc khi sống giữa bao khoảnh khắc “mơ” và “thật” hằng ngày đang diễn ra.
+ Hình in khổ lớn mặt trước áo được thiết kế độc quyền
+ Sử dụng kỹ thuật trame tạo nên được những hình in sắc nét,mang đến một hình ảnh trung thực trên sản phẩm.
', 531000, 4, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (20, N'ADT Quilted Pants', N'ADT QUILTED PANTS
✦ Chất liệu: Polyester trần bông 3Oz
✦ Fitting: Oversized.
✦ Chi tiết:
+ Sản phẩm thuộc BST "ADVENTURISM"
+ Sản phẩm sử dụng chất liệu polyester, được trần bông 5Oz dày dặn, chắc chắn tạo độ bền và ấm cho sản phẩm.
+ Chi tiết logo thương hiệu bằng kim loại được thiết kế và sản xuất độc quyền.
', 455000, 8, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (21, N'TNE Cargo Pants', N'TNE Cargo Pants
✦ Chất liệu: Polyester trần bông 3Oz
✦ Fitting: Oversized.
✦ Chi tiết:
+ Sản phẩm thuộc BST "ADVENTURISM"
+ Sản phẩm sử dụng chất liệu polyester, được trần bông 5Oz dày dặn, chắc chắn tạo độ bền và ấm cho sản phẩm.
+ Chi tiết logo thương hiệu bằng kim loại được thiết kế và sản xuất độc quyền.
', 650000, 8, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (22, N'Destroyed Double Knee Jeans', N'DESTROYED DOUBLE KNEE JEANS
✦ Chất liệu: Denim 13oz
✦ Fitting: Low rise
✦ Chi tiết:
+ Form quần thụng, mặc cạp thấp
+ Phần ống quần được thiết kế như cạp quần, đem lại hình ảnh lạ mắt và trải nghiệm mặc thoải mái.
+ Chi tiết logo bằng kim loại lần đầu được sử dụng tạo điểm nhấn đặc biệt.
+ Mỗi bên có 4 cúc để tùy chỉnh ống quần
+ Phối màu “dirty jeans” cực TRENDY.
', 850000, 8, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (23, N'Coldzy Track Pants', N'COLDZY TRACK PANT
✦ Chất liệu: Nỉ Poly 380 GSM
✦ Fitting: Oversized.
✦ Chi tiết:
+ Thiết kế sản phẩm nằm trong bộ sưu tập chủ đề “COLDZY” với niềm cảm hứng về một bộ trang phục thoải mái, dễ chịu như khoảnh khắc giao mùa và mang tính thời trang cao
+ Đường line logo Candles được dệt tỉ mỉ tạo sự độc đáo cho sản phẩm.
+ Chi tiết 2 khóa điều chỉnh ống quần và dây quần được xử lý ẩn bên trong đem lại sự tinh tế, chỉn chu.
', 350000, 8, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (24, N'Vintage Straight Jeans', N'✦ Chất liệu: Denim.
✦ Fitting: Boxy fit.
✦ Chi tiết:
+ Thiết kế thuộc dòng sản phẩm "CANDLES ESSENTIAL"
+ Chi tiết mài rách được đặt trên phần túi.
', 630000, 8, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (25, N'TNE Cargo Short', N'TNE CARGO SHORT CAMOUFLAGE✦ Chất liệu: Ripstop✦ Fitting: Loose fit.✦ Chi tiết:+ Thiết kế thuộc dòng sản phẩm ', 550000, 7, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (26, N'Backyard Beach Short', N'✦ Chất liệu: Pattern Cotton.
✦ Fitting: Boxy fit.
✦ Chi tiết:
+ Thiết kế sản phẩm nằm trong bộ sưu tập chủ đề "BACKYARD BEACH" - mang câu chuyện về những buổi chiều "chill chill" cùng anh em tại "khu sân sau" - nơi đầy nắng, gió và âm nhạc.
+ Hình thêu mang logo thương hiệu trước quần.
', 450000, 7, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (27, N'Utility Short', N'Chất liệu: Nilon Ripstop.
✦ Fitting: Loose fit.
✦ Chi tiết:
+ Thiết kế thuộc dòng sản phẩm "CANDLES ESSENTIAL"
+ Túi hộp hai bên quần.
+ Chi tiết hình in logo thương hiệu trên túi quần.
', 249000, 7, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (28, N'Palm Short', N'PALM SHORT 
✦ Chất liệu: 100% Polyester Gió nhăn 
✦ Fitting: Regular Fit
✦ Chi tiết:
+ Thuộc bộ sưu tập "Around The Beach" mang vibe của những chuyến du lịch nơi biển khơi. 
+ Phối màu cá tính, chất liệu gió nhăn lạ mắt
+ Cạp quần được bo chun chắc chắn, có dây điều chỉnh độ rộng 
+ Tag logo thương hiệu được thêu chắc chắn 
', 390000, 7, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (29, N'Colorblock', N'COLORBLOCK SHORT 
✦ Chất liệu: 100% Polyester Gió nhăn 
✦ Fitting: Regular Fit
✦ Chi tiết:
+ Phối màu cá tính, chất liệu gió nhăn lạ mắt
+ Cạp quần được bo chun chắc chắn, có dây điều chỉnh độ rộng 
+ Tag logo thương hiệu được thêu chắc chắn
', 390000, 7, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (30, N'RD Varsity Jacket', N'✦Chất liệu: Dạ trần bông 50oz
✦ Fitting: Oversize.
✦ Chi tiết:
+ Sản phẩm thuộc Bộ sưu tập “REALITY & DREAM” - mang cảm hứng về những chiêm nghiệm trong cuộc sống, những cảm xúc khi sống giữa bao khoảnh khắc “mơ” và “thật” hằng ngày đang diễn ra.
+ Các chi tiết phần tay và lưng áo được thêu với độ chính xác cao.
+ Áo được trần bông theo thiết kế riêng tạo độ dày dặn và ấm áp cho sản phẩm.
', 1080000, 6, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (31, N'Coldzy Track Jacket', N'COLDZY TRACK JACKET
✦ Chất liệu: Nỉ Poly 380 GSM
✦ Fitting: Oversized.
✦ Chi tiết:
+ Thiết kế sản phẩm nằm trong bộ sưu tập chủ đề “COLDZY” với niềm cảm hứng về một bộ trang phục thoải mái, dễ chịu như khoảnh khắc giao mùa và mang tính thời trang cao.
+ Đường line logo Candles được dệt tỉ mỉ tạo sự độc đáo cho sản phẩm.
+ Chi tiết khóa kéo được xử lý chắc chắn.
', 385000, 6, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (32, N'Coldzy Detroit Jacket', N'✦ Chất liệu: Kaki.
✦ Fitting: Oversized fit.
✦ Chi tiết:
+ Áo 2 lớp lót bên trong.
+ Chi tiết bảng thương hiệu được thiêu ở tay áo.
+ Khuy áo độc quyền Candles Studio.
', 455000, 6, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (33, N'ADt Upper Bomber Jacket
', N'✦Chất liệu: Kaki.
✦ Fitting: Oversized fit.
✦ Chi tiết:
+ Áo 2 lớp lót bên trong.
+ Chi tiết bảng thương hiệu được thiêu ở tay áo.
+ Khuy áo độc quyền Candles Studio.
', 891000, 6, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (35, N'Flame Cap', N'Chất liệu: Nilon Ripstop
Chi tiết: Chất vải đặc biệt khiến mũ lên dáng đẹp. Hình thêu sắc nét, có đai để điều chỉnh độ dài.
Hướng dẫn bảo quản: Sản phẩm bền nhất khi giặt tay. Có thể giặt máy ở nhiệt độ thường. Khi phơi tránh ánh nắng trực tiếp. Nên treo sản phẩm để form đẹp hơn.
', 149000, 9, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (36, N'Camo Cap', N'Chất liệu: Kaki
Chi tiết: Chất vải kaki. Hình thêu sắc nét, có đai để điều chỉnh độ dài.
Hướng dẫn bảo quản: Sản phẩm bền nhất khi giặt tay. Có thể giặt máy ở nhiệt độ thường. Khi phơi tránh ánh nắng trực tiếp. Nên treo sản phẩm để form đẹp hơn.
', 99000, 9, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (37, N'Socks', N'✦Đối với sản phẩm bị lỗi các chi tiết trên áo khi chưa can thiệp sử dụng hay giặt tẩy, Candles sẽ tiến hành kiểm tra và và đổi mới sản phẩm.
✦ Đối với sản phẩm bị lỗi do quá trình vận chuyển, Candles sẽ khắc phục tuỳ tình trạng hoặc đổi mới.
', 80000, 9, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (38, N'RD Moment Hoodie', N' RD MOMENT HOODIE
✦ Chất liệu: Nỉ chân cua 440 GSM
✦ Fitting: Boxy fit.
✦ Chi tiết:
+ Sản phẩm thuộc Bộ sưu tập “REALITY & DREAM” - mang cảm hứng về những chiêm nghiệm trong cuộc sống, những cảm xúc khi sống giữa bao khoảnh khắc “mơ” và “thật” hằng ngày đang diễn ra
+ Chất liệu dày dặn và đứng form.
+ Tag collection thiết kế sáng tạo được máy sau gáy áo
+ Phần bo cổ áo, tay áo, gấu áo được xử lý kĩ lưỡng.
', 441000, 5, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (39, N'RD Flower Hoodie', N' RD WAKE UP HOODIE
✦ Chất liệu: Nỉ chân cua 440 GSM
✦ Fitting: Boxy fit.
✦ Chi tiết:
+ Sản phẩm thuộc Bộ sưu tập “REALITY & DREAM” - mang cảm hứng về những chiêm nghiệm trong cuộc sống, những cảm xúc khi sống giữa bao khoảnh khắc “mơ” và “thật” hằng ngày đang diễn ra
+ Hình in được thiết kế độc quyền, in khổ lớn trên áo. Sản phẩm kết hợp giữa kỹ thuật in và thêu trên cùng một sản phẩm.
+ Chi tiết bảng tên collection được đính sau gáy áo
+ Sử dụng hiệu ứng mài rách thủ công trên thân áo tạo điểm nhấn cho sản phẩm.
+ Phần bo cổ áo, tay áo, gấu áo được xử lý kĩ lưỡng.
', 441000, 5, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (40, N'Title Hoodie Washed', N' TITLE HOODIE
✦ Chất liệu: Cotton 380gsm Washed
✦ Fitting: Boxy fit.
✦ Chi tiết:
+ Chất liệu dày dặn và đứng form. Vải được xử lí kĩ thuật Acid Washed đem lại sự cá tính cho thiết kế sản phẩm
+ Hình in được thiết kế độc quyền, in khổ lớn trên áo, sử dụng hiệu ứng in nứt trên Logo tạo sự Vintage.
+ Phần bo cổ áo, tay áo, gấu áo được xử lý kĩ lưỡng.
', 520000, 5, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (41, N'Coldzy Hoodie', N'COLDZY HOODIE


✦ Chất liệu: Nỉ cua 380gsm


✦ Fitting: Oversized.


✦ Chi tiết:


+ Thiết kế sản phẩm nằm trong bộ sưu tập chủ đề “COLDZY” với niềm cảm hứng về một bộ trang phục thoải mái, dễ chịu như khoảnh khắc giao mùa và mang tính thời trang cao.


+ Hình in được thiết kế độc quyền, in khổ lớn trên áo với thiết kế được sắp xếp ngẫu nhiên nhưng vẫn tạo được sự độc đáo, cá tính.


+ Chi tiết tag Collection và logo được đính trên tay áo.


+ Cúc áo kim loại cố định mũ được thiết kế để tạo sự thoải mái, tiện lợi khi mặc.
', 413000, 5, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (42, N'Club Hoodie Black', N'CLUB HOODIE
✦ Chất liệu: Nỉ cua 440gsm 
✦ Fitting: Boxy fit
✦ Chi tiết:
+ Chất liệu dày dặn và đứng form
+ Sau khi in áo được nhuộm và xử lý giặt tạo hiệu ứng vintage cho hình in.
+ Phần bo tay áo, gấu áo được xử lý kĩ lưỡng.
', 413000, 5, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (43, N'RD Together Sweater', N' RD TOGETHER SWEATER
✦ Chất liệu: Nỉ chân cua 440 GSM
✦ Fitting: Boxy fit.
✦ Chi tiết:
+ Sản phẩm thuộc Bộ sưu tập “REALITY & DREAM” - mang cảm hứng về những chiêm nghiệm trong cuộc sống, những cảm xúc khi sống giữa bao khoảnh khắc “mơ” và “thật” hằng ngày đang diễn ra
+ Hình in được thiết kế độc quyền, in khổ lớn trên áo.
+ Sử dụng hiệu ứng mài rách thủ công trên thân áo tạo điểm nhấn cho sản phẩm.
+ Phần bo cổ áo, tay áo, gấu áo được xử lý kĩ lưỡng.
', 413000, 4, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (44, N'Love Tshirt', N'LOVE TSHIRT
✦ Chất liệu: Cotton 100% 280gsm 
✦ Fitting: Oversized
✦ Chi tiết:
+ Chất liệu cotton 100%, định lượng 260gsm dày dặn và đứng form.
+ Kết hợp kĩ thuật in thường và in phồng tạo hiếu ứng 3D cho graphic
+ Phần cổ áo sử dụng kĩ thuật viền cổ giúp cổ cứng cáp, khó bai dão', 400000, 1, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (45, N'Gamble Tshirt', N'GAMBLE TSHIRT
✦ Chất liệu: Cotton 100% 260gsm 
✦ Fitting: Oversized
✦ Chi tiết:
+ Chất liệu cotton 100%, định lượng 260gsm dày dặn và đứng form.
+ Graphic được thiết kế độc quyền
+ Hình in sử dụng kỹ thuật in trame tạo hình in sắc nét
+ Phần bo tay áo, gấu áo, cổ áo được xử lý kĩ lưỡng.
', 390000, 1, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (46, N'Shaded Tshirt', N'SHADE TSHIRT 
✦ Chất liệu: Cotton washed 230gsm 
✦ Fitting: Oversized
✦ Chi tiết:
+ HÌnh in nứt tạo hiệu ứng vintage
+ Áo thuộc dòng sản phẩm washed đặc trưng của thương hiệu
+ Phần bo tay áo, gấu áo, cổ áo được xử lý kĩ lưỡng.
', 410000, 1, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (47, N'Goodvibes Varsity Jacket ', N'Chất liệu: 100% Dạ, Trần bông 5 oz dày hơn năm trướcFitting: Cropped FitChi tiết: Cúc kim loại cao cấp nhập khẩu- Bo đặt dệt riêng- Hình thêu sử dụng kỹ thuật thêu bông xù', 499000, 6, 1)
INSERT [dbo].[Product] ([proID], [proName], [proDetail], [proPrice], [caID], [proStatus]) VALUES (76, N'ADT Quilted Bucker Hat', N'✦ Đối với sản phẩm bị lỗi các chi tiết trên áo khi chưa can thiệp sử dụng hay giặt tẩy, Candles sẽ tiến hành kiểm tra và và đổi mới sản phẩm.
✦ Đối với sản phẩm bị lỗi do quá trình vận chuyển, Candles sẽ khắc phục tuỳ tình trạng hoặc đổi mới.
✦ Hướng dẫn bảo quản:
+ Sản phẩm bền nhất khi giặt tay.
+ Nếu giặt máy, hãy giặt ở nhiệt độ thường.
+ Khi phơi tránh ánh nắng trực tiếp.
+ Nên treo sản phẩm để sản phẩm có độ bền phom dáng. ', 300000, 9, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (1, N'img/RDFlowerTshirt(1).jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (1, N'img/RDFlowerTshirt(2).jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (1, N'img/RDFlowerTshirt(3).jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (1, N'img/RDFlowerTshirt(4).jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (2, N'img/RDPleaseWakeUpTshirt(1).jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (2, N'img/RDPleaseWakeUpTshirt(2).jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (2, N'img/RDPleaseWakeUpTshirt(3).jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (2, N'img/RDPleaseWakeUpTshirt(4).jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (3, N'img/TitleTshirt.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (3, N'img/TitleTshirt_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (3, N'img/TitleTshirt_3.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (3, N'img/TitleTshirt_4.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (4, N'img/Mrs.Tshirt.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (4, N'img/Mrs.Tshirt_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (4, N'img/Mrs.Tshirt_3.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (4, N'img/Mrs.Tshirt_4.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (5, N'img/PalmTshirt.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (5, N'img/PalmTshirt_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (5, N'img/PalmTshirt_3.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (5, N'img/PalmTshirt_4.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (6, N'img/BYBPocketTshirt.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (6, N'img/BYBPocketTshirt_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (7, N'img/HolidayTshirt.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (7, N'img/HolidayTshirt_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (8, N'img/BackyardBeachTshirt.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (8, N'img/BackyardBeachTshirt_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (9, N'img/GoodvibeTshirt.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (9, N'img/GoodvibeTshirt_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (10, N'img/BLUNTTSHIRT.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (10, N'img/BLUNTTSHIRT_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (11, N'img/RippedFlannel.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (11, N'img/RippedFlannel_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (11, N'img/RippedFlannel_3.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (11, N'img/RippedFlannel_4.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (12, N'img/BuckleShirt.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (12, N'img/BuckleShirt_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (12, N'img/BuckleShirt_3.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (12, N'img/BuckleShirt_4.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (13, N'img/EssentialPolo.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (13, N'img/EssentialPolo_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (14, N'img/ATB Polo.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (14, N'img/ATB Polo_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (15, N'img/ColdzyKnitSweater.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (15, N'img/ColdzyKnitSweater_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (15, N'img/ColdzyKnitSweater_3.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (15, N'img/ColdzyKnitSweater_4.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (16, N'img/LifetimeSweater.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (16, N'img/LifetimeSweater_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (17, N'img/TitleSweater.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (17, N'img/TitleSweater_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (17, N'img/TitleSweater_3.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (17, N'img/TitleSweater_4.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (18, N'img/EntranceSweater.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (18, N'img/EntranceSweater_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (19, N'img/ThePieceSweater.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (19, N'img/ThePieceSweater_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (20, N'img/ADTQuiltedPants.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (20, N'img/ADTQuiltedPants_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (20, N'img/ADTQuiltedPants_3.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (20, N'img/ADTQuiltedPants_4.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (21, N'img/TNECargoPants.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (21, N'img/TNECargoPants_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (22, N'img/DestroyedDoubleKneeJeans.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (22, N'img/DestroyedDoubleKneeJeans_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (22, N'img/DestroyedDoubleKneeJeans_3.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (22, N'img/DestroyedDoubleKneeJeans_4.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (23, N'img/ColdzyTrackPant.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (23, N'img/ColdzyTrackPant_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (23, N'img/ColdzyTrackPant_3.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (23, N'img/ColdzyTrackPant_4.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (24, N'img/VintageStraightJeans.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (24, N'img/VintageStraightJeans_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (24, N'img/VintageStraightJeans_3.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (24, N'img/VintageStraightJeans_4.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (25, N'img/TNECargoShort.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (25, N'img/TNECargoShort_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (25, N'img/TNECargoShort_3.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (25, N'img/TNECargoShort_4.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (26, N'img/BackyardBeachShort.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (26, N'img/BackyardBeachShort_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (27, N'img/UtilityShort.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (27, N'img/UtilityShort_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (28, N'img/PalmShort.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (28, N'img/PalmShort_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (28, N'img/PalmShort_3.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (28, N'img/PalmShort_4.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (29, N'img/ColorblockShort.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (29, N'img/ColorblockShort_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (30, N'img/RDVarsityJacket.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (30, N'img/RDVarsityJacket_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (31, N'img/ColdzyTrackJacket.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (31, N'img/ColdzyTrackJacket_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (32, N'img/ColdzyDetroitJacket.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (32, N'img/ColdzyDetroitJacket_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (33, N'img/ADtUpperBomberJacket.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (33, N'img/ADtUpperBomberJacket_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (76, N'img/ADTQuiltedBuckerHat_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (35, N'img/FlameCap.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (35, N'img/FlameCap_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (35, N'img/FlameCap_3.jpg')
GO
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (35, N'img/FlameCap_4.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (36, N'img/CamoCap.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (36, N'img/CamoCap_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (37, N'img/Socks.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (37, N'img/Socks_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (38, N'img/RDMomentHoodie.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (38, N'img/RDMomentHoodie_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (39, N'img/RDFlowerHoodie.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (39, N'img/RDFlowerHoodie_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (39, N'img/RDFlowerHoodie_3.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (39, N'img/RDFlowerHoodie_4.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (40, N'img/TitleHoodieWashed.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (40, N'img/TitleHoodieWashed_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (41, N'img/ColdzyHoodie.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (41, N'img/ColdzyHoodie_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (41, N'img/ColdzyHoodie_3.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (41, N'img/ColdzyHoodie_4.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (42, N'img/ClubHoodieBlack.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (42, N'img/ClubHoodieBlack_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (43, N'img/RDTogetherSweater.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (43, N'img/RDTogetherSweater_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (44, N'img/LoveTshirt.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (44, N'img/LoveTshirt_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (45, N'img/GambleTshirt.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (45, N'img/GambleTshirt_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (46, N'img/ShadedTshirt.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (46, N'img/ShadedTshirt_2.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (46, N'img/ShadedTshirt_3.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (46, N'img/ShadedTshirt_4.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (47, N'img/GoodvibesVarsityJacket.jpg')
INSERT [dbo].[Product Image] ([proID], [proImg]) VALUES (47, N'img/GoodvibesVarsityJacket_2.jpg')
GO
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (2, N'Maketing')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (3, N'Sale')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (4, N'Customer')
GO
INSERT [dbo].[Shop Information] ([Name], [Address], [Facebook], [Gmail], [Phone]) VALUES (N'Clothes Store', N'Hà Nội', N'https://www.facebook.com/duckling.25112022', N'ducnxhe186870@fpt.edu.vn', N'0974930860')
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([sizeID], [sizeName]) VALUES (1, N'S')
INSERT [dbo].[Size] ([sizeID], [sizeName]) VALUES (2, N'M')
INSERT [dbo].[Size] ([sizeID], [sizeName]) VALUES (3, N'L')
INSERT [dbo].[Size] ([sizeID], [sizeName]) VALUES (4, N'XL')
INSERT [dbo].[Size] ([sizeID], [sizeName]) VALUES (5, N'Free Size')
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
INSERT [dbo].[Status] ([orStatusID], [orStatusName]) VALUES (1, N'Pending')
INSERT [dbo].[Status] ([orStatusID], [orStatusName]) VALUES (2, N'Confirmed')
INSERT [dbo].[Status] ([orStatusID], [orStatusName]) VALUES (3, N'Shipping')
INSERT [dbo].[Status] ([orStatusID], [orStatusName]) VALUES (4, N'Complete')
INSERT [dbo].[Status] ([orStatusID], [orStatusName]) VALUES (5, N'Canceled')
GO
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (1, 1, 1, 1, 1, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (2, 1, 2, 1, 20, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (3, 1, 1, 2, 20, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (4, 1, 2, 2, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (5, 1, 1, 3, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (6, 1, 2, 3, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (7, 2, 1, 1, 38, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (8, 2, 2, 1, 0, 0)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (9, 2, 1, 2, 28, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (10, 2, 2, 2, 18, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (11, 2, 1, 3, 35, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (12, 2, 2, 3, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (13, 3, 6, 2, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (14, 3, 7, 3, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (16, 3, 6, 3, 43, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (17, 3, 7, 2, 44, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (18, 3, 6, 4, 38, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (19, 3, 7, 4, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (20, 4, 9, 1, 30, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (21, 4, 9, 2, 50, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (22, 4, 9, 3, 46, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (23, 4, 4, 1, 50, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (24, 4, 4, 2, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (25, 4, 4, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (26, 5, 9, 1, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (27, 5, 9, 2, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (28, 5, 9, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (29, 5, 9, 4, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (30, 5, 4, 1, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (31, 5, 4, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (32, 5, 4, 3, 39, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (33, 5, 4, 4, 60, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (34, 6, 5, 1, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (35, 6, 5, 2, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (36, 6, 5, 3, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (37, 6, 5, 4, 50, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (38, 7, 1, 2, 50, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (39, 7, 1, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (40, 7, 1, 4, 39, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (41, 8, 2, 2, 50, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (42, 8, 2, 3, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (43, 8, 2, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (44, 9, 1, 2, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (45, 9, 1, 3, 44, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (46, 9, 1, 4, 50, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (47, 10, 3, 2, 55, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (48, 10, 3, 3, 50, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (49, 10, 3, 4, 50, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (50, 11, 11, 1, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (51, 11, 11, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (52, 11, 11, 3, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (53, 11, 11, 4, 56, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (54, 11, 12, 1, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (55, 11, 12, 2, 43, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (57, 11, 12, 3, 35, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (58, 12, 6, 2, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (59, 12, 6, 3, 44, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (60, 12, 6, 4, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (61, 12, 1, 2, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (62, 12, 1, 3, 44, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (63, 12, 1, 4, 39, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (64, 13, 3, 1, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (65, 13, 3, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (66, 13, 3, 3, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (67, 13, 3, 4, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (68, 14, 6, 1, 36, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (69, 14, 6, 2, 50, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (70, 14, 6, 3, 50, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (71, 14, 6, 4, 50, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (72, 15, 5, 2, 40, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (73, 15, 5, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (74, 15, 5, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (75, 15, 10, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (76, 15, 10, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (77, 15, 10, 4, 46, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (78, 16, 1, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (79, 16, 1, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (80, 16, 1, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (81, 17, 6, 1, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (82, 17, 6, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (83, 17, 6, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (84, 17, 1, 1, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (85, 17, 1, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (86, 17, 1, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (87, 18, 1, 2, 0, 0)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (88, 18, 1, 3, 10, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (89, 18, 1, 4, 46, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (90, 19, 3, 2, 44, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (91, 19, 3, 3, 46, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (92, 19, 3, 4, 46, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (93, 20, 10, 2, 46, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (94, 20, 10, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (95, 20, 10, 4, 44, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (96, 20, 1, 2, 56, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (97, 20, 1, 3, 44, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (98, 20, 1, 4, 30, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (99, 21, 1, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (100, 21, 1, 3, 44, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (101, 21, 1, 4, 44, 1)
GO
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (102, 22, 5, 2, 44, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (103, 22, 5, 3, 44, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (104, 22, 5, 4, 44, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (105, 22, 4, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (106, 22, 4, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (107, 22, 4, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (108, 23, 1, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (109, 23, 1, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (110, 23, 1, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (111, 23, 9, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (112, 23, 9, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (113, 23, 9, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (114, 24, 4, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (115, 24, 4, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (116, 24, 4, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (117, 24, 1, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (118, 24, 1, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (119, 24, 1, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (120, 25, 14, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (121, 25, 14, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (122, 25, 14, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (123, 26, 3, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (124, 26, 3, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (125, 26, 3, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (126, 27, 3, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (127, 27, 3, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (128, 27, 3, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (129, 28, 1, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (130, 28, 1, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (131, 28, 1, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (132, 28, 8, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (133, 28, 8, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (134, 28, 8, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (135, 29, 1, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (136, 29, 1, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (137, 29, 1, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (138, 30, 8, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (139, 30, 8, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (140, 30, 8, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (141, 31, 1, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (142, 31, 1, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (143, 31, 1, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (144, 32, 8, 2, 34, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (145, 32, 8, 3, 34, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (146, 32, 8, 4, 34, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (147, 33, 10, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (148, 33, 10, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (149, 33, 10, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (152, 35, 1, 5, 31, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (153, 35, 3, 5, 31, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (154, 36, 14, 5, 34, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (155, 37, 1, 5, 70, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (156, 37, 2, 5, 76, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (157, 38, 1, 2, 54, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (158, 38, 1, 3, 54, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (159, 38, 1, 4, 54, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (160, 39, 1, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (161, 39, 1, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (162, 39, 1, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (163, 39, 3, 2, 54, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (164, 39, 3, 3, 34, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (166, 39, 3, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (167, 40, 5, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (168, 40, 5, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (169, 40, 5, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (170, 41, 1, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (171, 41, 1, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (172, 41, 1, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (173, 41, 3, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (174, 41, 3, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (176, 41, 3, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (177, 42, 1, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (178, 42, 1, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (179, 42, 1, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (180, 43, 1, 2, 43, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (181, 43, 1, 3, 43, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (182, 43, 1, 4, 43, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (183, 44, 3, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (184, 44, 3, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (185, 44, 3, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (186, 45, 2, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (187, 45, 2, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (188, 45, 2, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (189, 46, 4, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (190, 46, 4, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (191, 46, 4, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (192, 46, 5, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (193, 46, 5, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (194, 46, 5, 4, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (195, 47, 1, 1, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (196, 47, 1, 2, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (197, 47, 1, 3, 45, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (214, 1, 4, 2, 10, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (215, 1, 23, 1, 10, 1)
INSERT [dbo].[Stock] ([stockID], [proID], [proColorID], [proSizeID], [quantity], [stockStatus]) VALUES (216, 1, 24, 1, 10, 1)
SET IDENTITY_INSERT [dbo].[Stock] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Account] FOREIGN KEY([gmail])
REFERENCES [dbo].[Account] ([gmail])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Account]
GO
ALTER TABLE [dbo].[Combo Detail]  WITH CHECK ADD  CONSTRAINT [FK_Combo Detail_Combo] FOREIGN KEY([comboID])
REFERENCES [dbo].[Combo] ([comboID])
GO
ALTER TABLE [dbo].[Combo Detail] CHECK CONSTRAINT [FK_Combo Detail_Combo]
GO
ALTER TABLE [dbo].[Combo Detail]  WITH CHECK ADD  CONSTRAINT [FK_Combo Detail_Product] FOREIGN KEY([proID])
REFERENCES [dbo].[Product] ([proID])
GO
ALTER TABLE [dbo].[Combo Detail] CHECK CONSTRAINT [FK_Combo Detail_Product]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Account] FOREIGN KEY([gmail])
REFERENCES [dbo].[Account] ([gmail])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Account]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Product] FOREIGN KEY([proID])
REFERENCES [dbo].[Product] ([proID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([gmail])
REFERENCES [dbo].[Account] ([gmail])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Address] FOREIGN KEY([addID])
REFERENCES [dbo].[Address] ([addID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Address]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([orStatusID])
REFERENCES [dbo].[Status] ([orStatusID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[Order Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order Details_Order] FOREIGN KEY([orID])
REFERENCES [dbo].[Order] ([orID])
GO
ALTER TABLE [dbo].[Order Detail] CHECK CONSTRAINT [FK_Order Details_Order]
GO
ALTER TABLE [dbo].[Order Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order Details_Stock] FOREIGN KEY([stockID])
REFERENCES [dbo].[Stock] ([stockID])
GO
ALTER TABLE [dbo].[Order Detail] CHECK CONSTRAINT [FK_Order Details_Stock]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Account] FOREIGN KEY([gmail])
REFERENCES [dbo].[Account] ([gmail])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Categories] FOREIGN KEY([caID])
REFERENCES [dbo].[Categories] ([caID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Categories]
GO
ALTER TABLE [dbo].[Product Image]  WITH CHECK ADD  CONSTRAINT [FK_Product Img_Product] FOREIGN KEY([proID])
REFERENCES [dbo].[Product] ([proID])
GO
ALTER TABLE [dbo].[Product Image] CHECK CONSTRAINT [FK_Product Img_Product]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Color] FOREIGN KEY([proColorID])
REFERENCES [dbo].[Color] ([proColorID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Color]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Product] FOREIGN KEY([proID])
REFERENCES [dbo].[Product] ([proID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Product]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Size] FOREIGN KEY([proSizeID])
REFERENCES [dbo].[Size] ([sizeID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Size]
GO
