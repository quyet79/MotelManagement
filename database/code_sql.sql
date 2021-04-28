USE MASTER
GO

IF OBJECT_ID('MotelManagement') IS NOT NULL
	DROP DATABASE MotelManagement
GO
CREATE DATABASE MotelManagement
GO

USE MotelManagement
GO

----------------------------Department
IF OBJECT_ID('Department') IS NOT NULL
	DROP TABLE Department
GO
CREATE TABLE Department
(
	Id		int identity(1,1) NOT NULL PRIMARY KEY,
	Name	nvarchar(50) NOT NULL
)
GO

DELETE FROM Department
go
INSERT Department VALUES ('Manager')
INSERT Department VALUES ('Accountant')
INSERT Department VALUES ('Departmantal Staff')
INSERT Department VALUES ('Receptionist')

SELECT * FROM Department
GO

---------------------------------------------------
IF OBJECT_ID('Staff') IS NOT NULL
	DROP TABLE Staff
GO
CREATE TABLE Staff
(
	Id				VARCHAR(10) NOT NULL PRIMARY KEY,
	Name			NVARCHAR(50) NOT NULL,
	Password		VARCHAR(50) NOT NULL,
	Dob				DATE NOT NULL,
	Gender			BIT NOT NULL,
	Address			NVARCHAR(50) NOT NULL,
	Phone			VARCHAR(20) NOT NULL,
	Email			VARCHAR(50) NOT NULL,
	Avatar			VARCHAR(50),
	DepartmentId	int NOT NULL,
	unique(Phone),
	unique(Email),
	foreign key (DepartmentId) references department(id) on update cascade
)
GO

DELETE FROM Staff
INSERT Staff VALUES ('PH01', N'Nguyễn Nhật Hùng', 'hungnn', '1998-03-05', 1, N'Hà Nội', '0984111111', 'hungnnph09719@fpt.edu.vn', DEFAULT, 1)
INSERT Staff VALUES ('PH02', N'Hứa Mạnh Hùng', 'hunghm', '2000-03-05', 1, N'Hà Nội', '0984111112', 'hunghmph09808@fpt.edu.vn', DEFAULT, 1)
INSERT Staff VALUES ('PH03', N'Nguyễn Hữu Quyết', 'quyetnh', '2001-03-05', 1, N'Hà Nội', '0984111113', 'quyetnhph12037@fpt.edu.vn', DEFAULT, 3)

INSERT Staff VALUES ('PH04', N'Nguyễn Quốc Lập', 'lapnq', '2002-11-12', 1, N'Hà Nội', '0984111114', 'lapnqph14889@fpt.edu.vn', DEFAULT, 4)
INSERT Staff VALUES ('PH05', N'Hoàng Tấn Lộc', 'locht', '2001-08-13', 1, N'Hà Nội', '0984111115', 'lochtph15557@fpt.edu.vn', DEFAULT, 2)
INSERT Staff VALUES ('PH06', N'Trương Tấn Thành', 'thanhtt', '2000-05-09', 1, N'Hà Nội', '0984111116', 'thanhttph15752@fpt.edu.vn', DEFAULT, 4)
INSERT Staff VALUES ('PH07', N'Ngô Duy Nam ', 'namnd', '1999-06-05', 1, N'Hà Nội', '0984111117', 'namndph15819 @fpt.edu.vn', DEFAULT, 2)
INSERT Staff VALUES ('PH08', N'Bùi Minh Hiển ', 'hienbm', '2001-12-05', 1, N'Hà Nội', '0984111118', 'hienbmph15983@fpt.edu.vn', DEFAULT, 4)
INSERT Staff VALUES ('PH09', N'Đỗ Thị Huế ', 'huedt', '2001-03-23', 0, N'Hà Nội', '0984111119', 'huedtph16848@fpt.edu.vn', DEFAULT, 4)
INSERT Staff VALUES ('PH10', N'Phạm Anh Tú ', 'tupa', '2001-10-05', 1, N'Hà Nội', '0984111120', 'tupaph17044@fpt.edu.vn', DEFAULT, 3)

SELECT * FROM Staff
GO

---------------------------------------------------------MAXACNHAN
IF OBJECT_ID('Verify') IS NOT NULL
	DROP TABLE Verify
