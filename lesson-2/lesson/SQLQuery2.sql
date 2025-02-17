use hometask1

-- DDL Data definition language

/* common data types*/

-- Integer
-- TINYINT
-- SMALLINT = -32000 +32000
-- INT = 2B
-- BIGINT

CREATE TABLE test
(
	id TINYINT
);

-- DECIMALL

CREATE tABLE product
(
	price decimal(10, 2)
);

insert into product
values (874483.3234), (3724786);

select * from product;

-- FLOAT
drop table if exists product
CREATE tABLE product
(
	price float
);

insert into product
values (874483.376477676234), (3.724786);

-- STRING

-- CHAR(), VARCHAR(), NCHAR(),  NVARCHAR(), TEXT , NTEXT

-- VARCHAR(8000) MAX


-- DATE AND TIME 

-- 2020-12-12 - DATE = YYYY-MM-DD
-- 22:15:89 - TIME  = HH:MM:SS
-- BOTH - DATETIME = YYYY-MM-DD HH:MM:SS

DROP TABLE IF EXISTS person
CREATE TABLE person
(
	name varchar(100),
	birth_date DATE
);

insert into person
select 'alex', '2008-3-5'

select * from person

-- time 

create table nimadur4
(
	times time
);

insert into nimadur4
values ('12:22:00')

select * from nimadur4

-- date time

create table numa
(
	datestime datetime
);

insert into numa
select GETDATE()

select * from numa

-- [jhevfjv bjhabjv] ikkita narsa chiqaradi, yani soznui
-- GETDATE() BU HOZIRNI QAYTARADI

SELECT GETDATE() AS sana
UNION ALL
SELECT GETUTCDATE()


-- DATETIME2 .MILLI SEKUNDLAR

-- GUID

CREATE TABLE guid1
(
	id UNIQUEIDENTIFIER,
	name VARCHAR(50),

);

SELECT NEWID()

INSERT INTO guid1
values (newid(), 'Salom');

select * from guid1;

------------------------------

/* MALUMOTLAR BAZASIDA RASMLAR JOYLASH*/

DROP TABLE IF EXISTS products
CREATE TABLE products
(
	id INT PRIMARY KEY,
	name VARCHAR(50),
	photo_path varchar(50)
);

DROP TABLE IF EXISTS products;
GO

CREATE TABLE products
(
	id INT PRIMARY KEY,
	name VARCHAR(50),
	photo_data VARBINARY(MAX)
);
GO

INSERT INTO products (id, name, photo_data)
SELECT 1, 'APPLE', BulkColumn
FROM OPENROWSET(
	BULK 'C:\\Users\\Mezon\\OneDrive\\Desktop\\CODES\\SQL-homeworks\\lesson-2\\lesson\\OIP.jpeg', 
	SINGLE_BLOB
) AS image_file;
GO


select * from products

select @@servername as mine

----------------------

create table file_storage
(
	file_id int primary key identity,
	file_name nvarchar(100),
	file_type nvarchar(50),
	file_data varbinary(max)
);

insert into file_storage(file_name, file_type, file_data)
select 'words', '.docx', * from openrowset(
	bulk 'C:\Users\Mezon\OneDrive\Desktop\CODES\SQL-homeworks\lesson-2\lesson\OIP.jpeg', SINGLE_BLOB
) AS NIMADUR;

SELECT * FROM FILE_STORAGE


-------------------

Select * from openrowset(
	BULK 'C:\Users\Mezon\OneDrive\Desktop\CODES\SQL-homeworks\lesson-2\lesson\ID,NAME.txt', SINGLE_CLOB
) as something;

drop table if exists employee
CREATE TABLE employee
(
	id int,
	name varchar(100)
);

bulk insert employee
from 'C:\Users\Mezon\OneDrive\Desktop\CODES\SQL-homeworks\lesson-2\lesson\nimadur.csv'
with (
	firstrow=2,
	fieldterminator=',',
	rowterminator='\n'
)

select * from employee

-- DROP VS DELETE VS TRUNCATE


DELETE FROM employee WHERE id = 9; -- Bunda biz condition bera olamiz
TRUnCATE TABLE employee;

DROP TABLE employee;