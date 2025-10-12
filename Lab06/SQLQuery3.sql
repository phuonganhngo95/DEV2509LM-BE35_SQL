USE QLBanHang
GO

--Bài 1
--1.
CREATE PROCEDURE spud_LayDanhsachVATTU AS BEGIN
	SELECT * FROM VATTU
	ORDER BY TenVTu ASC
END
GO

--2.
CREATE PROCEDURE spud_LayDanhsach_NHACC
@mancc CHAR(10) = NULL
AS BEGIN
	IF @mancc IS NULL BEGIN
		SELECT * FROM NHACC 
	END
	ELSE BEGIN
		SELECT * FROM NHACC
		WHERE MANCC = @mancc
	END
END
GO

--3.
CREATE PROCEDURE spud_PXUAT_BcaoPxuat
@phieuXuat CHAR(4) = NULL
AS BEGIN
	SELECT DISTINCT PX.SoPx, PX.NgayXuat, PX.TenKH, CX.Mavtu, VT.TenVTu, CX.SLXuat, CX.DGXuat
	FROM PXUAT PX
	JOIN CTPXUAT CX ON CX.SoPx = PX.SoPx
	JOIN VATTU VT ON VT.Mavtu = CX.Mavtu
	WHERE @phieuXuat IS NULL OR PX.SoPx = @phieuXuat
END
GO

--4.
CREATE PROCEDURE spud_PNHAP_BcaoPNhap
@phieuNhap CHAR(4) = NULL
AS BEGIN
	SELECT PN.SoPn, PN.NgayNhap, PN.SoDH, CN.Mavtu, VT.TenVTu, CN.SLNhap, CN.DGNhap
    FROM PNHAP PN
	JOIN CTPNHAP CN ON CN.SoPn = PN.SoPn
	JOIN VATTU VT ON VT.Mavtu = CN.Mavtu
	WHERE @phieuNhap IS NULL OR PN.SoPn = @phieuNhap
END
GO

--5.
CREATE PROCEDURE spud_TONKHO_BcaoTonkho
@namThang CHAR(6)
AS BEGIN
	SELECT TK.NamThang, TK.Mavtu, VT.TenVTu, TK.SLDau, TK.TongSLN, TK.TongSLX, TK.SLCuoi
    FROM TONKHO TK
	JOIN VATTU VT ON VT.Mavtu = TK.Mavtu
	WHERE TK.NamThang = @namThang
END
GO

--Bài 2
--1.
CREATE PROCEDURE spud_VATTU_Them
@mavtu CHAR(4), @tenvtu NVARCHAR(100), @dvtinh NVARCHAR(10)=N'', @phantram REAL
AS BEGIN
	IF EXISTS (SELECT 1 FROM VATTU
				WHERE Mavtu = @mavtu)
	BEGIN RETURN
	END
	IF EXISTS (SELECT 1 FROM VATTU
				WHERE TenVTu = @tenvtu)
	BEGIN RETURN
	END
	IF @phantram<0 OR @phantram>100
	BEGIN RETURN
	END

	INSERT INTO VATTU VALUES
	(@mavtu, @tenvtu, @dvtinh, @phantram)
END
GO

--2.
CREATE PROCEDURE spud_VATTU_Xoa
@mavtu CHAR(4)
AS BEGIN
	IF EXISTS (SELECT 1 FROM CTDONDH
					WHERE Mavtu = @mavtu)
	BEGIN RETURN
	END
	IF EXISTS (SELECT 1 FROM CTPNHAP
					WHERE Mavtu = @mavtu)
	BEGIN RETURN
	END
	IF EXISTS (SELECT 1 FROM CTPXUAT
					WHERE Mavtu = @mavtu)
	begin return
	end
	if exists (select 1 FROM TONKHO
					where Mavtu = @mavtu)
	BEGIN RETURN
	END

	IF NOT EXISTS (SELECT 1 FROM VATTU
					WHERE Mavtu = @mavtu)
	BEGIN RETURN
	END
	DELETE FROM VATTU
	WHERE Mavtu = @mavtu
END
GO

--3.
CREATE PROCEDURE spud_VATTU_Sua
@mavtu CHAR(4), @tenvtu NVARCHAR(100), @dvtinh NVARCHAR(10), @phantram REAL
AS BEGIN
	UPDATE VATTU SET 
		TenVTu = @tenvtu,
		Dvtinh = @dvtinh,
		Phantram = @phantram
	WHERE Mavtu = @mavtu
END
GO

--Bài 3
--1.
--create procedure spud_DONDH_TinhThanhtien
--@sodh char(4), @mavtu char(4), @thanhtien money output
--as begin
--	select
--end
--go

--2.
CREATE PROCEDURe spud_PNHAP_TinhTongSLNHang
@sodh CHAR(4), @mavtu CHAR(4), @tongslnhap INT OUTPUT
AS BEGIN
	SELECT @tongslnhap = SUM(CN.SLNhap)
	FROM PNHAP PN
	JOIN CTPNHAP CN ON CN.SoPn = PN.SoPn
	WHERE PN.SoDH = @sodh AND CN.Mavtu = @mavtu
END
GO

--3.
CREATE PROCEDURE spud_TONKHO_TinhSLDau
@namthang CHAR(6), @mavtu CHAR(4), @sldauki INT OUTPUT
AS BEGIN
	SELECT @sldauki = SLDau 
	FROM TONKHO
	WHERE NamThang = @namthang and Mavtu = @mavtu
END
GO

--4.
CREATE PROCEDURE spud_TONKHO_TinhTongNX
@namthang CHAR(6), @mavtu CHAR(4), @tongslnhap INT OUTPUT, @tongslxuat INT OUTPUT
AS BEGIN
	SELECT @tongslnhap = TongSLN, @tongslxuat = TongSLX
    FROM TONKHO
    WHERE NamThang = @namthang AND Mavtu = @mavtu
END
GO

CREATE PROCEDURE spud_TONKHO_TinhSLCuoi
    @nam_thang char(6),
    @ma_vat_tu char(4),
    @sl_cuoi INT OUTPUT
AS
BEGIN
    DECLARE @sl_dau_ky INT
    DECLARE @tong_sl_nhap INT
    DECLARE @tong_sl_xuat INT
    EXEC spud_TONKHO_TinhSLDau 
        @nam_thang = @nam_thang, 
        @ma_vat_tu = @ma_vat_tu, 
        @sl_dau = @sl_dau_ky OUTPUT
    EXEC spud_TONKHO_TinhTongNX 
        @nam_thang = @nam_thang, 
        @ma_vat_tu = @ma_vat_tu, 
        @tong_sl_nhap = @tong_sl_nhap OUTPUT,
        @tong_sl_xuat = @tong_sl_xuat OUTPUT

    SET @sl_cuoi = @sl_dau_ky + @tong_sl_nhap - @tong_sl_xuat
END
GO