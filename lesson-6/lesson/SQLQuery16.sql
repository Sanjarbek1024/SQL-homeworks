use class6;
go

select * from t;

SELECT 
    typ, 
    COUNT(CASE WHEN Value1 = 'a' THEN 1 END) +
    COUNT(CASE WHEN Value2 = 'a' THEN 1 END) +
    COUNT(CASE WHEN Value3 = 'a' THEN 1 END) AS a_count
FROM t
GROUP BY typ;



drop table if exists pq;
create table pq
(
	id int,
	name varchar(10),
	typed varchar(10)
);

insert into pq
values 
	(1, 'P', NULL), (1, NULL, 'Q'),
	(2, 'A', NULL), (2, NULL, 'B');

select * from pq;

select
	id,
	string_agg(name, ', '),
	string_agg(typed, ', ')
from pq
group by id;

select
	id,
	max(name),
	min(typed)
from pq
group by id;

update pq
set name = 'A'
where id = 1 and name is null

--1
--2
--3
--4
--5
--6
--7
--8
--9
--...
--100


select * from generate_series(0, 100)


select row_number() over(order by value) from string_split(replicate(' ,', 99), ',')



DROP TABLE IF EXISTS Employees
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    HireDate DATE NOT NULL
);

INSERT INTO Employees (Name, Department, Salary, HireDate) VALUES
    ('Alice', 'HR', 50000, '2020-06-15'),
    ('Bob', 'HR', 60000, '2018-09-10'),
    ('Charlie', 'IT', 70000, '2019-03-05'),
    ('David', 'IT', 80000, '2021-07-22'),
    ('Eve', 'Finance', 90000, '2017-11-30'),
    ('Frank', 'Finance', 75000, '2019-12-25'),
    ('Grace', 'Marketing', 65000, '2016-05-14'),
    ('Hank', 'Marketing', 72000, '2019-10-08'),
    ('Ivy', 'IT', 67000, '2022-01-12'),
    ('Jack', 'HR', 52000, '2021-03-29');


select 
	*,
	LAG(Salary, 2, 1) OVER(ORDER BY HireDate),
	lead(salary, 2, 3) over(order by HireDate),
	isnull(lag(salary) over(order by HireDate), 1)
from Employees


select 
	*,
	first_value(HireDate) OVER(partition by department ORDER BY HireDate desc) as x,
	last_value(HireDate) OVER(partition by department ORDER BY HireDate) as y
from Employees

-- ORDER BY DA IKKITA BIR XIL COLUMN BERIB BOLMAYDi

-- LEAD, LAG, FIRST_VALUE, LAST_VALUE ::  Window functions






