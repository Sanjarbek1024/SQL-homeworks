use class7;CREATE TABLE dbo.People(    ID INT    ,NAME VARCHAR(10)    ,GENDER VARCHAR(1));INSERT INTO dbo.People(ID,NAME,GENDER)VALUES    (1,'Neeraj','M'),    (2,'Mayank','M'),    (3,'Pawan','M'),    (4,'Gopal','M'),    (5,'Sandeep','M'),    (6,'Isha','F'),    (7,'Sugandha','F'),    (8,'kritika','F');SELECT *, 	ROW_NUMBER() OVER (PARTITION BY gender ORDER BY id) AS GFROM PeopleOrder by G, gender desc--========================================--create table department(	id int primary key,	name varchar(50));--create table manager(--	id int,--	name varchar--);create table employee(	id int primary key,	name varchar(50),	salary int,	department int,	mgr_id int);insert into departmentvalues	(1, 'IT'),	(2, 'Marketing'),	(3, 'HR'),	(4, 'Sales')insert into employeevalues 	(1, 'Mardon', 50000, 1, NULL),	(2, 'Iskandar', 4000, 2, 1),	(3, 'Mirshod', 4500, 1, 1),	(4, 'Shavkat', 4200, 3, 2);select	e.name as EMP_name,	d.name as EMP_dep,	m.name as MNG_name,	g.name as MNG_depfrom employee ejoin employee m	on e.mgr_id = m.id and e.department != m.departmentjoin department as d	on e.department = d.idjoin department as g	on m.department = g.id--================================================--create table numbers(	num int);               