GO
CREATE TABLE Verify
(
	Id			INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Code		VARCHAR(20) NOT NULL,
	StaffId		VARCHAR(10) NOT NULL,
	CreateAt	DATETIME NOT NULL DEFAULT GETDATE()
	FOREIGN KEY (StaffId) REFERENCES Staff(Id) ON UPDATE CASCADE
)
GO
DELETE FROM Verify
DBCC CHECKIDENT ('Verify', RESEED, 0)

--------------------------------------------ServiceType
IF OBJECT_ID('ServiceType') IS NOT NULL
	DROP TABLE ServiceType
GO
CREATE TABLE ServiceType
( 
	Id				INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name			NVARCHAR(50) NOT NULL,
)
GO

DELETE FROM ServiceType
DBCC CHECKIDENT ('ServiceType', RESEED, 0)
go
insert ServiceType values ('Food and beverages')
insert ServiceType values ('Business services')
insert ServiceType values ('Concierge service')
insert ServiceType values ('Transportation')
insert ServiceType values ('Family and Pets')
insert ServiceType values ('Sport')

select * from ServiceType

--------------------------------------------Service
IF OBJECT_ID('Service') IS NOT NULL
	DROP TABLE Service
GO
CREATE TABLE Service
( 
	Id				INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name			NVARCHAR(50) NOT NULL,
	Price			MONEY NOT NULL CHECK(Price >= 0),
	Describe		NVARCHAR(1000),
	Status			BIT NOT NULL DEFAULT 1,
	ServiceTypeId	int not null,
	foreign key (ServiceTypeId) references ServiceType(id) on update cascade
)
GO

DELETE FROM Service
DBCC CHECKIDENT ('Service', RESEED, 0)
INSERT Service VALUES ('Breakfast restaurant', 100000, 'we have a large selection of breads, cheese, cold cuts, fruit and vegetables, yoghurt, eggs, breakfast products as well as various juices and, of course, tea and coffee. Several of our items in the selection have ''keyhole'' certification (Nordic nutrition labelling).', Default, 1)
insert service values ('Breakfast "To Go"', 120000, 'If you are one of the early risers and need to get out the door early, we offer a breakfast "To Go". Breakfast "To Go" must be ordered at the hotel''s reception at the latest 12 noon the day before.', Default, 1)
insert service values ('Ristorante L’appetito', 120000, 'Ristorante L''Appetito is the hotel''s restaurant, which offers Italian food experiences. At L''Appetito you are guaranteed an unforgettable taste experience, outstanding service as well as professional dishes with clean lines. The restaurant''s menu is adorned with outstanding Italian specialities. The well-prepared dishes are made with the basis in traditional Italian cuisine as well as the season''s best raw ingredients and served with Italian quality wines.', Default, 1)

insert service values ('Business Lounge', 150000, 'In a busy working day, you may well need to have a quiet place where you can sit and work, read the day''s newspapers, watch TV or concentrate on a good book.In the hotel''s business lounge, which is located to the right of the hotel''s reception, you will find a quiet environment with office space, relaxation area, national and international newspapers as well as computers and printers that can be freely used.', default, 2)
insert service values ('Fax and Photocopying', 150000, 'If you need assistance to send a fax, or you need a few documents photocopied, our professional reception staff are ready to help you. The only thing you need to do is enquire at the hotel''s reception and we will take care of the rest.', default, 2)

insert service values ('Car and bicycle hire', 200000, 'At Imperial Hotel we are always helpful when it comes to car and bicycle hire. If you need a car during your stay, we would like to help you book it. Please enquire at reception and we will take care of it for you. If, on the other hand, you would rather cycle around the city, we have our own bicycles that you can hire on a daily basis.The price is DKK 150 per day and if you require, lights and bicycle helmet can be included so safety is at its best.', default, 3)
insert service values ('Restaurant experiences', 50000, 'If you are in doubt about where to eat during your visit at Imperial Hotel, do not fear. By contacting the hotel reception our competent personnel can guide you to many exciting and great "hidden" eateries. Of course, we can help you to reserve a table and give you directions on a map.If you prefer more of the night life and a couple of drinks out on the town, we are just as well-prepared. Contact the hotel''s reception for a broad selection of suggestions for cocktail bars and nightclubs.', default, 3)
insert service values ('Attractions and Guide to Copenhagen', 100000, 'Copenhagen is full of attractions and special places that are a "must" to experience. If you are in doubt about what must be seen, and where they are located, please feel free to contact us at the reception. Here our extremely service-minded personnel are ready with maps, instructions and good advice.', default, 3)

