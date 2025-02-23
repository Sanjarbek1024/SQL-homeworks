-- WINDOW FUNCTION


DROP TABLE IF EXISTS Sales
CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    SaleDate DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL
);


INSERT INTO Sales (SaleDate, Amount) VALUES
('2024-01-01', 100),
('2024-01-02', 200),
('2024-01-03', 150),
('2024-01-04', 300),
('2024-01-05', 250),
('2024-01-06', 400),
('2024-01-07', 350),
('2024-01-08', 450),
('2024-01-09', 500),
('2024-01-10', 100);

select * from Sales

--SaleID	SaleDate	Amount Order
--1			2024-01-01	100.00 1
--2			2024-01-02	200.00 4
--3			2024-01-03	150.00 3
--4			2024-01-04	300.00
--5			2024-01-05	250.00 5
--6			2024-01-06	400.00
--7			2024-01-07	350.00
--8			2024-01-08	450.00
--9			2024-01-09	500.00
--10		2024-01-10	100.00 2


-- ROW_NUMBER() OVER(ORDER BY ___) --

select 
	*,
	ROW_NUMBER() OVER(ORDER BY Amount) AS NEXT_ID,
	ROW_NUMBER() OVER(ORDER BY Amount DESC) AS DESC_ID,
	ROW_NUMBER() OVER(ORDER BY SaleDate DESC) AS SALE_ID
FROM Sales
ORDER BY SaleID


-- DENSE_RANK() OVER(ORDER BY ___) --

select 
	*,
	DENSE_RANK() OVER(ORDER BY AMOUNT DESC) AS NEW
FROM Sales
ORDER BY SaleID

	--	9
	--	7
	--	8
	--	5
	--	6
	--	3
	--	4
	--	2
	--	1
	--	9


-- RANK() OVER(ORDER BY ___) -- Bunisi tashlab ketadi!

select 
	*,
	RANK() OVER(ORDER BY AMOUNT) AS NEW
FROM Sales

	--1
	--1
	--3
	--4
	--5
	--6
	--7
	--8
	--9
	--10



-- Aggregate functions
-- SUM, COUNT, MAX, MIN, AVG

-- slect *, (select sum(nimadur) from qayerdandir) from salary


-- Aggregate window functions
-- SUM, COUNT, MAX, MIN, AVG

select *, sum(amount) over()
from sales


-- ************************************************************************************************************************************************************

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
	avg(Salary) over(partition by Department) as jami_suymma
from Employees


--*******************************

SELECT 
	*,
	DENSE_RANK() OVER(PARTITION BY Department ORDER BY salary desc) as rn
FROM Employees
ORDER BY EmployeeID, rn




select 
	*,
	sum(salary) over(),
	sum(salary) over(order by HireDate)
from Employees
order by hiredate

select 
	row_number() over(order by (select null)) as id,
	saledate,
	amount

from sales



select 
	*,
	sum(salary) over(),
	sum(salary) over(partition by department order by HireDate) as res
from Employees
order by hiredate



select 
	*,
	sum(salary) over(order by HireDate rows between 1 preceding and current row),
	sum(salary) over(order by HireDate rows between unbounded preceding and current row),
	sum(salary) over(order by HireDate rows between 1 preceding and 1 following)
from Employees
order by hiredate



select 
	*,
	cast((Amount / (sum(amount) over()) * 100) as decimal(10, 2))
from sales

select 
	*,
	avg(Amount) over(order by saledate rows between 1 preceding and 1 following)
from sales;