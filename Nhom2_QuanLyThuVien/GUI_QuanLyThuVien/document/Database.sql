USE [master]
GO
/****** Object:  Database [Xuong_QuanLyThuVien]    Script Date: 6/25/2025 2:36:05 PM ******/
CREATE DATABASE [Xuong_QuanLyThuVien]

GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Xuong_QuanLyThuVien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET ARITHABORT OFF 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET  MULTI_USER 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET QUERY_STORE = ON
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Xuong_QuanLyThuVien]
GO
/****** Object:  Table [dbo].[ChiTietMuonSach]    Script Date: 6/25/2025 2:36:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietMuonSach](
	[MaChiTiet] [varchar](10) NOT NULL,
	[MaMuonTra] [varchar](10) NOT NULL,
	[MaSach] [varchar](10) NOT NULL,
	[SoLuong] [int] NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/25/2025 2:36:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [varchar](10) NOT NULL,
	[TenKhachHang] [nvarchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[SoDienThoai] [varchar](15) NULL,
	[CCCD] [varchar](15) NULL,
	[TrangThai] [bit] NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MuonTraSach]    Script Date: 6/25/2025 2:36:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuonTraSach](
	[MaMuonTra] [varchar](10) NOT NULL,
	[MaKhachHang] [varchar](10) NOT NULL,
	[MaNhanVien] [varchar](10) NOT NULL,
	[NgayMuon] [date] NOT NULL,
	[NgayTra] [date] NOT NULL,
	[MaTrangThai] [varchar](10) NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMuonTra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/25/2025 2:36:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [varchar](10) NOT NULL,
	[Ten] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[MatKhau] [nvarchar](100) NOT NULL,
	[SoDienThoai] [varchar](15) NULL,
	[VaiTro] [bit] NOT NULL,
	[TrangThai] [bit] NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhiSach]    Script Date: 6/25/2025 2:36:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhiSach](
	[MaPhiSach] [varchar](10) NOT NULL,
	[MaSach] [varchar](10) NOT NULL,
	[PhiMuon] [decimal](10, 2) NOT NULL,
	[PhiPhat] [decimal](10, 2) NOT NULL,
	[TrangThai] [bit] NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhiSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 6/25/2025 2:36:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [varchar](10) NOT NULL,
	[TieuDe] [nvarchar](200) NOT NULL,
	[MaTheLoai] [varchar](10) NOT NULL,
	[MaTacGia] [varchar](10) NOT NULL,
	[NhaXuatBan] [nvarchar](100) NULL,
	[SoLuongTon] [int] NULL,
	[TrangThai] [bit] NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 6/25/2025 2:36:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[MaTacGia] [varchar](10) NOT NULL,
	[TenTacGia] [nvarchar](100) NOT NULL,
	[QuocTich] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTacGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoaiSach]    Script Date: 6/25/2025 2:36:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoaiSach](
	[MaTheLoai] [varchar](10) NOT NULL,
	[TenTheLoai] [nvarchar](50) NOT NULL,
	[TrangThai] [bit] NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TenTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThaiThanhToan]    Script Date: 6/25/2025 2:36:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThaiThanhToan](
	[MaTrangThai] [varchar](10) NOT NULL,
	[TenTrangThai] [nvarchar](50) NOT NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TenTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTietMuonSach] ADD  DEFAULT ((1)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[ChiTietMuonSach] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[KhachHang] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[KhachHang] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[MuonTraSach] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[NhanVien] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[NhanVien] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[PhiSach] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[PhiSach] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[Sach] ADD  DEFAULT ((0)) FOR [SoLuongTon]
GO
ALTER TABLE [dbo].[Sach] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[Sach] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[TacGia] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[TacGia] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[TheLoaiSach] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[TheLoaiSach] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[TrangThaiThanhToan] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[ChiTietMuonSach]  WITH CHECK ADD FOREIGN KEY([MaMuonTra])
REFERENCES [dbo].[MuonTraSach] ([MaMuonTra])
GO
ALTER TABLE [dbo].[ChiTietMuonSach]  WITH CHECK ADD FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[MuonTraSach]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[MuonTraSach]  WITH CHECK ADD FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[MuonTraSach]  WITH CHECK ADD FOREIGN KEY([MaTrangThai])
REFERENCES [dbo].[TrangThaiThanhToan] ([MaTrangThai])
GO
ALTER TABLE [dbo].[PhiSach]  WITH CHECK ADD FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD FOREIGN KEY([MaTacGia])
REFERENCES [dbo].[TacGia] ([MaTacGia])
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[TheLoaiSach] ([MaTheLoai])
GO
USE [master]
GO
ALTER DATABASE [Xuong_QuanLyThuVien] SET  READ_WRITE 
GO
USE [Xuong_QuanLyThuVien]
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [Email], [SoDienThoai], [CCCD], [TrangThai], [NgayTao]) VALUES (N'KH001', N'Nguyễn Văn An', N'an.nguyen@gmail.com', N'0912345678', N'123456789012', 1, CAST(N'2025-05-21T13:25:29.193' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [Email], [SoDienThoai], [CCCD], [TrangThai], [NgayTao]) VALUES (N'KH002', N'Trần Thị Mai2', N'CaoTrantrunghieu@gmail.com', N'0923456789', N'987654321098', 1, CAST(N'2025-05-21T13:25:29.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [Email], [SoDienThoai], [CCCD], [TrangThai], [NgayTao]) VALUES (N'KH003', N'Phạm Hùng Vương', N'vuong.pham@gmail.com', N'0935678901', N'567890123456', 1, CAST(N'2025-05-21T13:25:29.193' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [Email], [SoDienThoai], [CCCD], [TrangThai], [NgayTao]) VALUES (N'KH004', N'Lê Minh Khôi', N'khoi.le@gmail.com', N'0947890123', N'678901234567', 1, CAST(N'2025-05-21T13:25:29.193' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [Email], [SoDienThoai], [CCCD], [TrangThai], [NgayTao]) VALUES (N'KH005', N'Hoàng Lan Anh', N'lananh.hoang@gmail.com', N'0958901234', N'890123456789', 1, CAST(N'2025-05-21T13:25:29.193' AS DateTime))
GO
INSERT [dbo].[NhanVien] ([MaNhanVien], [Ten], [Email], [MatKhau], [SoDienThoai], [VaiTro], [TrangThai], [NgayTao]) VALUES (N'NV001', N'Nguyễn Văn Hòa', N'hoa.nguyen@thuviendhtp.vn', N'abc123', N'0912346789', 1, 1, CAST(N'2025-05-21T13:25:29.200' AS DateTime))
INSERT [dbo].[NhanVien] ([MaNhanVien], [Ten], [Email], [MatKhau], [SoDienThoai], [VaiTro], [TrangThai], [NgayTao]) VALUES (N'NV002', N'Trần Thị Bích', N'bich.tran@thuviendhtp.vn', N'abc123', N'0987654321', 0, 1, CAST(N'2025-05-21T13:25:29.200' AS DateTime))
INSERT [dbo].[NhanVien] ([MaNhanVien], [Ten], [Email], [MatKhau], [SoDienThoai], [VaiTro], [TrangThai], [NgayTao]) VALUES (N'NV003', N'Lê Quốc Huy', N'huy.le@thuviendhtp.vn', N'abc123', N'0934567890', 1, 1, CAST(N'2025-05-21T13:25:29.200' AS DateTime))
INSERT [dbo].[NhanVien] ([MaNhanVien], [Ten], [Email], [MatKhau], [SoDienThoai], [VaiTro], [TrangThai], [NgayTao]) VALUES (N'NV004', N'Phạm Minh Tùng', N'tung.pham@thuviendhtp.vn', N'abc123', N'0976543210', 0, 1, CAST(N'2025-05-21T13:25:29.200' AS DateTime))
INSERT [dbo].[NhanVien] ([MaNhanVien], [Ten], [Email], [MatKhau], [SoDienThoai], [VaiTro], [TrangThai], [NgayTao]) VALUES (N'NV005', N'Hoàng Ngọc Phương', N'phuong.hoang@thuviendhtp.vn', N'abc123', N'0967890123', 1, 1, CAST(N'2025-05-21T13:25:29.200' AS DateTime))
GO
INSERT [dbo].[TrangThaiThanhToan] ([MaTrangThai], [TenTrangThai], [NgayTao]) VALUES (N'TT001', N'Chưa thanh toán', CAST(N'2025-05-21T13:25:29.000' AS DateTime))
INSERT [dbo].[TrangThaiThanhToan] ([MaTrangThai], [TenTrangThai], [NgayTao]) VALUES (N'TT002', N'Đã thanh toán', CAST(N'2025-05-21T13:25:29.220' AS DateTime))
INSERT [dbo].[TrangThaiThanhToan] ([MaTrangThai], [TenTrangThai], [NgayTao]) VALUES (N'TT003', N'Đang xử lý', CAST(N'2025-05-21T13:25:29.220' AS DateTime))
INSERT [dbo].[TrangThaiThanhToan] ([MaTrangThai], [TenTrangThai], [NgayTao]) VALUES (N'TT004', N'Hoàn tiền', CAST(N'2025-05-21T13:25:29.220' AS DateTime))
INSERT [dbo].[TrangThaiThanhToan] ([MaTrangThai], [TenTrangThai], [NgayTao]) VALUES (N'TT005', N'Thanh toán trễ', CAST(N'2025-05-21T13:25:29.220' AS DateTime))
GO
INSERT [dbo].[MuonTraSach] ([MaMuonTra], [MaKhachHang], [MaNhanVien], [NgayMuon], [NgayTra], [MaTrangThai], [NgayTao]) VALUES (N'MT001', N'KH001', N'NV001', CAST(N'2025-05-01' AS Date), CAST(N'2025-05-11' AS Date), N'TT001', CAST(N'2025-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[MuonTraSach] ([MaMuonTra], [MaKhachHang], [MaNhanVien], [NgayMuon], [NgayTra], [MaTrangThai], [NgayTao]) VALUES (N'MT002', N'KH002', N'NV003', CAST(N'2025-05-02' AS Date), CAST(N'2025-05-11' AS Date), N'TT002', CAST(N'2025-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[MuonTraSach] ([MaMuonTra], [MaKhachHang], [MaNhanVien], [NgayMuon], [NgayTra], [MaTrangThai], [NgayTao]) VALUES (N'MT003', N'KH003', N'NV002', CAST(N'2025-05-03' AS Date), CAST(N'2025-05-10' AS Date), N'TT003', CAST(N'2025-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[MuonTraSach] ([MaMuonTra], [MaKhachHang], [MaNhanVien], [NgayMuon], [NgayTra], [MaTrangThai], [NgayTao]) VALUES (N'MT004', N'KH004', N'NV005', CAST(N'2025-05-04' AS Date), CAST(N'2025-05-12' AS Date), N'TT004', CAST(N'2025-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[MuonTraSach] ([MaMuonTra], [MaKhachHang], [MaNhanVien], [NgayMuon], [NgayTra], [MaTrangThai], [NgayTao]) VALUES (N'MT005', N'KH005', N'NV004', CAST(N'2025-05-05' AS Date), CAST(N'2025-05-13' AS Date), N'TT001', CAST(N'2025-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[MuonTraSach] ([MaMuonTra], [MaKhachHang], [MaNhanVien], [NgayMuon], [NgayTra], [MaTrangThai], [NgayTao]) VALUES (N'MT006', N'KH002', N'NV001', CAST(N'2025-06-09' AS Date), CAST(N'2025-06-09' AS Date), N'TT001', CAST(N'2025-06-09T14:42:58.393' AS DateTime))
GO
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [QuocTich], [TrangThai], [NgayTao]) VALUES (N'TG001', N'J.K. Rowling', N'Anh', 1, CAST(N'2025-05-21T13:25:29.207' AS DateTime))
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [QuocTich], [TrangThai], [NgayTao]) VALUES (N'TG002', N'Nguyễn Nhật Ánh', N'Việt Nam', 1, CAST(N'2025-05-21T13:25:29.207' AS DateTime))
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [QuocTich], [TrangThai], [NgayTao]) VALUES (N'TG003', N'Dan Brown', N'Mỹ', 1, CAST(N'2025-05-21T13:25:29.207' AS DateTime))
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [QuocTich], [TrangThai], [NgayTao]) VALUES (N'TG004', N'Haruki Murakami', N'Nhật Bản', 1, CAST(N'2025-05-21T13:25:29.207' AS DateTime))
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [QuocTich], [TrangThai], [NgayTao]) VALUES (N'TG005', N'Paulo Coelho', N'Brazil', 1, CAST(N'2025-05-21T13:25:29.207' AS DateTime))
GO
INSERT [dbo].[TheLoaiSach] ([MaTheLoai], [TenTheLoai], [TrangThai], [NgayTao]) VALUES (N'TL001', N'Văn học', 1, CAST(N'2025-05-21T13:25:29.207' AS DateTime))
INSERT [dbo].[TheLoaiSach] ([MaTheLoai], [TenTheLoai], [TrangThai], [NgayTao]) VALUES (N'TL002', N'Khoa học', 1, CAST(N'2025-05-21T13:25:29.207' AS DateTime))
INSERT [dbo].[TheLoaiSach] ([MaTheLoai], [TenTheLoai], [TrangThai], [NgayTao]) VALUES (N'TL003', N'Kinh tế', 1, CAST(N'2025-05-21T13:25:29.207' AS DateTime))
INSERT [dbo].[TheLoaiSach] ([MaTheLoai], [TenTheLoai], [TrangThai], [NgayTao]) VALUES (N'TL004', N'Self-help', 0, CAST(N'2025-05-28T14:37:56.723' AS DateTime))
INSERT [dbo].[TheLoaiSach] ([MaTheLoai], [TenTheLoai], [TrangThai], [NgayTao]) VALUES (N'TL005', N'Tiểu thuyết', 1, CAST(N'2025-05-21T13:25:29.207' AS DateTime))
GO
INSERT [dbo].[Sach] ([MaSach], [TieuDe], [MaTheLoai], [MaTacGia], [NhaXuatBan], [SoLuongTon], [TrangThai], [NgayTao]) VALUES (N'S001', N'Đắc Nhân Tâm', N'TL004', N'TG005', N'NXB Tr?', 15, 1, CAST(N'2025-05-21T13:25:29.217' AS DateTime))
INSERT [dbo].[Sach] ([MaSach], [TieuDe], [MaTheLoai], [MaTacGia], [NhaXuatBan], [SoLuongTon], [TrangThai], [NgayTao]) VALUES (N'S002', N'Nhà Giả Kim', N'TL004', N'TG005', N'NXB T?ng H?p', 20, 1, CAST(N'2025-05-21T13:25:29.217' AS DateTime))
INSERT [dbo].[Sach] ([MaSach], [TieuDe], [MaTheLoai], [MaTacGia], [NhaXuatBan], [SoLuongTon], [TrangThai], [NgayTao]) VALUES (N'S003', N'Totto-chan: Cô bé bên cửa sổ', N'TL001', N'TG004', N'NXB Kim Ð?ng', 10, 1, CAST(N'2025-05-21T13:25:29.217' AS DateTime))
INSERT [dbo].[Sach] ([MaSach], [TieuDe], [MaTheLoai], [MaTacGia], [NhaXuatBan], [SoLuongTon], [TrangThai], [NgayTao]) VALUES (N'S004', N'Muôn Kiếp Nhân Sinh', N'TL002', N'TG002', N'NXB Van H?c', 12, 1, CAST(N'2025-05-21T13:25:29.217' AS DateTime))
INSERT [dbo].[Sach] ([MaSach], [TieuDe], [MaTheLoai], [MaTacGia], [NhaXuatBan], [SoLuongTon], [TrangThai], [NgayTao]) VALUES (N'S005', N'Bí Mật Của Naoko', N'TL005', N'TG003', N'NXB Phuong Nam', 8, 1, CAST(N'2025-05-21T13:25:29.217' AS DateTime))
GO
INSERT [dbo].[ChiTietMuonSach] ([MaChiTiet], [MaMuonTra], [MaSach], [SoLuong], [NgayTao]) VALUES (N'CT001', N'MT001', N'S001', 1, CAST(N'2025-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietMuonSach] ([MaChiTiet], [MaMuonTra], [MaSach], [SoLuong], [NgayTao]) VALUES (N'CT002', N'MT002', N'S002', 1, CAST(N'2025-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietMuonSach] ([MaChiTiet], [MaMuonTra], [MaSach], [SoLuong], [NgayTao]) VALUES (N'CT003', N'MT002', N'S003', 1, CAST(N'2025-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietMuonSach] ([MaChiTiet], [MaMuonTra], [MaSach], [SoLuong], [NgayTao]) VALUES (N'CT004', N'MT004', N'S004', 1, CAST(N'2025-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietMuonSach] ([MaChiTiet], [MaMuonTra], [MaSach], [SoLuong], [NgayTao]) VALUES (N'CT005', N'MT005', N'S005', 1, CAST(N'2025-05-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[PhiSach] ([MaPhiSach], [MaSach], [PhiMuon], [PhiPhat], [TrangThai], [NgayTao]) VALUES (N'PS001', N'S001', CAST(5000.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), 1, CAST(N'2025-05-21T13:25:29.223' AS DateTime))
INSERT [dbo].[PhiSach] ([MaPhiSach], [MaSach], [PhiMuon], [PhiPhat], [TrangThai], [NgayTao]) VALUES (N'PS002', N'S002', CAST(6000.00 AS Decimal(10, 2)), CAST(25000.00 AS Decimal(10, 2)), 1, CAST(N'2025-05-21T13:25:29.223' AS DateTime))
INSERT [dbo].[PhiSach] ([MaPhiSach], [MaSach], [PhiMuon], [PhiPhat], [TrangThai], [NgayTao]) VALUES (N'PS003', N'S003', CAST(7000.00 AS Decimal(10, 2)), CAST(30000.00 AS Decimal(10, 2)), 1, CAST(N'2025-05-21T13:25:29.223' AS DateTime))
INSERT [dbo].[PhiSach] ([MaPhiSach], [MaSach], [PhiMuon], [PhiPhat], [TrangThai], [NgayTao]) VALUES (N'PS004', N'S004', CAST(8000.00 AS Decimal(10, 2)), CAST(35000.00 AS Decimal(10, 2)), 1, CAST(N'2025-05-21T13:25:29.223' AS DateTime))
INSERT [dbo].[PhiSach] ([MaPhiSach], [MaSach], [PhiMuon], [PhiPhat], [TrangThai], [NgayTao]) VALUES (N'PS005', N'S005', CAST(9000.00 AS Decimal(10, 2)), CAST(40000.00 AS Decimal(10, 2)), 1, CAST(N'2025-05-21T13:25:29.223' AS DateTime))
GO

-- Tạo Bảng nhap Sach
CREATE TABLE NhapSach (
    MaNhap VARCHAR(10) PRIMARY KEY,
    MaNhanVien VARCHAR(10) NOT NULL,
    NgayNhap DATETIME DEFAULT GETDATE(),
    GhiChu NVARCHAR(255) NULL
);

--Tạo Bảng Xuất

CREATE TABLE XuatSach (
    MaXuat VARCHAR(10) PRIMARY KEY,
    MaNhanVien VARCHAR(10) NOT NULL,
    NgayXuat DATETIME DEFAULT GETDATE(),
    LyDo NVARCHAR(255) NULL
);

-- Tạo Bảng Chi Tiết
CREATE TABLE ChiTietNhapSach (
    MaChiTietNhap VARCHAR(10) PRIMARY KEY,
    MaNhap VARCHAR(10) NOT NULL,
    MaSach VARCHAR(10) NOT NULL,
    SoLuong INT NOT NULL,
    DonGia DECIMAL(10,2) NULL,
    FOREIGN KEY (MaNhap) REFERENCES NhapSach(MaNhap),
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
);


--Chi Tiết xuất 
CREATE TABLE ChiTietXuatSach (
    MaChiTietXuat VARCHAR(10) PRIMARY KEY,
    MaXuat VARCHAR(10) NOT NULL,
    MaSach VARCHAR(10) NOT NULL,
    SoLuong INT NOT NULL,
    FOREIGN KEY (MaXuat) REFERENCES XuatSach(MaXuat),
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
);

--Dữ Liệu Nhập Sách

-- Nhập sách mới do nhân viên NV001
INSERT INTO NhapSach (MaNhap, MaNhanVien, NgayNhap, GhiChu)
VALUES ('N001', 'NV001', GETDATE(), N'Nhập mới sách tháng 6');

-- Nhập sách bổ sung do nhân viên NV002
INSERT INTO NhapSach (MaNhap, MaNhanVien, GhiChu)
VALUES ('N002', 'NV002', N'Bổ sung kho sách do thiếu tồn');

--Dữ Liệu Chi Tiết Nhập Sách

-- Nhập sách cho phiếu N001
INSERT INTO ChiTietNhapSach (MaChiTietNhap, MaNhap, MaSach, SoLuong, DonGia)
VALUES 
('CTN001', 'N001', 'S001', 10, 45000),
('CTN002', 'N001', 'S002', 5, 60000),
('CTN003', 'N001', 'S003', 8, 70000);

-- Nhập sách cho phiếu N002
INSERT INTO ChiTietNhapSach (MaChiTietNhap, MaNhap, MaSach, SoLuong, DonGia)
VALUES 
('CTN004', 'N002', 'S004', 12, 80000),
('CTN005', 'N002', 'S001', 4, 45000);


-- Dữ Liệu Xuất Sách

-- Nhân viên NV001 xuất sách do sách hư hỏng
INSERT INTO XuatSach (MaXuat, MaNhanVien, NgayXuat, LyDo)
VALUES ('X001', 'NV001', GETDATE(), N'Hỏng - cần thanh lý');

-- Nhân viên NV002 xuất sách do mất mát
INSERT INTO XuatSach (MaXuat, MaNhanVien, NgayXuat, LyDo)
VALUES ('X002', 'NV002', GETDATE(), N'Mất sách do độc giả');

-- Nhân viên NV003 xuất sách do lỗi in
INSERT INTO XuatSach (MaXuat, MaNhanVien, NgayXuat, LyDo)
VALUES ('X003', 'NV003', GETDATE(), N'Sách in lỗi cần huỷ');

-- Nhân viên NV001 xuất sách theo đợt thanh lý cũ
INSERT INTO XuatSach (MaXuat, MaNhanVien, LyDo)
VALUES ('X004', 'NV001', N'Thanh lý sách cũ');


--Dữ Liệu Chi Tiết Xuất

-- Phiếu xuất X001: Thanh lý sách cũ
INSERT INTO ChiTietXuatSach (MaChiTietXuat, MaXuat, MaSach, SoLuong)
VALUES 
('CTX001', 'X001', 'S001', 3),  -- Xuất 3 quyển Đắc Nhân Tâm
('CTX002', 'X001', 'S002', 2);  -- Xuất 2 quyển Nhà Giả Kim

-- Phiếu xuất X002: Mất sách do độc giả
INSERT INTO ChiTietXuatSach (MaChiTietXuat, MaXuat, MaSach, SoLuong)
VALUES 
('CTX003', 'X002', 'S003', 1);  -- Xuất 1 quyển Totto-chan

-- Phiếu xuất X003: In lỗi, thu hồi sách
INSERT INTO ChiTietXuatSach (MaChiTietXuat, MaXuat, MaSach, SoLuong)
VALUES 
('CTX004', 'X003', 'S004', 2),
('CTX005', 'X003', 'S005', 1);

-- Phiếu xuất X004: Thanh lý sách cũ tiếp theo
INSERT INTO ChiTietXuatSach (MaChiTietXuat, MaXuat, MaSach, SoLuong)
VALUES 
('CTX006', 'X004', 'S001', 2),
('CTX007', 'X004', 'S005', 2);


GO
CREATE TRIGGER trg_AfterInsert_XuatSach
ON ChiTietXuatSach
AFTER INSERT
AS
BEGIN
    UPDATE Sach
    SET SoLuongTon = SoLuongTon - i.SoLuong
    FROM Sach s
    JOIN inserted i ON s.MaSach = i.MaSach
END
GO

CREATE TRIGGER trg_AfterInsert_NhapSach
ON ChiTietNhapSach
AFTER INSERT
AS
BEGIN
    UPDATE Sach
    SET SoLuongTon = SoLuongTon + i.SoLuong
    FROM Sach s
    JOIN inserted i ON s.MaSach = i.MaSach
END
GO