insert service values ('From Copenhagen Airport', 300000, 'Imperial Hotel is easy to get to from Copenhagen Airport in Kastrup.You have several options for easy transport.', default, 4)
insert service values ('By train', 200000, 'At the arrivals terminal, Terminal 3, just continue walking straight on when you step into the arrivals hall. 100 metres ahead you will find the escalator that takes you down to the subterranean platforms. The trains depart every 10-15 minutes depending on the time of the day.', default, 4)
insert service values ('By Metro', 120000, 'At the arrivals terminal, Terminal 3, just continue walking straight on when you step into the arrivals hall. 100 metres ahead you will find the escalator that takes you up to the Metro platform.', default, 4)
insert service values ('By taxi', 150000, 'Taxis are available outside of the arrivals terminal, Terminal 3. It takes 15-20 minutes by taxi and will cost about DKK 275 - DKK 300 depending on the day of the week and the time. ', default, 4)
insert service values ('Public transport in Copenhagen', 200000, 'The City Pass is valid for travel by bus, train and the Metro. The City Pass can be purchased with a validity of 24 hours and72 hours and includes unlimited use of the buses, trains and Metro - including to and from the airport.The City Pass is available for adults and children under the age of 16.', default, 4)
insert service values ('Transfer & limo service', 300000, 'If you would like a private transfer or sight-seeing, please contact the hotel directly via the e-mail below.', default, 4)


insert service values ('Family-friendly', 200000, 'When you bring your family along to Imperial Hotel, we make sure there is something for all ages. We have the option for family rooms where the whole family can be gathered in one room, as well as the option for connecting rooms with a private door between the rooms if the children are a little older. At check-in, all younger children are given a "kid''s bag" which contains a colouring book and crayons.For the tiny tots, we have high chairs in the restaurant and the option for a cot in the room.', default, 5)
insert service values ('Dog', 100000, 'Dogs are most welcome at Imperial Hotel. We prioritise your dog''s experience as highly as that of our guests.Therefore, at Imperial Hotel we have a number of rooms specially suitable for guests who are accompanied by man''s best friend. In addition to the standard furnishings, the room contains water and food bowls as well as a small snack package in the form of treats.Dogs feel better when they are not left alone in the room. Therefore, they are allowed everywhere in the hotel except for the breakfast and dinner restaurant.If you bring your dog along, please remember to check-mark the field "Dog in the room" under "Special requests" when booking online on our website.To keep the hotel clean and tidy for all guests, we charge a further DKK 200 per night for having your dog with you.', default, 5)

insert service values ('Gym', 200000, 'Take care of your health', default, 6)

SELECT * FROM Service
GO

-----------------------------------------------------TIENNGHI
IF OBJECT_ID('Convenient') IS NOT NULL
	DROP TABLE Convenient
GO
CREATE TABLE Convenient
( 
	Id	INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name	NVARCHAR(50) NOT NULL
)
GO

DELETE FROM Convenient
DBCC CHECKIDENT ('Convenient', RESEED, 0)
INSERT Convenient VALUES ('Single bed')
INSERT Convenient VALUES ('Double bed')
INSERT Convenient VALUES ('Queen size bed')
INSERT Convenient VALUES ('King size bed')
INSERT Convenient VALUES ('Super King size bed')
INSERT Convenient VALUES ('Western King bed')
INSERT Convenient VALUES ('Extra bed')

INSERT Convenient VALUES ('Wi-Fi')
INSERT Convenient VALUES ('Air cooling')
INSERT Convenient VALUES ('TV')
INSERT Convenient VALUES ('Safe')
INSERT Convenient VALUES ('Hairdryer')
INSERT Convenient VALUES ('Shampoo, conditioner, showergel and bodylotion')
INSERT Convenient VALUES ('Bathtub with a shower')
INSERT Convenient VALUES ('Desk and chair')
INSERT Convenient VALUES ('Ironing kit')
INSERT Convenient VALUES ('Minibar')
INSERT Convenient VALUES ('Bathrobe and slippers')
INSERT Convenient VALUES ('Balcony')
INSERT Convenient VALUES ('Seating area')
INSERT Convenient VALUES ('Beds for up to 4 people')
INSERT Convenient VALUES ('Babycot')
INSERT Convenient VALUES ('TV channels for children')
INSERT Convenient VALUES ('Allergy-friendly duvets and pillows')
INSERT Convenient VALUES ('Wooden floors')

