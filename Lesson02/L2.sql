-- Tạo cơ sở dữ liệu
create database DEV2509LM_Backend_SQL_Lesson02
go

-- Sử dụng CSDL
use DEV2509LM_Backend_SQL_Lesson02
go

-- Tạo bảng
create table KHOA (
	MaKH char(2) primary key,
	TenKH nvarchar(50)
)

create table MON (
	MaMH char(2) primary key,
	TenMH nvarchar(50),
	Sotiet int
)

create table SINHVIEN (
	MaSV char(2) primary key,
	HoSV nvarchar(30),
	TenSV nvarchar(20),
	Phai bit,
	Ngaysinh datetime,
	NoiSinh nvarchar(50),
	MaKH char(2),
	Hocbong Real,
	foreign key (MaKH) references KHOA (MaKH)
)

create table KETQUA (
	MaSV char(2),
	MaMH char(2),
	primary key(MaSV, MaMH),
	Diem int,
	foreign key (MaSV) references SINHVIEN (MaSV),
	foreign key (MaMH) references MON (MaMH)
)

alter table MON
add Test nvarchar(50)
go

-- Sửa cột
alter table MON
alter column Test nvarchar(25) not null
go

-- Xóa cột
alter table MON
drop column Test
go

--Dữ liệu
--Thêm dữ liệu
insert into KHOA(MaKH, TenKH) values
('IT', N'Công nghệ thông tin'),
('AH', N'Anh học'),
('TH', N'Trung Quốc học')
go

select * from KHOA

-- Sửa dữ liệu
update KHOA set MaKH = N'OT' where MaKH = 'IT'

--Xóa dữ liệu
delete KHOA where MaKH = 'IT'

truncate table KHOA

--Xóa bảng
drop table KHOA

--Bổ từ - Ràng buộc khi tạo bảng và sửa bảng
--1. primary key
--2.foreign key

-- primary key
--create table DIEM (
	--MaDiem char(5) primary key,
-- primary key (MaDiem)
	--Diem float
)
go

--foreign key
create table DIEM (
	MaMH char(2) primary key,
	TenMH nvarchar(50),
	Sotiet int,
	foreign key (MaMH) references MON(MaMH)
)
go

--Check/Null/Not null
create table SINHVIEN (
	MaSV char(5) primary key,
	Name nvarchar(50) not null,
	Age int check(Age>18 and Age<100)
)

insert into SINHVIEN (MaSV, Name, Age) values
('SV002', N'Devmaster', 19)


----------------------------------------------------------
-------------------Truy vấn-------------------------------
select Tên_Cột, ... from Tên_Bảng
where Mệnh_đề_đk
group by Tên_Cột
having Mệnh_đề_đk
order by Tên_Cột

select 'Devmaster' as 'C1', N'25 VNP' as 'C2'

--Hiển thị tất cả các cột
select * from [dbo].[KHOA]
go
--Hiển thị các cột được chọn
select MaSV, Name, Age from [dbo].[SINHVIEN]
go

--Join/Inner join: Lấy phần chung 2 bảng
--left join: Lấy nửa trái và phần chung của 2 bảng
--right join: Lấy nửa phải và phần chung 2 bảng
--full join: Lấy tất cả dữ liệu của 2 bảng
insert into MON(MaKH, TenKH, SoTiet) values
('IT', N'Công nghệ thông tin'),
('AH', N'Anh học'),
('TH', N'Trung Quốc học')

select * from MON as MH
inner join DIEM as D on MH.MaKH = D.MaMH
select * from DIEM

select * from MON as MH
left join DIEM as D on MH.MaKH = D.MaMH
select * from DIEM

select * from MON as MH
full join DIEM as D on MH.MaKH = D.MaMH
select * from DIEM

--select vói điều kiện và sắp xếp
select * from DIEM

select * from DIEM where DIEM > 6 order by DIEM

select * from DIEM where DIEM between 6 and 9

select * from DIEM where DIEM in (5, 9)

select * from KHOA where TenKH like 'C%'
select * from KHOA where TenKH like '_n%'
select * from KHOA where TenKH like '[a-d]n%'
select * from KHOA where TenKH like '[^c-f]n%'

--Distinct
select distinct SoTiet from MON

