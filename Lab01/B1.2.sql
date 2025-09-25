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