GO
SELECT * FROM Convenient

------------------------------------------------PriceType
IF OBJECT_ID('PriceType') IS NOT NULL
	DROP TABLE PriceType
GO
CREATE TABLE PriceType
( 
	Id		INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name	NVARCHAR(50) NOT NULL
)
GO
DELETE FROM PriceType
DBCC CHECKIDENT ('PriceType', RESEED, 0)
INSERT PriceType VALUES (N'Hour')
INSERT PriceType VALUES (N'Overnight')
INSERT PriceType VALUES (N'Day')
SELECT * FROM PriceType
GO

--------------------------------------------LOAIPHONG
IF OBJECT_ID ('RoomType') IS NOT NULL
DROP TABLE RoomType
GO
CREATE TABLE RoomType
(
	Id			int identity(1,1) NOT NULL PRIMARY KEY,
	Name		NVARCHAR(50) NOT NULL,
	Describe	NVARCHAR(500) 
)
GO

DELETE FROM RoomType
DBCC CHECKIDENT ('RoomType', RESEED, 0)
INSERT RoomType VALUES ('Standard', 'Our Standard Rooms are the ideal choice for you who want a price-friendly room with plenty of daylight. We have made sure to create a healthy sleeping environment, since you can adjust the temperature on the air cooling and block the light from street lamps with thick floor to ceiling curtains')
INSERT RoomType VALUES ('Superior', 'Our Superior Rooms are the ideal choice for you who want plenty of daylight and space that makes rooms for an extra bed.')
INSERT RoomType VALUES ('Superior Deluxe', 'Our bright and spacious Superior Deluxe Rooms are the obvious choice for you who appreciate a view of the city life and rooftops in the sky-high air.')
INSERT RoomType VALUES ('Executive', 'Our bright Executive Rooms are ideal for you who want to experience an exclusive time capsule, which hides modern artisanship behind a retro look from the 1950s.')
INSERT RoomType VALUES ('Junior Suites', 'Our bright and spacious Junior Suites are ideal for you who want to enjoy a luxurious stay with a wide view to the trendy district Vesterbro – and, of course')
INSERT RoomType VALUES ('Family Rooms', 'We have made sure that you can wake up next to your family or friends, so that you can enjoy as much quality time together as possible during your stay in Copenhagen.')
INSERT RoomType VALUES ('Friendly Rooms', 'As a guest at Imperial Hotel, you can enjoy an allergy-friendly and calm sleep, since we offer allergy-friendly rooms with wooden floors and allergy-friendly blankets and pillows.')

GO
SELECT * FROM RoomType

---------------------------------------------PHONG
IF OBJECT_ID ('Room') IS NOT NULL
	DROP TABLE Room
GO
CREATE TABLE Room
(
	Number		VARCHAR(10) NOT NULL PRIMARY KEY,
	Capacity	INT NOT NULL CHECK(Capacity > 0),
	Status		BIT NOT NULL DEFAULT 0,
	RoomTypeId		int NOT NULL
	FOREIGN KEY (RoomTypeId) REFERENCES RoomType(Id) ON UPDATE CASCADE
)
GO

select * from RoomType

DELETE FROM Room
INSERT Room VALUES ('101', 4, DEFAULT, 1)
INSERT Room VALUES ('102', 2, DEFAULT, 1)
INSERT Room VALUES ('103', 4, DEFAULT, 1)
INSERT Room VALUES ('104', 2, DEFAULT, 1)
INSERT Room VALUES ('105', 4, DEFAULT, 1)
INSERT Room VALUES ('106', 2, DEFAULT, 1)
INSERT Room VALUES ('107', 4, DEFAULT, 1)
INSERT Room VALUES ('108', 2, DEFAULT, 1)

INSERT Room VALUES ('201', 4, DEFAULT, 2)
INSERT Room VALUES ('202', 2, DEFAULT, 2)
INSERT Room VALUES ('203', 4, DEFAULT, 2)
INSERT Room VALUES ('204', 2, DEFAULT, 2)
INSERT Room VALUES ('205', 4, DEFAULT, 2)
INSERT Room VALUES ('206', 2, DEFAULT, 2)
INSERT Room VALUES ('207', 4, DEFAULT, 2)
INSERT Room VALUES ('208', 2, DEFAULT, 2)

