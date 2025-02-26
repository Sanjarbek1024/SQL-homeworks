USE class6;
GO

drop table if exists t
CREATE TABLE t
(
ID INT
,Typ VARCHAR(1)
,Value1 VARCHAR(1)
,Value2 VARCHAR(1)
,Value3 VARCHAR(1)
)
GO
 

INSERT INTO t(ID,Typ,Value1,Value2,Value3)
VALUES
(7,'I','a','b','a'),
(2,'O','a','d','f'),
(3,'I','d','b',''),
(4,'O','g','l',''),
(5,'I','z','g','a'),
(6,'I','z','g','a')


select * from t;

select Typ, COUNT(Value1) AS n
from (select Typ, Value1 from t
union all
select Typ, Value2 from t
union all
select Typ, Value3 from t
) as n
where Value1 = 'a'
GROUP BY Typ



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
	lag(Salary, 1, 0) over(partition by department order by HireDate),
	lead(Salary, 1, 0) over(partition by department order by HireDate),
	first_value(name) over(partition by department order by HireDate),
	first_value(name) over(partition by department order by HireDate)
from employees