-- Find the Total Salary of Each Department Without GROUP BY

USE class5;
GO

SELECT 
    *,
    SUM(Salary) OVER (PARTITION BY Department) AS TotalSalary
FROM Employees;


-- LIKE GROUP BY

SELECT DISTINCT 
    Department,
    SUM(Salary) OVER (PARTITION BY Department) AS TotalSalary
FROM Employees;