INSERT Room VALUES ('301', 4, DEFAULT, 3)
INSERT Room VALUES ('302', 2, DEFAULT, 3)
INSERT Room VALUES ('303', 2, DEFAULT, 3)
INSERT Room VALUES ('304', 4, DEFAULT, 3)
INSERT Room VALUES ('305', 2, DEFAULT, 3)
INSERT Room VALUES ('306', 4, DEFAULT, 3)
INSERT Room VALUES ('307', 2, DEFAULT, 3)
INSERT Room VALUES ('308', 4, DEFAULT, 3)

INSERT Room VALUES ('401', 4, DEFAULT, 4)
INSERT Room VALUES ('402', 4, DEFAULT, 4)
INSERT Room VALUES ('403', 4, DEFAULT, 4)
INSERT Room VALUES ('404', 4, DEFAULT, 4)
INSERT Room VALUES ('405', 4, DEFAULT, 4)
INSERT Room VALUES ('406', 4, DEFAULT, 4)
INSERT Room VALUES ('407', 4, DEFAULT, 4)
INSERT Room VALUES ('408', 4, DEFAULT, 4)

INSERT Room VALUES ('501', 4, DEFAULT, 5)
INSERT Room VALUES ('502', 2, DEFAULT, 5)
INSERT Room VALUES ('503', 4, DEFAULT, 5)
INSERT Room VALUES ('504', 2, DEFAULT, 5)
INSERT Room VALUES ('505', 4, DEFAULT, 5)
INSERT Room VALUES ('506', 2, DEFAULT, 5)
INSERT Room VALUES ('507', 4, DEFAULT, 5)
INSERT Room VALUES ('508', 2, DEFAULT, 5)

INSERT Room VALUES ('601', 4, DEFAULT, 6)
INSERT Room VALUES ('602', 6, DEFAULT, 6)
INSERT Room VALUES ('603', 8, DEFAULT, 6)
INSERT Room VALUES ('604', 4, DEFAULT, 6)
INSERT Room VALUES ('605', 6, DEFAULT, 6)
INSERT Room VALUES ('606', 8, DEFAULT, 6)
INSERT Room VALUES ('607', 4, DEFAULT, 6)
INSERT Room VALUES ('608', 6, DEFAULT, 6)

INSERT Room VALUES ('701', 4, DEFAULT, 7)
INSERT Room VALUES ('702', 4, DEFAULT, 7)
INSERT Room VALUES ('703', 4, DEFAULT, 7)
INSERT Room VALUES ('704', 4, DEFAULT, 7)
INSERT Room VALUES ('705', 4, DEFAULT, 7)
INSERT Room VALUES ('706', 4, DEFAULT, 7)
INSERT Room VALUES ('707', 4, DEFAULT, 7)
INSERT Room VALUES ('708', 4, DEFAULT, 7)

GO
SELECT * FROM Room

---------------------------------------Price
IF OBJECT_ID ('Price') IS NOT NULL
DROP TABLE Price
GO
CREATE TABLE Price
(
	ID				INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	RoomTypeId		int NOT NULL,
	PriceTypeId		INT NOT NULL,
	PriceValue		MONEY NOT NULL CHECK(PriceValue > 0),
	UNIQUE(RoomTypeId, PriceTypeId),
	FOREIGN KEY (RoomTypeId) REFERENCES RoomType(Id),
	FOREIGN KEY (PriceTypeId) REFERENCES PriceType(Id)
)
GO

select * from RoomType
select * from PriceType

DELETE FROM Price
DBCC CHECKIDENT ('Price', RESEED, 0)
INSERT Price VALUES (1, 1, 50000)
INSERT Price VALUES (1, 2, 70000)
INSERT Price VALUES (1, 3, 60000)

INSERT Price VALUES (2, 1, 70000)
INSERT Price VALUES (2, 2, 90000)
INSERT Price VALUES (2, 3, 80000)

INSERT Price VALUES (3, 1, 80000)
INSERT Price VALUES (3, 2, 100000)
INSERT Price VALUES (3, 3, 90000)

INSERT Price VALUES (4, 1, 100000)
INSERT Price VALUES (4, 2, 120000)
INSERT Price VALUES (4, 3, 110000)

INSERT Price VALUES (5, 1, 110000)
INSERT Price VALUES (5, 2, 130000)
INSERT Price VALUES (5, 3, 120000)

INSERT Price VALUES (6, 1, 120000)
INSERT Price VALUES (6, 2, 140000)
INSERT Price VALUES (6, 3, 130000)

