create database Lab02
go

use Lab02
go

declare @Name nvarchar(50)
set @Name = N'Ngô Phương Anh'
select @Name as Ten
go

declare @Age int
set @Age = 20
select @Age as Tuoi
go

create table Employee (
	ID int primary key,
	FullName nvarchar(35),
	Gender bit,
	BirthDay datetime,
	Address nvarchar(max),
	Email varchar(50),
	Salary float
)
go

alter table Employee
add Phone varchar(20)
go

insert into Employee (ID, FullName, Gender, Birthday, Address, Email, Salary, Phone) values
(1, N'Tran Van B', 1, '1990-05-15', N'123 Ha Noi', 'b.tran@company.com', 3000000.00, '0987654321'),
(2, N'Le Thi C', 0, '1995-09-20', N'45 Hai Ba Trung, Ho Chi Minh', 'c.le@company.com', 2500000.00, '0901234567'),
(3, N'Nguyen Van D', 1, '1985-09-10', N'789 Ha Noi', 'd.nguyen@company.com', 4000000.00, '0912345678'),
(4, N'Pham Thi E', 0, '1998-11-25', N'10 Quang Trung, Da Nang', 'e.pham@company.com', 1800000.00, '0934567890'),
(5, N'Hoang Van F', 1, '1993-01-01', N'55 Cau Giay, Ha Noi', 'f.hoang@company.com', 2000000.00, '0976543210')
go

select * from Employee
go

select * from Employee where Salary > 2000000
go

select * from Employee where MONTH(BirthDay) = MONTH(GETDATE())
go

select FullName, Salary, Phone,
    DATEDIFF(year, Birthday, GETDATE()) -
    case
        when MONTH(Birthday) > MONTH(GETDATE()) or (MONTH(Birthday) = MONTH(GETDATE()) and DAY(Birthday) > DAY(GETDATE()))
        then 1
        else 0
    end as Tuoi,
    CONVERT(varchar, Birthday, 103) as BirthDay_dd_mm_yyyy
from Employee
go

select * from Employee where Address like N'%Ha Noi%'
go

update Employee set FullName = N'John' where ID = 1
go

delete from Employee where DATEDIFF(year, Birthday, GETDATE()) > 50
go

select * into Employee_Over50 from Employee
where DATEDIFF(year, Birthday, GETDATE()) > 50
go

select COUNT(*) as TotalEmployees from Employee
go