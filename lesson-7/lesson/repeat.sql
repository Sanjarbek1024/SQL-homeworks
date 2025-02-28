use class7;
go

DROP TABLE IF EXISTS dbo.People
CREATE TABLE dbo.People(    ID INT    ,NAME VARCHAR(10)    ,GENDER VARCHAR(1));INSERT INTO dbo.People(ID,NAME,GENDER)VALUES    (1,'Neeraj','M'),    (2,'Mayank','M'),    (3,'Pawan','M'),    (4,'Gopal','M'),    (5,'Sandeep','M'),    (6,'Isha','F'),    (7,'Sugandha','F'),    (8,'kritika','F');SELECT	*FROM dbo.PeopleORDER BY ROW_NUMBER() OVER(PARTITION BY GENDER ORDER BY ID), GENDER DESC--1	Neeraj		M	1  
--6	Isha		F	1
--2	Mayank		M	2
--7	Sugandha	F	2
--3	Pawan		M	3
--8	kritika		F	3
--4	Gopal		M	4
--5	Sandeep		M	5




DROP TABLE IF EXISTS department	create table department(	id int primary key,	name varchar(50));--create table manager(--	id int,--	name varchar--);
DROP TABLE IF EXISTS employeecreate table employee(	id int primary key,	name varchar(50),	salary int,	department int,	mgr_id int);insert into departmentvalues	(1, 'IT'),	(2, 'Marketing'),	(3, 'HR'),	(4, 'Sales')insert into employeevalues 	(1, 'Mardon', 50000, 1, NULL),	(2, 'Iskandar', 4000, 2, 1),	(3, 'Mirshod', 4500, 1, 1),	(4, 'Shavkat', 4200, 3, 2);SELECT	E.name EMPname,	E.salary EMPsalary,	M.name MNGname,	M.salary MNGsalaryFROM employee AS EJOIN employee AS M	ON E.mgr_id = M.id AND E.salary < M.salarySELECT	E.name EMPname,	D.name EMPDEPARTMENT,	M.name MNGname,	G.name MNGDEPARTMENTFROM employee AS EJOIN employee AS M	ON E.mgr_id = M.id AND E.department <> M.departmentJOIN department AS D	ON E.department = D.idJOIN department AS G	ON M.department = G.id--	FROM--	WHERE--	GROUP BY--	HAVING--	SELECT--	ORDER BY--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++DROP TABLE numbersCREATE TABLE numbers(	num int);insert into numbersselect ordinal FROM STRING_SPLIT(REPLICATE(',', 19), ',', 1)select * from numbersselect ordinal as num INTO numbersFROM STRING_SPLIT(REPLICATE(',', 19), ',', 1)
select 
	n1.num as num1
from numbers n1
cross join numbers n2
group by n1.num
having sum(case when n1.num % n2.num = 0 then 1  else 0 end) = 2
order by num1

select 
	n1.num as num1,
	sum(case when n1.num % n2.num = 0 then 1  else 0 end)
from numbers n1
join numbers n2
	on n1.num >= n2.num
group by n1.num
having sum(case when n1.num % n2.num = 0 then 1  else 0 end) = 2
order by num1


select 
	son,
	case when sum(case when son % num = 0 then 1  else 0 end) = 2 then 'tub' else 'tub emas' end
from (
	select 11 as son, ordinal as num FROM STRING_SPLIT(REPLICATE(',', 19), ',', 1)
	union all
	select 18 as son, ordinal as num FROM STRING_SPLIT(REPLICATE(',', 19), ',', 1)
) t
group by son

delete from numbers
where num in (2, 4, 5, 6);


select * from numbers



select *
from  numbers n1
join numbers n2
	ON n1.num >= n2.num
order by n1.num


select 2 as son, ordinal from string_split(REPLICATE(',', 1), ',', 1)
union all
select 3 as son, ordinal from string_split(REPLICATE(',', 2), ',', 1)
union all
select 4 as son, ordinal from string_split(REPLICATE(',', 3), ',', 1)


select n.num, t.ordinal
from numbers as n
outer apply string_split(REPLICATE(',', n.num-1), ',', 1) t


select n.num, t.ordinal
from numbers as n
cross apply string_split(REPLICATE(',', n.num-1), ',', 1) t



CREATE TABLE letters
(
	ID INT,
    VALUE VARCHAR(100)
);

INSERT INTO letters(ID,VALUE)
VALUES
	(1,'a,b,c'),
	(2,'s,t,u,v,w,x');

select * from letters

select
	f.id,
	t.value
from letters f
cross apply string_split(f.value, ',') t