INSERT Price VALUES (7, 1, 130000)
INSERT Price VALUES (7, 2, 150000)
INSERT Price VALUES (7, 3, 140000)

SELECT * FROM Price
GO

--------------------------------------------Room_Convenient
IF OBJECT_ID('Room_Convenient') IS NOT NULL
	DROP TABLE Room_Convenient
GO
CREATE TABLE Room_Convenient
(
	Id				INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	RoomNumber		VARCHAR(10) NOT NULL,
	ConvenientId	INT NOT NULL,
	Amount			INT NOT NULL check (Amount > 0),
	Status			NVARCHAR(50) NOT NULL DEFAULT 'Normal'
	UNIQUE (RoomNumber, ConvenientId),
	FOREIGN KEY (RoomNumber) REFERENCES Room(Number),
	FOREIGN KEY (ConvenientId) REFERENCES Convenient(Id),
)
GO

DELETE FROM Room_Convenient
DBCC CHECKIDENT ('Room_Convenient', RESEED, 0)

GO
SELECT * FROM Room_Convenient

---------------------------------------------KHACHHANG
IF OBJECT_ID('Customer') IS NOT NULL
	DROP TABLE Customer
GO
CREATE TABLE Customer
(
	Id			INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Name		NVARCHAR(100) NOT NULL,
	IdCard		VARCHAR(20) NOT NULL,
	Phone		VARCHAR(20) NOT NULL,
	Gender		BIT NOT NULL,
	Address		NVARCHAR(50) NOT NULL,
	Nation		NVARCHAR(50) NOT NULL
	UNIQUE(IdCard),
	UNIQUE(Phone)
)
GO

DELETE FROM Customer
DBCC CHECKIDENT ('Customer', RESEED, 0)
INSERT Customer VALUES (N'Trần Thị Quỳnh', '122122121', '0987654001', 0, N'Hà Nội', N'Việt Nam')
INSERT Customer VALUES (N'Trần Ngọc Hải', '122122122', '0987654002', 0, N'Hồ Chí Minh', N'Việt Nam')
INSERT Customer VALUES (N'Đỗ Trà My', '122122123', '0987654003', 1, N'Đà Nẵng', N'Việt Nam')
INSERT Customer VALUES (N'Nguyễn Bá Quang', '122122124', '0987654004', 1, N'Hải Phòng', N'Việt Nam')
INSERT Customer VALUES (N'Nguyễn Bảo Linh', '122122125', '0987654005', 0, N'Hải Dương', N'Việt Nam')
INSERT Customer VALUES (N'Vũ Thị Thu', '122122126', '0987654006', 0, N'Bắc Nih', N'Việt Nam')
INSERT Customer VALUES (N'Trần Thị Ngọc Diệp', '122122127', '0987654007', 0, N'Hà Nam', N'Việt Nam')
INSERT Customer VALUES (N'Nguyễn Việt Anh', '122122128', '0987654008', 1, N'Quảng Ninh', N'Việt Nam')
INSERT Customer VALUES (N'Nông Thị Ngoan', '122122129', '0987654009', 0, N'Bắc Giang', N'Việt Nam')
INSERT Customer VALUES (N'Ngô Hà Vy', '122122130', '0987654010', 0, N'Hà Nội', N'Việt Nam')

INSERT Customer VALUES (N'Vũ Trọng Huy', '122122131', '0987654011', 1, N'Bắc Kạn', N'Việt Nam')
INSERT Customer VALUES (N'Vũ Hoàng Phong', '122122132', '0987654012', 1, N'Bến Tre', N'Việt Nam')
INSERT Customer VALUES (N'Đinh Văn Kiên', '122122133', '0987654013', 1, N'Thái Bình', N'Việt Nam')
INSERT Customer VALUES (N'Phạm Anh Hùng', '122122134', '0987654014', 1, N'Cần Thơ', N'Việt Nam')
INSERT Customer VALUES (N'Lê Thuỷ Tiên', '122122135', '0987654015', 0, N'Khánh Hòa', N'Việt Nam')
INSERT Customer VALUES (N'Phan Văn Ký', '122122136', '0987654016', 1, N'Lâm Đồng', N'Việt Nam')
INSERT Customer VALUES (N'Lê Thu Trà ', '122122137', '0987654017', 0, N'Nam Định', N'Việt Nam')
INSERT Customer VALUES (N'Chu Văn An', '122122138', '0987654018', 1, N'Ninh Thuận', N'Việt Nam')
INSERT Customer VALUES (N'Lê Thị Dung', '122122139', '0987654019', 0, N'Phú Thọ', N'Việt Nam')
INSERT Customer VALUES (N'Lê Anh Quân', '122122140', '0987654020', 1, N'Hà Tĩnh', N'Việt Nam')

