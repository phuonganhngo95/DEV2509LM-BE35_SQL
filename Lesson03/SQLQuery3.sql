CREATE VIEW vw_Khoa
AS
SELECT MaKH, TenKH FROM Khoa
GO

ALTER VIEW vw_Khoa
AS
SELECT K.MaKH, TenKH AS N'Tên Khoa' FROM Khoa K
JOIN SinhVien SV ON K.MaKH = SV.MaSV
GO

DROP VIEW vw_Khoa
GO

SELECT * FROM vw_Khoa

--Xem code view
sp_helptext vw_Khoa

--Xem sự phụ thuộc của view vào bảng
sp_depends vw_Khoa

SELECT DISTINCT MaSV FROM Ketqua

SELECT MaSV FROM SinhVien

CREATE PROC sp_searchSinhVienByName
@name NVARCHAR(50)
AS
BEGIN
	SELECT * FROM SinhVien WHERE TenSV LIKE '%' + @name + '%'
END
GO
exec sp_searchSinhVienByName @name = N'm'
GO

DROP PROC sp_searchSinhVienByName
GO

DECLARE @TenBang TABLE (
	MaSV NVARCHAR(5),
	TenSV NVARCHAR(30)
)

INSERT @TenBang VALUES
('SV01', 'Devmaster')

SELECT * FROM @TenBang