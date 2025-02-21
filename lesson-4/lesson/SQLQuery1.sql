use class4;

-- AGGREGATE FUNCTIONS

-- 1. COUNT()

SELECT COUNT(*) FROM [Sales].[Orders]
-- NULL ni sanamaydi, agar bitta column nitekshirsa!
-- COUNTni ichiga bitta yoki hammasi beriladi


select * from Products;
select count(*) from products;
select count(productname) from products;
select count(productname) from products;

select count(distinct category) from products;
--select count(distinct *) from products;

-- 2. SUM()
-- 3. AVG()
-- 4. MIN()
-- 5. MAX()
-- 6. STRING_AGG()

create table agents
(
	name varchar(50),
	office varchar(50),
	isheadoffice varchar(3)
);

insert into agents
values
	('Rich', 'UK', 'yes'),
	('Rich', 'US', 'no'),
	('Rich', 'NZ', 'no'),
	('Brandy', 'US', 'yes'),
	('Brandy', 'UK', 'no'),
	('Brandy', 'AUS', 'no'),
	('Karen', 'NZ', 'yes'),
	('Karen', 'UK', 'no'),
	('Karen', 'RUS', 'no'),
	('Mary', 'US', 'yes'),
	('Mary', 'UK', 'no'),
	('Mary', 'CAN', 'no'),
	('Charles', 'US', 'yes'),
	('Charles', 'UZB', 'no'),
	('Charles', 'AUS', 'no');

select * from agents;


select name from agents
where (office = 'US' AND isheadoffice='yes')
	or (office = 'UK' AND isheadoffice='no')
GROUP BY name
HAVING COUNT(*) = 2



create table parent
(
	pname varchar(50),
	cname varchar(50),
	gender char(1)
);

insert into parent
values
	('Karen', 'John', 'M'),
	('Karen', 'Steve', 'M'),
	('Karen', 'Ann', 'F'),
	('Rich', 'Cody', 'M'),
	('Rich', 'Stacy', 'F'),
	('Rich', 'Mike', 'M'),
	('Tom', 'John', 'M'),
	('Tom', 'Ross', 'M'),
	('Tom', 'Rob', 'M'),
	('Roger', 'Brandy', 'F'),
	('Roger', 'Jennifer', 'F'),
	('Roger', 'Sara', 'F')

select 
	pname, 
	count(distinct gender) 
from parent 
group by pname
having count(distinct gender) = 2


--- **********************************
-- NUMBER FUNCTIONS
-- 1. SQRT
SELECT sqrt(16)
select sqrt(10)

-- 2. ABS
select abs(-10) as module
union all
select abs(-(-(-10 * 8)))

-- 3. round
select round(sqrt(6767), 2)

-- 4. CEILING - YUQORIGA YAXLITLASH
SELECT CEILING(2.1)

-- 5. FLOOR - QUYIGA YAXLITLASH
SELECT FLOOR(1.9)

-- POWER

SELECT POWER(2, 10)

-- EXP
SELECT EXP(10) -- E ^ 10

-- 8. LOG  => LN
SELECT LOG(EXP(8))

-- 10. SIGN
SELECT SIGN(-986767), SIGN(0), SIGN(56567)  -- (-1	0	1)

-- LOG10
SELECT LOG10(10080)


SELECT RAND()*10

--**********************************************************

-- STRING FUNCTIONS

/*
1. LEN
2. LEFT(COLUMN NAME, 3 OR 5)
3. RIGHT(COLUMN NAME, 3 OR 5)
4. SUBSTRING(columnname, starting number, number of cicle)
5. REVERSE()
6. CHARINDEX('O', COLUMN)
7. REPLACE
8. TRIM, LTRIM, RTRIM
13.  REPLICATE
14. STRING_SPLIT

*/

SELECT REPLACE('SQL SERVER 2019', '2019', '2022')

SELECT * FROM STRING_SPLIT('GDFHGSVCMG,SHDVFMHS,CDSVC,HGDDVC', ',', 1)







--**********************************************************
-- DATE and/or TIME FUNCTIONS
SELECT GETDATE() AS date, CURRENT_TIMESTAMP AS date


SELECT YEAR(GETDATE())
SELECT MONTH(GETDATE())
SELECT DAY(GETDATE())

SELECT DATEDIFF(DAY, GETDATE(), '2025-10-24')


SELECT DATEADD(DAY, 245, GETDATE())


SELECT GETDATE(), EOMONTH(GETDATE())

--SELECT CAST(<VALUE> AS <DATATYPE>)

-- TRY_CAST()

-- WINDOW FUNCTIONS