GO
SELECT * FROM Customer

-------------------------------------Invoice
IF OBJECT_ID('Invoice') IS NOT NULL
	DROP TABLE Invoice
GO
CREATE TABLE Invoice
(
	Id				INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	RentDate		DATETIME NOT NULL DEFAULT GETDATE(),
	PayDate			DATETIME,
	Total			MONEY NOT NULL CHECK (Total >= 0),
	Status			BIT NOT NULL DEFAULT 0,
	PriceTypeId		INT NOT NULL,
	CustomerId		INT NOT NULL,
	StaffId			VARCHAR(10) NOT NULL
	FOREIGN KEY (PriceTypeId) REFERENCES PriceType(Id),
	FOREIGN KEY (CustomerId) REFERENCES Customer(Id),
	FOREIGN KEY (StaffId) REFERENCES Staff(Id)
)
GO

DELETE FROM Invoice
DBCC CHECKIDENT ('Invoice', RESEED, 0)

----------------------------------------HDDICHVU
IF OBJECT_ID('ServiceInvoice') IS NOT NULL
	DROP TABLE ServiceInvoice
GO
CREATE TABLE ServiceInvoice
(
	ID				INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	InvoiceId		INT NOT NULL,
	ServiceId		INT NOT NULL,
	Amount			INT NOT NULL CHECK(Amount > 0)
	UNIQUE(InvoiceId, ServiceId),
	FOREIGN KEY (InvoiceId) REFERENCES Invoice(Id),
	FOREIGN KEY (ServiceId) REFERENCES Service(Id)	
)
GO
DELETE FROM ServiceInvoice
DBCC CHECKIDENT ('ServiceInvoice', RESEED, 0)

--------------------------------------------HDPHONG
IF OBJECT_ID('RoomInvoice') IS NOT NULL
	DROP TABLE RoomInvoice
GO
CREATE TABLE RoomInvoice
(
	ID				INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	InvoiceId		INT NOT NULL,
	RoomNumber		VARCHAR(10) NOT NULL
	UNIQUE(InvoiceId, RoomNumber),
	FOREIGN KEY (InvoiceId) REFERENCES Invoice(Id),
	FOREIGN KEY (RoomNumber) REFERENCES Room(Number)
)
GO
DELETE FROM RoomInvoice
DBCC CHECKIDENT ('RoomInvoice', RESEED, 0)

-----------------------------------------sp_thanhtoan
if OBJECT_ID('sp_thanhtoanhd') is not null
drop proc sp_thanhtoanhd
go
create proc sp_thanhtoanhd @mahd int, @malg int
as
begin
begin try
begin tran
	update HOADON set NGAYTT = getdate() where MAHD = @mahd
	declare @gia money, @tienphong money, @tiendv money, @tongNgayThue int, @tongGioThue int

	select @gia =  sum(dongia) from hoadon a
						join HDPHONG b on a.MAHD = b.MAHD
						join PHONG c on b.SOPHONG = c.SOPHONG
						join LOAIPHONG d on c.MALP = d.MALP
						join LOAIPHONG_LOAIGIA e on d.MALP = e.MALP
						where a.MAHD = @mahd and e.MALG = @malg
	select @tongNgayThue = DATEDIFF(day, ngaythue, ngaytt) from hoadon where MAHD = @mahd
	select @tongGioThue = DATEDIFF(HOUR, ngaythue, ngaytt) from hoadon where MAHD = @mahd
	if @malg = 1
	begin
		if @tongGioThue <= 2
		begin
			select @tienphong = 2 * @gia
		end
		else
		begin
			select @tienphong = 2 * @gia + (@tongGioThue - 2) * 20000
		end
	end
	else
	begin
		if @malg = 2
		begin
			declare @giotre_quadem int
			select @giotre_quadem = DATEPART(hour, ngaytt) from hoadon where MAHD = @mahd
			if @giotre_quadem >= 10 and @tongNgayThue > 0
			begin
				select @tienphong = @gia + (@giotre_quadem - 10) * 20000
			end
			else
			begin
				select @tienphong = @gia
			end
		end
		else
		begin 
			if @malg = 3
			begin
				if @tongNgayThue < 2
				begin
					select @tienphong = @gia
				end
				else
				begin
					select @tienphong = @tongNgayThue * @gia
				end
			end
		end
	end
	if (select count(*) from HDDICHVU where MAHD = @mahd) > 0
	begin
		select @tiendv = sum(a.SOLUONG * b.DONGIA) from HDDICHVU a
					join DICHVU b on a.MADV = b.MADV
					where MAHD = @mahd
					group by MAHD
	end
	else
	begin
		select @tiendv = 0
	end

	select @tienphong, @tiendv
	declare @tongtien money

	update HOADON
	set TONGTIEN = (@tienphong + @tiendv), TRANGTHAI = 1 where MAHD = @mahd
		
	update phong
	set TRANGTHAI = 0
	where phong.SOPHONG in (select sophong from HDPHONG 
								where phong.SOPHONG = HDPHONG.SOPHONG and MAHD = @mahd)
