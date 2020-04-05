CREATE DATABASE LABA1	--������� ���� ������ LABA1
GO

CREATE TABLE S	--������� ������� �������, ��� ��������, ����� � ����� �������� �����������, � ���� ����� ��������� �������� �� 1 �� 3
(
	SID int primary key  NOT NULL,
	SName char(20) unique not null,
	SCity char(20) unique not null,
	Address char(50) unique,
	Risk int check(Risk > 0 and Risk < 4)
)
GO

create table P	--������� ������� �����������, ��� ��������, ����� � ���� �������� �����������, � ��� ��������� ������ ������������� ��������
(
	PID int primary key not null,
	PName char(20) unique not null,
	PCity char(20) unique not null,
	Color char(20) unique,
	Weight int check (Weight > 0) 
)
go

create table SP	--������� ������� ��������, ��� �������� � ���� �������� ������ ������������� ��������. ������� ������� � ��������� S � P �� �� id
(
	SPID int primary key not null, 
	SID int,
	PID int ,
	Quantity int check (Quantity > 0),
	Price float check (Price >0),
	ShipDate date not null,
	foreign key (SID) references S(SID) on delete cascade,
	foreign key (PID) references P(PID) on delete cascade,
)

select SP.SPID
from SP, P
where SP.PID=P.PID and SP.Quantity*P.Weight <=1500;