CREATE DATABASE QLSINHVIEN
--ON PRIMARY
--(
--    NAME = QLSINHVIEN_Data,
--    FILENAME = 'D:\00.DATABASE\QLSINHVIEN.mdf',
--    SIZE = 10MB,
--    MAXSIZE = UNLIMITED, 
--    FILEGROWTH = 10%
--)
--LOG ON
--(
--    NAME = QLSINHVIEN_Log,
--    FILENAME = 'D:\00.DATABASE\QLSINHVIEN_Log.ldf',
--    SIZE = 5MB,
--    MAXSIZE = 20MB,
--    FILEGROWTH = 1MB
--);
GO
USE QLSINHVIEN
GO
/****** Object:  Table [dbo].[Ketqua]    Script Date: 12/3/2020 12:51:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ketqua](
	[MaSV] [nvarchar](3) NOT NULL,
	[MaMH] [nvarchar](2) NOT NULL,
	[Diem] [real] NULL,
 CONSTRAINT [Prk_MaSV_MAMH] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 12/3/2020 12:51:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKH] [nvarchar](2) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
 CONSTRAINT [Prk_KHOA_khoa] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 12/3/2020 12:51:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMH] [nvarchar](2) NOT NULL,
	[TenMH] [nvarchar](50) NOT NULL,
	[Sotiet] [tinyint] NULL,
 CONSTRAINT [Prk_MONHOC_MaMH] PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 12/3/2020 12:51:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSV] [nvarchar](3) NOT NULL,
	[HoSV] [nvarchar](15) NOT NULL,
	[TenSV] [nvarchar](7) NOT NULL,
	[Phai] [bit] NOT NULL,
	[NgaySinh] [smalldatetime] NOT NULL,
	[NoiSinh] [nvarchar](100) NOT NULL,
	[MaKH] [nvarchar](2) NOT NULL,
	[HocBong] [float] NULL,
	[DiemTrungBinh] [float] NULL,
 CONSTRAINT [Prk_SINHVIEN_MaSV] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A01', N'01', 3)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A01', N'02', 6)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A01', N'03', 5)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A01', N'04', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A01', N'05', 3.9)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A02', N'01', 4.5)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A02', N'03', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A02', N'05', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A02', N'06', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A02', N'08', 6)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A03', N'01', 2)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A03', N'03', 2.5)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A03', N'04', 9)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A04', N'02', 9)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A04', N'03', 10)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A04', N'04', 6)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A04', N'06', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A04', N'08', 9)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B01', N'01', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B01', N'03', 2.5)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B01', N'04', 4)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B02', N'02', 6)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B02', N'03', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B02', N'04', 10)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B02', N'06', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B02', N'08', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B04', N'01', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B04', N'03', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B04', N'04', 9)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'C01', N'01', 3)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'C01', N'03', 2)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'C01', N'04', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'C01', N'05', 5)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'C01', N'06', 6)
INSERT [dbo].[Khoa] ([MaKH], [TenKH]) VALUES (N'AV', N'Anh Văn')
INSERT [dbo].[Khoa] ([MaKH], [TenKH]) VALUES (N'DT', N'Điện tử')
INSERT [dbo].[Khoa] ([MaKH], [TenKH]) VALUES (N'KT', N'Kế toán')
INSERT [dbo].[Khoa] ([MaKH], [TenKH]) VALUES (N'TH', N'Tin học')
INSERT [dbo].[Khoa] ([MaKH], [TenKH]) VALUES (N'TR', N'Triết')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [Sotiet]) VALUES (N'01', N'Cơ sở dữ liệu', 45)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [Sotiet]) VALUES (N'02', N'Trí tuệ nhân tạo', 45)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [Sotiet]) VALUES (N'03', N'Toán rời rạc ứng dụng', 45)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [Sotiet]) VALUES (N'04', N'Đồ họa ứng dụng', 60)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [Sotiet]) VALUES (N'05', N'Tiếng Anh cơ bản', 60)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [Sotiet]) VALUES (N'06', N'Tin học văn phòng', 60)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [Sotiet]) VALUES (N'07', N'Pháp luật đại cương', 30)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [Sotiet]) VALUES (N'08', N'Anh chuyên Ngành', 45)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [Sotiet]) VALUES (N'09', N'PTTK Hệ thống', 60)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong], [DiemTrungBinh]) VALUES (N'A01', N'Nguyễn Thị', N'Vân', 0, CAST(N'1986-02-23T00:00:00' AS SmallDateTime), N'Hà Giang', N'KT', 130000, 5.1800000190734865)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong], [DiemTrungBinh]) VALUES (N'A02', N'Trần Văn', N'Chính', 0, CAST(N'1994-12-20T00:00:00' AS SmallDateTime), N'Bình Định', N'TH', 150000, NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong], [DiemTrungBinh]) VALUES (N'A03', N'Lê Thu Bạch', N'Yến', 1, CAST(N'1993-02-21T00:00:00' AS SmallDateTime), N'Tp. HCM', N'TH', 0, NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong], [DiemTrungBinh]) VALUES (N'A04', N'Trần Anh', N'Tuấn', 0, CAST(N'1987-12-20T00:00:00' AS SmallDateTime), N'Hà Nội', N'AV', 80000, NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong], [DiemTrungBinh]) VALUES (N'A10', N'Trần Thị', N'Mai', 1, CAST(N'1994-10-04T00:00:00' AS SmallDateTime), N'Hà Nội', N'TH', 0, NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong], [DiemTrungBinh]) VALUES (N'A11', N'Nguyễn Thành', N'Nam', 0, CAST(N'2000-01-01T00:00:00' AS SmallDateTime), N'Cà Mau', N'AV', NULL, NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong], [DiemTrungBinh]) VALUES (N'A12', N'Nguyễn Quang', N'Quyền', 0, CAST(N'2001-01-01T00:00:00' AS SmallDateTime), N'Đồng Nai', N'DT', NULL, NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong], [DiemTrungBinh]) VALUES (N'B01', N'Hoàng Thanh', N'Mai', 1, CAST(N'1992-08-12T00:00:00' AS SmallDateTime), N'Hải Phòng', N'TR', 0, NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong], [DiemTrungBinh]) VALUES (N'B02', N'Trần Thị Thu', N'Thủy', 1, CAST(N'1990-01-02T00:00:00' AS SmallDateTime), N'Tp. HCM', N'AV', 80000, NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong], [DiemTrungBinh]) VALUES (N'B03', N'Đố Văn', N'Lâm', 0, CAST(N'1994-02-26T00:00:00' AS SmallDateTime), N'Bình Định', N'TR', 0, NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong], [DiemTrungBinh]) VALUES (N'B04', N'Bùi Kim', N'Dung', 0, CAST(N'1988-10-18T00:00:00' AS SmallDateTime), N'Hµ Néi', N'TH', 170000, NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong], [DiemTrungBinh]) VALUES (N'C01', N'Hà Quang', N'Anh', 0, CAST(N'1985-03-11T00:00:00' AS SmallDateTime), N'Tp. HCM', N'TR', 0, NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong], [DiemTrungBinh]) VALUES (N'C03', N'Lê Quang', N'Lưu', 0, CAST(N'1985-02-23T00:00:00' AS SmallDateTime), N'Hà Nội', N'TH', 0, NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong], [DiemTrungBinh]) VALUES (N'T03', N'Hoàng Thị Hải', N'Yến', 1, CAST(N'1989-09-10T00:00:00' AS SmallDateTime), N'Hà Nội', N'AV', 170000, NULL)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong], [DiemTrungBinh]) VALUES (N'T06', N'Nguyễn Văn', N'Thắng', 0, CAST(N'1988-10-18T00:00:00' AS SmallDateTime), N'Hà Nội', N'AV', 1500000, NULL)
ALTER TABLE [dbo].[SinhVien] ADD  CONSTRAINT [Def_SINHVIEN_HocBong]  DEFAULT ((0)) FOR [HocBong]
GO
ALTER TABLE [dbo].[Ketqua]  WITH CHECK ADD  CONSTRAINT [Frk_KetQua_Makh] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SinhVien] ([MaSV])
GO
ALTER TABLE [dbo].[Ketqua] CHECK CONSTRAINT [Frk_KetQua_Makh]
GO
ALTER TABLE [dbo].[Ketqua]  WITH CHECK ADD  CONSTRAINT [Frk_KetQua_Mamh] FOREIGN KEY([MaMH])
REFERENCES [dbo].[MonHoc] ([MaMH])
GO
ALTER TABLE [dbo].[Ketqua] CHECK CONSTRAINT [Frk_KetQua_Mamh]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [Frk_SINHVIEN_Makh] FOREIGN KEY([MaKH])
REFERENCES [dbo].[Khoa] ([MaKH])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [Frk_SINHVIEN_Makh]
GO


--Bài 1
--1.
SELECT MaMH, TenMH, Sotiet from MonHoc
GO

--2.
SELECT MaSV, CONCAT(HoSV,' ', TenSV) AS HoTen, HocBong FROM SinhVien
ORDER BY MaSV
GO

--3.
SELECT MaSV, TenSV, IIF(Phai=0, N'Nam', N'Nữ') AS Phai, NgaySinh
FROM SinhVien
ORDER BY TenSV
GO

--4.
SELECT CONCAT(HoSV,' ', TenSV) AS HoTen, NgaySinh, HocBong
FROM SinhVien
ORDER BY NgaySinh ASC, HocBong DESC
GO

--5.
SELECT MaMH, TenMH, Sotiet FROM MonHoc
WHERE TenMH LIKE N'T%'
GO

--6.
SELECT CONCAT(HoSV,' ', TenSV) AS HoTen, NgaySinh,
IIF(Phai=0, N'Nữ', N'Nam') AS Phai
FROM SinhVien
WHERE TenSV LIKE N'%i'
GO

--7.
SELECT MaKH, TenKH FROM Khoa
WHERE TenKH LIKE N'_N%'
GO

--8.
SELECT * FROM SinhVien
WHERE HoSV LIKE N'%Thị%'
GO

--9.
SELECT MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTen,
IIF(Phai=0, N'Nam', N'Nữ') AS Phai, HocBong
FROM SinhVien
WHERE TenSV LIKE N'[a-m]%'
GO

--10.
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, NgaySinh, NoiSinh, HocBong
FROM SinhVien
WHERE TenSV LIKE N'[a-m]%'
GO

--11.
SELECT MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTen, NgaySinh, MaKH
FROM SinhVien
WHERE MaKH = 'AV'
GO

--12.
SELECT MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTen, NgaySinh 
FROM SinhVien
ORDER BY NgaySinh DESC
GO

--13.
SELECT MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTen, MaKH, HocBong
FROM SinhVien
WHERE HocBong > 500000
ORDER BY MaKH DESC
GO

--14.
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, MaKH, HocBong 
FROM SinhVien
WHERE NgaySinh = '1987-12-20'
GO

--15.
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, NgaySinh, NoiSinh, HocBong
FROM SinhVien
WHERE NgaySinh > '1987-12-20'
ORDER BY NgaySinh DESC
GO

--16.
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, MaKH, NoiSinh, HocBong
FROM SinhVien
WHERE HocBong > 100000
GO

--17.
SELECT MaSV, MaKH, IIF(Phai=0, N'Nam', N'Nữ') AS Phai
FROM SinhVien
WHERE MaKH = 'AV' OR MaKH = 'TR'
GO

--18.
SELECT MaSV, NgaySinh, NoiSinh, HocBong
FROM SinhVien
WHERE NgaySinh BETWEEN '1986-01-01' AND '1992-06-05'
GO

--19.
SELECT MaSV, NgaySinh, IIF(Phai=0, N'Nam', N'Nữ') AS Phai, MaKH
FROM SinhVien
WHERE HocBong BETWEEN 200000 AND 800000
GO

--20
SELECT MaMH, TenMH, Sotiet FROM MonHoc
WHERE Sotiet>40 AND Sotiet<60
GO

--21
SELECT MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTen, IIF(Phai=0, N'Nam', N'Nữ') AS Phai 
FROM SinhVien
WHERE Phai=0 AND MaKH = 'AV'
GO

--22.
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, NoiSinh, NgaySinh
FROM SinhVien
WHERE NoiSinh=N'Hà Nội' AND NgaySinh>'1990-01-01'
GO

--23.
SELECT * FROM SinhVien 
WHERE Phai=1 AND TenSV LIKE '%N%'
GO

--24.
SELECT * FROM SinhVien
WHERE MaKH='TH' AND NgaySinh>'1986-5-30' AND Phai=0
GO

--25.
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, 
IIF(Phai=0, N'Nam', N'Nữ') AS Phai, NgaySinh
FROM SinhVien
GO

--26.
SELECT MaSV, YEAR(GETDATE()) - YEAR(NgaySinh) AS Tuoi, NoiSinh, MaKH
FROM SinhVien
GO

--27.
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen,
YEAR(GETDATE()) - YEAR(NgaySinh) AS Tuoi, HocBong
FROM SinhVien
WHERE YEAR(GETDATE()) - YEAR(NgaySinh) > 20
GO

--28.
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen,
YEAR(GETDATE()) - YEAR(NgaySinh) AS Tuoi, TenKH
FROM SinhVien SV
INNER JOIN Khoa K ON SV.MaKH = K.MaKH
WHERE YEAR(GETDATE()) - YEAR(SV.NgaySinh) BETWEEN 20 AND 30
GO

--Bài 2
--1.
SELECT HoSV + N' ' + TenSV AS N'Họ và tên',
	CASE WHEN Phai=0 THEN N'Nam' ELSE N'Nữ' END AS N'Giới tính',
	DATEDIFF(YEAR, NgaySinh, GETDATE()) AS N'Tuổi', MaKH
FROM SinhVien
ORDER BY DATEDIFF(YEAR, NgaySinh, GETDATE()) DESC

--2.
SELECT HoSV + N' ' + TenSV AS N'Họ và tên', 
CASE WHEN Phai=0 THEN N'Nam' ELSE N'Nữ' END AS N'Giới tính',
DAY(NgaySinh) AS N'Ngày sinh'
FROM SinhVien
WHERE MONTH(NgaySinh)=2
GO

--3.
SELECT * FROM SinhVien
ORDER BY NgaySinh DESC
GO

--4.
SELECT MaSV,
IIF(Phai=0, N'Nam', N'Nữ') AS Phai, MaKH,
IIF(HocBong>500000, N'Học bổng cao', N'Mức trung bình')
FROM SinhVien
GO

--5.
SELECT CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen, KQ.MaMH, KQ.Diem
FROM Ketqua KQ
JOIN SinhVien SV ON KQ.MaSV = SV.MaSV
ORDER BY SV.TenSV ASC, MaMH ASC
GO

--6.
SELECT CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen,
IIF(SV.Phai=0, N'Nam', N'Nữ') AS Phai, KH.TenKH
FROM SinhVien SV
JOIN Khoa KH ON KH.MaKH = SV.MaKH
WHERE KH.TenKH = N'anh văn'
GO

--7.
SELECT KH.TenKH, CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen, MH.TenMH, MH.SoTiet, KQ.Diem
FROM Ketqua KQ
JOIN SinhVien SV ON SV.MaSV = KQ.MaSV
JOIN Khoa KH ON KH.MaKH = SV.MaKH
JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
WHERE KH.TenKH = N'tin học'
GO

--8.
SELECT CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen, SV.MaKH, MH.TenMH, KQ.Diem,
IIF(KQ.Diem>8, N'Giỏi', IIF(KQ.Diem>=6 AND KQ.Diem<=8, N'Khá', N'Trung bình')) AS Loai
FROM Ketqua KQ
JOIN SinhVien SV ON SV.MaSV = KQ.MaSV
JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
GO

--Bài 3
--1.
SELECT KQ.MaMH, MH.TenMH, AVG(KQ.Diem) FROM Ketqua KQ
JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
--WHERE TenMH LIKE 'T%'
GROUP BY KQ.MaMH, MH.TenMH
--HAVING AVG(KQ.Diem) > 5
ORDER BY KQ.MaMH
GO

--2.
SELECT CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen, KH.TenKH, 
COUNT(MH.MaMH) AS Tong
FROM SinhVien SV
JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
JOIN Khoa KH ON KH.MaKH = SV.MaKH
GROUP BY CONCAT(SV.HoSV, ' ', SV.TenSV), KH.TenKH
GO

--3.
SELECT SV.TenSV, KH.TenKH,
IIF(SV.Phai=0, N'Nam', N'Nữ') AS Phai, SUM(KQ.Diem) AS Tong
FROM SinhVien SV
JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
JOIN Khoa KH ON KH.MaKH = SV.MaKH
JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
GROUP BY SV.TenSV, KH.TenKH, IIF(SV.Phai=0, N'Nam', N'Nữ')
GO

--4.
SELECT KH.TenKH, COUNT(SV.MaSV) AS Tong
FROM SinhVien SV
JOIN Khoa KH ON KH.MaKH = SV.MaKH
GROUP BY KH.TenKH
GO

--5.
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, MAX(Diem) AS DiemMax
FROM SinhVien SV
JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
GROUP BY CONCAT(HoSV, ' ', TenSV)
GO

--6.
SELECT TenMH, Sotiet SoTietMax
FROM MonHoc
WHERE Sotiet = (SELECT MAX(Sotiet) FROM MonHoc)
GO

--7.
SELECT KH.MaKH, KH.TenKH, MAX(SV.HocBong) AS HocBongMax 
FROM Khoa KH
JOIN SinhVien SV ON SV.MaKH = KH.MaKH
GROUP BY KH.MaKH, KH.TenKH
GO

--8.
SELECT MH.TenMH, MAX(KQ.Diem) AS DiemMax FROM MonHoc MH
JOIN Ketqua KQ ON KQ.MaMH = MH.MaMH
GROUP BY MH.TenMH
GO

--9.
SELECT MH.MaMH, MH.TenMH, COUNT(SV.MaSV) AS Sv
FROM SinhVien SV
JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
GROUP BY MH.MaMH, MH.TenMH
GO

--10.
SELECT MH.TenMH, MH.SoTiet, SV.TenSV, KQ.Diem AS DiemMax
FROM Ketqua KQ
JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
JOIN SinhVien SV ON SV.MaSV = KQ.MaSV
WHERE KQ.Diem = (SELECT MAX(Diem) FROM Ketqua)
GO

--11.
SELECT TOP(1) KH.MaKH, KH.TenKH, COUNT(SV.MaSV) AS Tong FROM Khoa KH
JOIN SinhVien SV ON SV.MaKH = KH.MaKH
GROUP BY KH.MaKH, KH.TenKH
GO

--12.
SELECT KH.TenKH, CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen, SV.HocBong 
FROM Khoa KH
JOIN SinhVien SV ON SV.MaKH = KH.MaKH
WHERE SV.HocBong = (SELECT MAX(HocBong) FROM SinhVien) 
GO

--13.
SELECT TOP(1) SV.MaSV, CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen, KH.TenKH, SV.HocBong
FROM SinhVien SV
JOIN Khoa KH ON KH.MaKH = SV.MaKH
WHERE KH.TenKH = N'tin học'
ORDER BY SV.HocBong DESC
GO

--14.
SELECT TOP(1) CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen, MH.TenMH, KQ.Diem
FROM SinhVien SV
JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
WHERE MH.TenMH = N'cơ sở dữ liệu'
ORDER BY KQ.Diem DESC
GO

--15.
SELECT TOP(3) CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen, KH.TenKH, MH.TenMH, KQ.Diem
FROM SinhVien SV
JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
JOIN Khoa KH ON SV.MaKH = KH.MaKH
JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
WHERE MH.TenMH = N'đồ họa ứng dụng'
ORDER BY KQ.Diem ASC
GO

--16.
SELECT TOP(1) KH.MaKH, KH.TenKH
FROM Khoa KH
JOIN SinhVien SV ON KH.MaKH = SV.MaKH
WHERE SV.Phai = 1
GROUP BY KH.MaKH, KH.TenKH
ORDER BY COUNT(SV.MaSV) DESC
GO

--17.
SELECT KH.MaKH, KH.TenKH, COUNT(SV.MaSV) AS TongSV,
SUM(IIF(SV.Phai=1, 1, 0)) AS TongNu
FROM SinhVien SV
JOIN Khoa KH ON KH.MaKH = SV.MaKH
GROUP BY KH.MaKH, KH.TenKH
GO

--18
SELECT CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen, KH.TenKH,
IIF(KQ.Diem<4, N'Trượt', N'Đậu') AS KetQua
FROM SinhVien SV
JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
JOIN Khoa KH ON KH.MaKH = SV.MaKH
GO

--19.
SELECT CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen, KH.TenKH,
IIF(SV.Phai=0, N'Nam', N'Nứ') AS Phai
FROM SinhVien SV
JOIN Khoa KH ON KH.MaKH = SV.MaKH
WHERE SV.MaSV NOT IN (SELECT MaSV FROM Ketqua WHERE Diem<4)
GO

--20
SELECT MaMH, TenMH FROM MonHoc
WHERE MaMH NOT IN (SELECT MaMH FROM Ketqua WHERE Diem<4)
GO

--21.
SELECT MaKH, TenKH FROM Khoa
WHERE MaKH NOT IN (SELECT MaKH FROM SinhVien SV
					JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
					WHERE KQ.Diem<5)
GO

--22.
SELECT MH.MaMH, MH.TenMH,
SUM(IIF(KQ.Diem<5, 1, 0)) AS TongRot,
SUM(IIF(KQ.Diem>=5, 1, 0)) AS TongDau
FROM MonHoc MH
JOIN Ketqua KQ ON KQ.MaMH = MH.MaMH
GROUP BY MH.MaMH, MH.TenMH
GO

--23.
SELECT MaMH, TenMH FROM MonHoc
WHERE MaMH NOT IN (SELECT MH.MaMH FROM Ketqua KQ
					JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
					WHERE Diem < 5)
GO

--24.
SELECT MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTen, MaKH
FROM SinhVien 
WHERE MaSV NOT IN (SELECT SV.MaSV FROM Ketqua KQ
					JOIN SinhVien SV ON SV.MaSV = KQ.MaSV
					WHERE Diem < 5)
GO

--25.
SELECT SV.MaSV, CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen, SV.MaKH 
FROM SinhVien SV
JOIN Ketqua KQ ON SV.MaSV = KQ.MaSV
WHERE KQ.Diem < 5
GROUP BY SV.MaSV, CONCAT(SV.HoSV, ' ', SV.TenSV), SV.MaKH
HAVING COUNT(KQ.MaMH) > 2
GO

--26.
SELECT KH.MaKH, KH.TenKH, COUNT(SV.MaSV) AS TongSV
FROM Khoa KH
JOIN SinhVien SV ON SV.MaKH = KH.MaKH
GROUP BY KH.MaKH, KH.TenKH
HAVING COUNT(SV.MaSV) > 10
GO

--27.
SELECT SV.MaSV, CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen, COUNT(KQ.MaMH) AS MonThi
FROM SinhVien SV
JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
GROUP BY SV.MaSV, CONCAT(SV.HoSV, ' ', SV.TenSV)
HAVING COUNT(KQ.MaMH) > 4
GO

--28.
SELECT KH.MaKH, KH.TenKH,
COUNT(SV.MaSV) AS TongNam
FROM Khoa KH
JOIN SinhVien SV ON SV.MaKH = KH.MaKH
WHERE SV.Phai = 0
GROUP BY KH.MaKH, KH.TenKH
HAVING COUNT(SV.MaSV) > 5
GO

--29.
SELECT CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen, KH.TenKH, 
IIF(SV.Phai=0, N'Nam', N'Nứ') AS Phai, AVG(KQ.Diem) AS DiemTB
FROM SinhVien SV
JOIN Khoa KH ON KH.MaKH = SV.MaKH
JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
GROUP BY CONCAT(SV.HoSV, ' ', SV.TenSV),  KH.TenKH, IIF(SV.Phai=0, N'Nam', N'Nứ')
HAVING AVG(KQ.Diem) > 4
GO

--30.
SELECT MH.MaMH, MH.TenMH, AVG(KQ.Diem) AS DiemTB FROM Ketqua KQ
JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
GROUP BY MH.MaMH, MH.TenMH
HAVING AVG(KQ.Diem) > 6
GO

--Bài 4
--1.
DECLARE @TenKH NVARCHAR(50)
SET @TenKH = N'anh%'
SELECT MaSV, HoSV + N' ' + TenSV AS N'Họ và tên',
IIF(Phai=0, N'Nam', N'Nữ') AS N'Phái', TenKH
FROM SinhVien SV
JOIN Khoa KH ON SV.MaKH = KH.MaKH
WHERE TenKH LIKE @TenKH
GO

--2.
DECLARE @Diem REAL
SET @Diem = 5.0
SELECT SV.MaSV, SV.HoSV + N' ' + SV.TenSV AS HoTen, MH.TenMH, KQ.Diem 
FROM Ketqua KQ
JOIN SinhVien SV ON SV.MaSV = KQ.MaSV
JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
WHERE MH.TenMH = N'cơ sở dữ liệu' AND KQ.Diem > @Diem
GO

--3.
DECLARE @TenMH NVARCHAR(50)
SET @TenMH = N'đồ họa ứng dụng'
SELECT SV.MaSV, KH.TenKH, MH.TenMH, KQ.Diem 
FROM Ketqua KQ
JOIN SinhVien SV ON SV.MaSV = KQ.MaSV
JOIN Khoa KH ON KH.MaKH = SV.MaKH
JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
WHERE MH.TenMH = @TenMH
GO

--Bài 5
--1.
SELECT MaSV, MaKH, IIF(Phai=0, N'Nam', N'Nữ') AS N'Phái'
FROM SinhVien
WHERE MaSV NOT IN (SELECT DISTINCT MaSV FROM Ketqua)
GO

--2.
SELECT SV.MaSV, SV.HoSV + ' ' + SV.TenSV AS HoTen, SV.MaKH
FROM SinhVien SV
WHERE SV.MaSV NOT IN (SELECT MaSV FROM Ketqua
        WHERE MaMH = (SELECT MaMH FROM MonHoc WHERE TenMH = N'cơ sở dữ liệu')
    );
GO

--3.
SELECT MaMH, TenMH, Sotiet 
FROM MonHoc
WHERE MaMH NOT IN (SELECT MaMH FROM Ketqua)
GO

--4.
SELECT * FROM KHOA
WHERE MaKH NOT IN (SELECT MaKH FROM SinhVien)
GO

--5.
SELECT * FROM SinhVien
WHERE MaKH LIKE 'AV' AND
MaSV NOT IN (SELECT MaSV FROM Ketqua
			WHERE MaMH = N'cơ sở dữ liệu')
GO

--6.
SELECT * FROM MonHoc
WHERE MaMH NOT IN (SELECT MaMH FROM Ketqua KQ
					JOIN SinhVien SV ON SV.MaSV = KQ.MaSV
					WHERE MaKH = N'TH')
GO

--7.
SELECT * FROM SinhVien SV
JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
WHERE MH.TenMH = N'đồ họa ứng dụng'
AND KQ.Diem < (
        SELECT MIN(KQ.Diem)
        FROM Ketqua KQ
        JOIN SinhVien SV ON SV.MaSV = KQ.MaSV
        JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
        WHERE SV.MaKH = N'TH' AND MH.TenMH = N'đồ họa ứng dụng'
    )
GO

--8.
SELECT * FROM SinhVien
WHERE NgaySinh > (SELECT MAX(NgaySinh) FROM SinhVien
					WHERE MaKH = N'AV')
GO

--9.
SELECT * FROM SinhVien
WHERE HocBong > (SELECT SUM(HocBong) FROM SinhVien
					WHERE MaKH = 'TR')
GO

--10.
SELECT * FROM SinhVien
WHERE NoiSinh = (SELECT TOP(1) NoiSinh FROM SinhVien
					WHERE MaKH = 'AV'
					ORDER BY HocBong DESC)
GO

--11.
SELECT SV.MaSV, CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen, MH.TenMH, KQ.Diem
FROM Ketqua KQ
JOIN SinhVien SV ON SV.MaSV = KQ.MaSV
JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
WHERE KQ.Diem IN (SELECT MAX(Diem) FROM Ketqua
				GROUP BY MaMH)
ORDER BY KQ.Diem DESC
GO

--12.
SELECT SV.MaSV, CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen, KH.TenKH,
MAX(SV.HocBong) AS HocBongMax
FROM SinhVien SV
JOIN Khoa KH ON KH.MaKH = SV.MaKH
GROUP BY SV.MaSV, CONCAT(SV.HoSV, ' ', SV.TenSV), KH.TenKH
GO

--Bài 6
--1.
INSERT INTO SinhVien (MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong) VALUES
(N'C02', N'Lê Thành', N'Nguyên', 0, N'1980-10-20', N'Tp.HCM', 'TH', 850000)
GO

--2.
INSERT INTO MonHoc (MaMH, TenMH, Sotiet) VALUES
('10', N'Xử lí ảnh', 45)
GO

--3.
INSERT INTO Khoa (MaKH, TenKH) VALUES
('CT', N'Công trình')
GO

--4.
INSERT INTO SinhVien(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong) VALUES
('C04', N'Nguyễn Trần', N'Quân', 0, GETDATE(), N'Huế', 'CT', 950000)
GO

--5.
INSERT INTO Ketqua(MaSV, MaMH, Diem)
SELECT MaSV, N'06', 7.0 FROM SinhVien
WHERE MaKH LIKE 'TH' AND 
MaSV NOT IN (SELECT MaSV FROM Ketqua WHERE MaMH = N'06')
GO

--6.
INSERT INTO Ketqua(MaSV, MaMH, Diem)
SELECT 'C02', MaMH, 8.0 FROM MonHoc
WHERE MaMH NOT IN (SELECT MaMH FROM dbo.Ketqua 
					WHERE MaSV = 'C02')
GO

--Bài 7
--1.
SELECT SV.MaSV,
    CONCAT(SV.HoSV, ' ', SV.TenSV) AS HoTen,
    IIF(SV.Phai=0, N'Nam', N'Nữ') AS Phai,
    SV.NgaySinh, SV.NoiSinh, KH.TenKH, SV.HocBong
INTO DeleteTable
FROM SinhVien SV
JOIN Khoa KH ON KH.MaKH = SV.MaKH
GO

--2.
DELETE FROM DeleteTable
WHERE HocBong IS NULL OR HocBong=0
GO

--3.
DELETE FROM DeleteTable
WHERE NgaySinh = '1987-12-20'
GO

--4.
DELETE FROM DeleteTable
WHERE NgaySinh < '1987-03-01'
GO

--5.
DELETE FROM DeleteTable
WHERE Phai = N'Nam' AND TenKH = N'Tin học'
GO

--Bài 8
--1.
UPDATE MonHoc
SET Sotiet = 45
WHERE TenMH = N'Tiếng Anh cơ bản'
GO

--2.
UPDATE SinhVien
SET TenSV = N'Kỳ'
WHERE HoSV = N'Trần Thị' AND TenSV = N'Mai';
GO

--3.
UPDATE SinhVien
SET Phai = 0
WHERE HoSV = N'Trần Thị' AND TenSV = N'Kỳ'
GO

--4.
UPDATE SinhVien
SET NgaySinh = '1990-07-05'
WHERE HoSV = N'Trần Thị Thu' AND TenSV = N'Thủy'
GO

--5.
UPDATE SinhVien
SET HocBong = HocBong + 100000
WHERE MaKH = N'AV'
GO

--6.
UPDATE KQ
SET Diem = CASE
    WHEN kq.Diem + 5 > 10 THEN 10.0 
    ELSE kq.Diem + 5          
END
FROM Ketqua KQ
JOIN SinhVien SV ON SV.MaSV = KQ.MaSV
JOIN MonHoc MH ON MH.MaMH = KQ.MaMH
WHERE SV.MaKH = 'AV' AND MH.MaMH = '02'
GO

--7.
UPDATE SinhVien
SET HocBong = HocBong +
    CASE
        WHEN Phai = 1 AND MaKH = N'AV' THEN 100000
        WHEN Phai = 0 AND MaKH = N'TH' THEN 150000
    ELSE 50000 END
WHERE
    HocBong IS NOT NULL
GO

--8.
UPDATE KQ
SET Diem = CASE
        WHEN SV.MaKH = 'AV' THEN
            CASE
                WHEN KQ.Diem + 2 > 10 THEN 10.0
                ELSE KQ.Diem + 2
            END
        WHEN SV.MaKH = 'TH' THEN
            CASE
                WHEN KQ.Diem - 1 < 0 THEN 0.0
                ELSE KQ.Diem - 1
            END
        ELSE KQ.Diem
    END
FROM Ketqua KQ
JOIN SinhVien SV ON SV.MaSV = KQ.MaSV
WHERE KQ.MaMH = '01'
GO
