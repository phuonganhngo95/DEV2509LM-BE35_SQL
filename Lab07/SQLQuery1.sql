USE QLBanHang
GO

--Bài 1
--1.
CREATE TRIGGER tg_PNHAP_Them ON PNHAP FOR INSERT
AS BEGIN
	IF EXISTS (SELECT * FROM INSERTED i
				WHERE SoDH IS NULL)
	BEGIN RETURN END
	IF EXISTS(SELECT * FROM INSERTED i
				JOIN DONDH DH ON DH.SoDH = i.SoDH
				WHERE NgayNhap <= NgayDH)
	BEGIN RETURN END
END
GO

--2.
CREATE TRIGGER tg_CTPNHAP_Them ON CTPNHAP FOR INSERT
AS
BEGIN
	IF EXISTS (SELECT * FROM inserted i
				JOIN PNHAP PN ON i.SoPn = PN.SoPn
				JOIN CTDONDH CT ON pn.SoDH = CT.SoDH AND i.Mavtu = CT.Mavtu
				WHERE CT.Mavtu IS NULL)
    BEGIN RETURN END
    IF EXISTS (SELECT * FROM inserted i
				JOIN PNHAP pn ON i.SoPn = pn.SoPn
				JOIN CTDONDH CT ON pn.SoDH = CT.SoDH AND i.Mavtu = CT.Mavtu
				JOIN (SELECT PN.SoDH, CN.Mavtu, 
                SUM(CN.SLNhap) as TongSLDaNhapTruoc
            FROM CTPNHAP CN
			JOIN PNHAP PN ON CN.SoPn = PN.SoPn
            WHERE CN.SoPn NOT IN (SELECT SoPn FROM inserted) 
            GROUP BY PN.SoDH, CN.Mavtu
        ) AS TotalPreviousImports ON pn.SoDH = TotalPreviousImports.SoDH AND i.Mavtu = TotalPreviousImports.Mavtu
        WHERE i.SLNhap > (CT.SlDat - ISNULL(TotalPreviousImports.TongSLDaNhapTruoc, 0))
    )
    BEGIN RETURN END
END
GO

--Bài 2
--1.
CREATE TRIGGER tg_PXUAT_Xoa ON PXUAT FOR DELETE
AS BEGIN
	DELETE CX FROM CTPXUAT CX
    JOIN deleted D ON CX.SoPx = D.SoPx
END
GO

--2.
CREATE TRIGGER tg_PNHAP_Xoa ON PNHAP FOR DELETE
AS BEGIN
	DELETE CN
    FROM CTPNHAP CN
    JOIN deleted D ON CN.SoPn = D.SoPn
END
GO

--Bài 3
--1.
CREATE TRIGGER tg_PNHAP_Sua ON PNHAP FOR UPDATE
AS BEGIN
	IF UPDATE(SoPn) OR UPDATE(SoDH)
    BEGIN
        IF EXISTS (SELECT * FROM inserted i
					JOIN deleted D ON i.SoPn = D.SoPn
					WHERE i.SoPn <> D.SoPn OR i.SoDH <> D.SoDH
        )
        BEGIN RETURN END
    END
    IF UPDATE(NgayNhap) OR UPDATE(SoDH)
    BEGIN
        IF EXISTS (SELECT * FROM inserted i
            JOIN DONDH d ON i.SoDH = d.SoDH
            WHERE i.NgayNhap <= d.NgayDH
        )
        BEGIN RETURN END
    END
END
GO

--2.
CREATE TRIGGER tg_PXUAT_Sua ON PXUAT FOR UPDATE
AS BEGIN
    IF UPDATE(SoPx)
    BEGIN
        IF EXISTS (SELECT * FROM inserted i
					JOIN deleted d ON i.SoPx = d.SoPx
					WHERE i.SoPx <> d.SoPx)
        BEGIN RETURN END
    END
	IF UPDATE(NgayXuat)
    BEGIN
        IF EXISTS (SELECT * FROM inserted i
					JOIN deleted d ON i.SoPx = d.SoPx
					WHERE FORMAT(i.NgayXuat, 'yyyyMM') <> FORMAT(d.NgayXuat, 'yyyyMM'))
        BEGIN RETURN END
    END
END
GO

