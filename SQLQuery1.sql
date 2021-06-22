CREATE TABLE Customer
(CustomerID nvarchar(10) primary key,
	CustomerName nvarchar(10) not null,
	CustomerSex nvarchar(2) default '��' check (CustomerSex = '��' or CustomerSex = 'Ů'),
	CustomerIDNumber nvarchar(18) not null,
	CustomerType nvarchar(10) not null,
	CustomerPhone nvarchar(11) not null,
	CustomerCreateDate date not null,
	foreign key(CustomerType) references CustomerType(TypeName),
);

CReate table Room
(RoomID nvarchar(10) primary key,
RoomType nvarchar(10) not null,
RoomPrice float not null,
RoomState nvarchar(10) default 'δ��ס' check(RoomState = '����ס' or RoomState = 'δ��ס')
);

create table Worker
(WorkerID nvarchar(10) primary key,
WorkerName nvarchar(10) not null,
WorkerSex nvarchar(2)  default '��' check (WorkerSex = '��' or WorkerSex = 'Ů') ,
WorkerIDNumber nvarchar(18) not null,
WorkerPosition nvarchar(10) not null,
WorkerPassword nvarchar(20) not null,
);

create table Manager
(ManagerID nvarchar(10) primary key,
ManagerName nvarchar(10) not null,
ManagerPassword nvarchar(20) not null,
);


create table CustomerType
(TypeName nvarchar(10) primary key,
Discount float not null,
Fine float not null,
);

create table InHistory
(InID nvarchar(10) primary key,
CustomerID nvarchar(10) not null,
CustomerType nvarchar(10) not null,
CustomerInDate date not null,
CustomerOutDate date not null,
RoomID nvarchar(10) not null,
Worker nvarchar(10) not null,
foreign key(CustomerID) references Customer(CustomerID),
foreign key(CustomerType) references CustomerType(TypeName),
foreign key(RoomID) references Room(RoomID),
foreign key(Worker) references Worker(WorkerID),
);

create table OutHistory
(OutID nvarchar(10) primary key,
CustomerID nvarchar(10) not null,
CustomerType nvarchar(10) not null,
CustomerInDate nvarchar(10) not null,
CustomerOutDate nvarchar(10) not null,
RoomID nvarchar(10) not null,
Fine float not null,
Worker nvarchar(10) not null,
foreign key(CustomerID) references Customer(CustomerID),
foreign key(CustomerType) references CustomerType(TypeName),
foreign key(RoomID) references Room(RoomID),
foreign key(Worker) references Worker(WorkerID),
);

go
create view CustomerView(�ͻ����,�ͻ�����,�ͻ��Ա�,�ͻ�����,�ͻ���ϵ��ʽ,�쿨ʱ��)
as
select CustomerID,CustomerName,CustomerSex,CustomerType,CustomerPhone,CustomerCreateDate from Customer
go

go
create view RoomView(�����,��������,����۸�)
as
select RoomID,RoomType,RoomPrice from Room
go

go
create view InHistoryView(��ס���,�ͻ����,�ͻ�����,�ͻ���סʱ��,�ͻ�Ӧ�˷�ʱ��,�����)
as
select InID,CustomerID,CustomerType,CustomerInDate,CustomerOutDate,RoomID from InHistory
go

go
create view OutHistoryView(�˷����,�ͻ����,�ͻ�����,�ͻ���סʱ��,�ͻ��˷�ʱ��,�����,��ʱ����)
as
select OutID,CustomerID,CustomerType,CustomerInDate,CustomerOutDate,RoomID,Fine from OutHistory
go

select * from Customer where CustomerName like '��%'