commit tran
end try
begin catch
	rollback tran
end catch
end

----------------------------sp_xoahdp
if OBJECT_ID('sp_xoahdp') is not null
	drop proc sp_xoahdp
go
create proc sp_xoahdp @mahd int
as
begin
begin tran
begin try
	delete from HDPHONG where MAHD = @mahd
	update phong
	set TRANGTHAI = 0
	where phong.SOPHONG in (select SOPHONG from HDPHONG where MAHD = @mahd)
	commit tran
end try
begin catch
	rollback tran
end catch
end
go

----------------------------------sp_xoahddv

if OBJECT_ID('sp_xoahddv') is not null
	drop proc sp_xoahddv
go
create proc sp_xoahddv @mahd int
as
begin
begin tran
begin try
	delete from HDDICHVU where MAHD = @mahd
	commit tran
end try
begin catch
	rollback tran
end catch
end
go

---------------------------------------sp_topphong
if OBJECT_ID('sp_topphong') is not null
	drop proc sp_topphong
go
create proc sp_topphong @year int, @month int
as
begin
begin tran
begin try
	select a.SOPHONG, 
		sum(case b.MALG
		when 1 then case 
			when DATEDIFF(HOUR, ngaythue, ngaytt) <= 2 then 2 * DONGIA
			else 2 * DONGIA + (DATEDIFF(HOUR, ngaythue, ngaytt) - 2) * 20000
			end
		when 2 then case 
			when DATEPART(hour, ngaytt) <= 10 and DATEDIFF(day, ngaythue, ngaytt) > 0 then DONGIA + (DATEPART(hour, ngaytt) - 10) * 20000
			else DONGIA
			end
		when 3 then case
			when DATEDIFF(day, ngaythue, ngaytt) < 2 then DONGIA
			else DATEDIFF(day, ngaythue, ngaytt) * DONGIA
			end
		end)
	as DOANHTHU
	from HDPHONG a
	join HOADON b on a.MAHD = b.MAHD
	join phong c on a.SOPHONG = c.SOPHONG
	join LOAIPHONG d on c.MALP = d.MALP
	join LOAIPHONG_LOAIGIA e on d.MALP = e.MALP
	where b.MALG = e.MALG and MONTH(ngaytt) = @month and year(ngaytt) = @year
	group by a.SOPHONG
	order by DOANHTHU desc
	commit tran
end try
begin catch
	rollback tran
end catch
end
go

exec sp_topphong 2021, 3

--------------------------------sp_topdv
if OBJECT_ID('sp_topdv') is not null
	drop proc sp_topdv
go
create proc sp_topdv @year int, @month int
as
begin
begin tran
begin try
	select TENDV, sum(soluong * dongia) as doanhthu from HOADON a
	join HDDICHVU b on a.MAHD = b.MAHD
	join DICHVU c on b.MADV = c.MADV
	where YEAR(ngaytt) = @year and MONTH(ngaytt) = @month
	group by TENDV
	order by doanhthu desc
	commit tran
end try
begin catch
	rollback tran
end catch
end

exec sp_topdv 2021, 3
------------------------------sp_sosanhdt
if OBJECT_ID ('sp_sosanhdoanhthu') is not null
	drop proc sp_sosanhdoanhthu
go
create proc sp_sosanhdoanhthu @year int
as
begin
	select MONTH(ngaytt) as thang, sum(tongtien) as tong from HOADON
	where YEAR(ngaytt) = @year
	group by MONTH(ngaytt)
end