--Bài 4
--1.
CREATE TRIGGER tg_CTPNHAP_Them ON CTPNHAP FOR INSERT
AS BEGIN
    DECLARE @ErrorMessage NVARCHAR(500)
    IF EXISTS (SELECT * FROM inserted i
				JOIN PNHAP pn ON i.SoPn = pn.SoPn
				JOIN CTDONDH ctdh ON pn.SoDH = ctdh.SoDH AND i.Mavtu = ctdh.Mavtu
				WHERE ctdh.Mavtu IS NULL)
    BEGIN RETURN END
    IF EXISTS (SELECT 1 FROM inserted i
				JOIN PNHAP pn ON i.SoPn = pn.SoPn
				JOIN CTDONDH ctdh ON pn.SoDH = ctdh.SoDH AND i.Mavtu = ctdh.Mavtu
				JOIN (SELECT pn_pre.SoDH, ctpn_pre.Mavtu, SUM(ctpn_pre.SLNhap) AS TongSLDaNhapTruoc
						FROM CTPNHAP ctpn_pre
						JOIN PNHAP pn_pre ON ctpn_pre.SoPn = pn_pre.SoPn
						WHERE ctpn_pre.SoPn NOT IN (SELECT SoPn FROM inserted)
						GROUP BY pn_pre.SoDH, ctpn_pre.Mavtu) AS TotalPreviousImports ON pn.SoDH = TotalPreviousImports.SoDH AND i.Mavtu = TotalPreviousImports.Mavtu
						WHERE i.SLNhap > (ctdh.SlDat - ISNULL(TotalPreviousImports.TongSLDaNhapTruoc, 0)))
    BEGIN RETURN END
    UPDATE pn SET TONGTG = ISNULL(pn.TONGTG, 0) + (i.SLNhap * i.DGNhap)
    FROM PNHAP pn
    JOIN inserted i ON pn.SoPn = i.SoPn;
    INSERT INTO TONKHO (NamThang, Mavtu, TongSLN)
    SELECT
        FORMAT(pn.NgayNhap, 'yyyyMM') AS NamThang, i.Mavtu, SUM(i.SLNhap) AS TongSLNhap FROM inserted i
		JOIN PNHAP pn ON i.SoPn = pn.SoPn
		GROUP BY FORMAT(pn.NgayNhap, 'yyyyMM'), i.Mavtu
		ON DUPLICATE KEY UPDATE	TongSLN = TONKHO.TongSLN + VALUES(TongSLN)
    MERGE TONKHO AS Target
    USING (SELECT FORMAT(pn.NgayNhap, 'yyyyMM') AS NamThang, i.Mavtu, SUM(i.SLNhap) AS TongSLNhap FROM inserted i
			JOIN PNHAP pn ON i.SoPn = pn.SoPn
			GROUP BY FORMAT(pn.NgayNhap, 'yyyyMM'), i.Mavtu) AS Source (NamThang, Mavtu, TongSLN_Insert)
			ON (Target.NamThang = Source.NamThang AND Target.Mavtu = Source.Mavtu)
    WHEN MATCHED THEN
        UPDATE SET Target.TongSLN = Target.TongSLN + Source.TongSLN_Insert
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (NamThang, Mavtu, TongSLN)
        VALUES (Source.NamThang, Source.Mavtu, Source.TongSLN_Insert)
END
GO

--2.
CREATE TRIGGER tg_CTPXUAT_Them ON CTPXUAT FOR INSERT
AS BEGIN
	DECLARE @ErrorMessage NVARCHAR(500)
    IF EXISTS (SELECT i.SoPx FROM inserted i
				JOIN PXUAT px ON i.SoPx = px.SoPx
				WHERE px.SoPx IS NULL)
    BEGIN RETURN END
    IF EXISTS (SELECT i.Mavtu FROM inserted i
				JOIN VATTU vt ON i.Mavtu = vt.Mavtu
				WHERE vt.Mavtu IS NULL)
    BEGIN RETURN END
    IF EXISTS (SELECT i.Mavtu, SUM(i.SLXuat) AS TongSLXuatCanThem, tk.SLCuoi FROM inserted i
				JOIN PXUAT px ON i.SoPx = px.SoPx
				JOIN TONKHO tk ON i.Mavtu = tk.Mavtu AND FORMAT(px.NgayXuat, 'yyyyMM') = tk.NamThang
				GROUP BY i.Mavtu, tk.SLCuoi
				HAVING SUM(i.SLXuat) > tk.SLCuoi)
    BEGIN RETURN END
    UPDATE px SET TONGTG = ISNULL(px.TONGTG, 0) + (i.SLXuat * i.DGXuat) FROM PXUAT px
    JOIN inserted i ON px.SoPx = i.SoPx;
    MERGE TONKHO AS Target
    USING (SELECT FORMAT(px.NgayXuat, 'yyyyMM') AS NamThang, i.Mavtu, SUM(i.SLXuat) AS TongSLXuat FROM inserted i
			JOIN PXUAT px ON i.SoPx = px.SoPx
			GROUP BY FORMAT(px.NgayXuat, 'yyyyMM'), i.Mavtu) AS Source (NamThang, Mavtu, TongSLX_Insert)
    ON (Target.NamThang = Source.NamThang AND Target.Mavtu = Source.Mavtu)
    WHEN MATCHED THEN
        UPDATE SET Target.TongSLX = Target.TongSLX + Source.TongSLX_Insert
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (NamThang, Mavtu, TongSLX)
        VALUES (Source.NamThang, Source.Mavtu, Source.TongSLX_Insert);
