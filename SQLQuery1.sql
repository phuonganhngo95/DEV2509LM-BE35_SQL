CREATE DATABASE DEV2509SQL35_NgoPhuongAnh_0388319505
GO

CREATE TABLE SalesPerson (
	SlsPerID CHAR(10) PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE Customer (
	CustID CHAR(10) PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE Iventory (
	InvtID CHAR(10) PRIMARY KEY,
	Descr NVARCHAR(100) NOT NULL,
	StkBasePrc MONEY NOT NULL
)
GO

CREATE TABLE xswSalesOrd (
	OrderNbr CHAR(10) PRIMARY KEY,
	OrderDate DATE NOT NULL,
	SlsPerID CHAR(10) NOT NULL,
	CustID CHAR(10) NOT NULL,
	OrdAmt MONEY NOT NULL,
	FOREIGN KEY (SlsPerID) REFERENCES SalesPerson(SlsPerID),
	FOREIGN KEY (CustID) REFERENCES Customer(CustID)
)
GO

CREATE TABLE xswSlsOrdDet (
	OrderNbr CHAR(10) NOT NULL,
	InvtID CHAR(10) NOT NULL,
	PRIMARY KEY (OrderNbr, InvtID),
	LineQty INT NOT NULL,
	LineAmt MONEY NOT NULL,
	SlsPrice MONEY NOT NULL,
	FOREIGN KEY (OrderNbr) REFERENCES xswSalesOrd(OrderNbr),
	FOREIGN KEY (InvtID) REFERENCES Iventory(InvtID)
)
GO

INSERT INTO SalesPerson VALUES
('NV01', N'Ngô Phương Anh'),
('NV02', N'Phương Anh Ngô')
GO

INSERT INTO Customer VALUES
('KH01', N'Nguyễn Văn An'),
('KH02', N'Trần Thanh Thúy')
GO

INSERT INTO Iventory VALUES
('H1', N'Tivi', 1000000),
('C2', N'Điện thoại', 5000000)
GO

INSERT INTO xswSalesOrd VALUES
('HD1', N'20250514', 'NV02', 'KH01', 6000000),
('HD2', N'20151023', 'NV01', 'KH02', 12000000)
GO

INSERT INTO xswSlsOrdDet VALUES
('HD2', 'H1', 15, 700000, 20000000),
('HD1', 'C2', 2, 100000, 1000000)
GO

--4.1
SELECT *
FROM Iventory
WHERE InvtID NOT IN (SELECT InvtID FROM xswSlsOrdDet SD
					JOIN xswSalesOrd SO ON SO.OrderNbr = SD.OrderNbr
					JOIN Customer C ON C.CustID = SO.CustID
					WHERE YEAR(SO.OrderDate) = 2010 AND C.City = N'Hà Nội')
GO

--4.2
SELECT * 
FROM SalesPerson S
WHERE S.SlsPerID NOT IN (SELECT DISTINCT SO.SlsPerID FROM xswSalesOrd SO
						JOIN xswSlsOrdDet SD ON SD.OrderNbr = SO.OrderNbr
						JOIN Iventory I ON I.InvtID = SD.InvtID
						WHERE YEAR(OrderDate)=2010 AND I.Descr = N'OMO' AND SO.SlsPerID <> SO.CustID)
GO

--4.3
SELECT TOP(1) WITH TIES 
S.SlsPerID, S.Name, DoanhSo.Tong
FROM SalesPerson S
JOIN (
	SELECT SlsPerID, SUM(OrdAmt) AS Tong FROM xswSalesOrd
	WHERE YEAR(OrderDate)=2010 AND MONTH(OrderDate) IN (1,2,3,7,8,9)
	GROUP BY SlsPerID) AS DoanhSo ON S.SlsPerID = DoanhSo.SlsPerID
ORDER BY DoanhSo.Tong DESC
GO

--4.4
SELECT TOP(1) WITH TIES
I.InvtID, I.Descr, I.StkBasePrc, SUM(SD.LineQty) AS TongBan
FROM Iventory I
JOIN xswSlsOrdDet SD ON SD.InvtID = I.InvtID
JOIN xswSalesOrd SO ON SO.OrderNbr = SD.OrderNbr
WHERE YEAR(SO.OrderDate) = 2010 AND MONTH(SO.OrderDate) BETWEEN 1 AND 6
GROUP BY I.InvtID, I.Descr, I.StkBasePrc
ORDER BY TongBan DESC
GO

--4.5
SELECT TOP(1) WITH TIES
I.InvtID, I.Descr, I.StkBasePrc, COUNT(I.InvtID) AS LanXH
FROM Iventory I
JOIN xswSlsOrdDet SD ON SD.InvtID = I.InvtID
JOIN xswSalesOrd SO ON SO.OrderNbr = SD.OrderNbr
WHERE YEAR(SO.OrderDate)=2010 AND MONTH(SO.OrderDate) IN (10, 11, 12)
GROUP BY I.InvtID, I.Descr, I.StkBasePrc
ORDER BY LanXH DESC
GO

--4.6
SELECT TOP(1) WITH TIES 
S.Name, S.SlsPerID, COUNT(DISTINCT SO.CustID) AS SlgKH
FROM SalesPerson S
JOIN xswSalesOrd SO ON SO.SlsPerID = S.SlsPerID
WHERE SO.SlsPerID <> SO.CustID
GROUP BY S.Name, S.SlsPerID
ORDER BY SlgKH DESC
GO

--4.7
SELECT TOP(1) WITH TIES
C.CustID, C.Name, COUNT(SO.OrderNbr) AS SlgDH
FROM Customer C
JOIN xswSalesOrd SO ON SO.CustID = C.CustID
WHERE YEAR(SO.OrderDate) = 2010 AND SO.SlsPerID <> SO.CustID
GROUP BY C.CustID, C.Name
ORDER BY SlgDH DESC
GO

--4.8
SELECT I.InvtID, I.Descr, COUNT(SD.InvtID) AS LanMua
FROM Iventory I
JOIN xswSlsOrdDet SD ON SD.InvtID = I.InvtID
JOIN xswSalesOrd SO ON SO.OrderNbr = SD.OrderNbr
WHERE YEAR(SO.OrderDate)=2010
GROUP BY I.InvtID, I.Descr
HAVING COUNT(SD.InvtID) < 5
GO

--4.9
SELECT TOP(10) C.CustID, C.Name, SUM(SO.OrdAmt) AS TongGiaTri
FROM Customer C
JOIN xswSalesOrd SO ON SO.CustID = C.CustID
WHERE YEAR(SO.OrderDate) = 2010
AND MONTH(SO.OrderDate) BETWEEN 1 AND 3
GROUP BY C.CustID, C.Name
ORDER BY TongGiaTri DESC
GO

--4.10
SELECT S.Name, S.SlsPerID, COUNT(DISTINCT CASE WHEN SO.SlsPerID<>SO.CustID THEN SO.CustID END) AS SlgKH
FROM SalesPerson S
JOIN xswSalesOrd SO ON SO.SlsPerID = S.SlsPerID
GROUP BY S.Name, S.SlsPerID
ORDER BY SlgKH DESC
GO

--4.11
SELECT OrderNbr, OrderDate, SlsPerID, CustID, OrdAmt, SUM(OrdAmt) AS TongDS
FROM xswSalesOrd
WHERE YEAR(OrderDate) = 2010
GROUP BY OrderNbr, OrderDate, SlsPerID, CustID, OrdAmt
GO

--4.12
SELECT SD.OrderNbr, I.InvtID, SD.LineAmt, SD.LineQty, SD.SlsPrice, SUM(SD.LineQty) AS TongSlgBan
FROM xswSlsOrdDet SD
JOIN xswSalesOrd SO ON SO.OrderNbr = SD.OrderNbr
JOIN Iventory I ON SD.InvtID = I.InvtID
WHERE YEAR(SO.OrderDate) = 2010
GROUP BY SD.OrderNbr, I.InvtID, SD.LineAmt, SD.LineQty, SD.SlsPrice
GO

--4.13
SELECT TOP(1) WITH TIES 
S.SlsPerID, S.Name, SUM(SD.LineQty) AS TongSLBan
FROM xswSalesOrd SO
JOIN xswSlsOrdDet SD ON SD.OrderNbr = SO.OrderNbr
JOIN SalesPerson S ON S.SlsPerID = SO.SlsPerID
GROUP BY S.SlsPerID, S.Name
ORDER BY TongSLBan DESC
GO

---4.14
SELECT SO.OrderNbr, SO.OrderDate, SO.SlsPerID, SO.CustID, I.Descr, SD.LineQty, SUM(SD.LineQty) AS TongSLHD
FROM xswSalesOrd SO
JOIN xswSlsOrdDet SD ON SD.OrderNbr = SO.OrderNbr
JOIN Iventory I ON I.InvtID = SD.InvtID
WHERE YEAR(SO.OrderDate) = 2025
GROUP BY SO.OrderNbr, SO.OrderDate, SO.SlsPerID, SO.CustID, I.Descr, SD.LineQty
GO

--4.15
DELETE FROM Iventory
WHERE InvtID IN (SELECT I.InvtID FROM Iventory I
				JOIN xswSlsOrdDet SD ON SD.InvtID = I.InvtID
				WHERE SD.InvtID IS NULL)
GO

--4.16
SELECT Months.Thang, ISNULL(SUM(SO.OrdAmt), 0) AS DoanhSo
FROM 
(SELECT 1 AS Thang UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12) AS Months
JOIN xswSalesOrd SO ON Months.Thang = MONTH(SO.OrderDate) AND YEAR(SO.OrderDate)=2010
GROUP BY Months.Thang
GO