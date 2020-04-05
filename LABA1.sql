CREATE DATABASE LABA1	--Создаем базу данных LABA1
GO

CREATE TABLE S	--Создаем таблицу деталей, где название, город и адрес являются уникальными, а риск может принимать значения от 1 до 3
(
	SID int primary key  NOT NULL,
	SName char(20) unique not null,
	SCity char(20) unique not null,
	Address char(50) unique,
	Risk int check(Risk > 0 and Risk < 4)
)
GO

create table P	--создаем таблицу поставщиков, где название, город и цвет являются уникальными, а вес принимает только положительные значения
(
	PID int primary key not null,
	PName char(20) unique not null,
	PCity char(20) unique not null,
	Color char(20) unique,
	Weight int check (Weight > 0) 
)
go

create table SP	--Создаем таблицу поставок, где качество и цена принмают только положительные значения. Таблица связана с таблицами S и P по их id
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