END
GO

--Bài 5
--1.
CREATE TRIGGER tg_CTPXUAT_Xoa ON CTPXUAT FOR DELETE
AS BEGIN
    UPDATE px SET TONGTG = ISNULL(px.TONGTG, 0) - (d.SLXuat * d.DGXuat) FROM PXUAT px
    JOIN deleted d ON px.SoPx = d.SoPx
    WHERE px.TONGTG >= (d.SLXuat * d.DGXuat)
    UPDATE tk SET TongSLX = tk.TongSLX - d.SLXuat FROM TONKHO tk
    JOIN deleted d ON tk.Mavtu = d.Mavtu
    JOIN PXUAT px ON d.SoPx = px.SoPx
    WHERE tk.NamThang = FORMAT(px.NgayXuat, 'yyyyMM') AND tk.TongSLX >= d.SLXuat; -- Đảm bảo TongSLX không âm
END
GO

--2.
CREATE TRIGGER tg_CTPNHAP_Xoa ON CTPNHAP FOR DELETE
AS BEGIN
    UPDATE pn
    SET TONGTG = ISNULL(pn.TONGTG, 0) - (d.SLNhap * d.DGNhap)
    FROM PNHAP pn
    INNER JOIN deleted d ON pn.SoPn = d.SoPn
    WHERE pn.TONGTG >= (d.SLNhap * d.DGNhap)
    UPDATE tk
    SET TongSLN = tk.TongSLN - d.SLNhap
    FROM TONKHO tk
    INNER JOIN deleted d ON tk.Mavtu = d.Mavtu
    INNER JOIN PNHAP pn ON d.SoPn = pn.SoPn
    WHERE tk.NamThang = FORMAT(pn.NgayNhap, 'yyyyMM')
      AND tk.TongSLN >= d.SLNhap    
END
GO

--Bài 6
--1.
CREATE VIEW vw_VatTu
AS
SELECT * FROM VATTU

CREATE TRIGGER tg_vw_VatTu_Insert ON vw_VatTu INSTEAD OF INSERT
AS BEGIN
    DECLARE @ErrorMessage NVARCHAR(500)
    IF EXISTS (SELECT 1 FROM VATTU v INNER JOIN inserted i ON v.Mavtu = i.Mavtu)
    BEGIN RETURN END
    IF EXISTS (SELECT 1 FROM VATTU v INNER JOIN inserted i ON v.TenVTu = i.TenVTu)
    BEGIN RETURN END
	IF EXISTS (SELECT 1 FROM inserted i
				WHERE i.Phantram < 0 OR i.Phantram > 100)
    BEGIN RETURN END
    INSERT INTO VATTU (Mavtu, TenVTu, Dvtinh, Phantram)
    SELECT Mavtu, TenVTu, Dvtinh, Phantram FROM inserted
END
GO

--2.
CREATE VIEW vw_CTDONDH
AS
SELECT c.*, v.TenVTu
FROM CTDONDH c INNER JOIN VATTU v ON c.Mavtu = v.mavtu
GO

CREATE TRIGGER tg_vw_CTDONDH_Insert ON vw_CTDONDH INSTEAD OF INSERT
AS BEGIN
    DECLARE @ErrorMessage NVARCHAR(500)
    IF EXISTS (SELECT i.SoDH FROM inserted i
				JOIN DONDH d ON i.SoDH = d.SoDH
				WHERE d.SoDH IS NULL)
    BEGIN RETURN END
    IF EXISTS (SELECT 1 FROM CTDONDH c
				JOIN inserted i ON c.SoDH = i.SoDH AND c.Mavtu = i.Mavtu)
    BEGIN RETURN END
    IF EXISTS (SELECT 1 FROM inserted i
				WHERE i.SlDat <= 0)
    BEGIN RETURN END
    INSERT INTO VATTU (Mavtu, TenVTu, Dvtinh, Phantram)
    SELECT DISTINCT i.Mavtu, ISNULL(i.TenVTu, N'Vật tư mới'), N'Chiếc', 0 FROM inserted i
	JOIN VATTU v ON i.Mavtu = v.Mavtu
    WHERE v.Mavtu IS NULL
    INSERT INTO CTDONDH (SoDH, Mavtu, SlDat)
    SELECT SoDH, Mavtu, SlDat FROM inserted
END
GO