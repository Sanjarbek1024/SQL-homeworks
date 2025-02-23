-- Calculate the Running Total of Salaries in Each Department.

USE class5;
GO

SELECT 
    *,
    SUM(Salary) OVER (PARTITION BY Department ORDER BY Salary) AS RunningTotal
FROM Employees;


SELECT 
    *,
    SUM(Salary) OVER (PARTITION BY Department ORDER BY HireDate) AS RunningTotal
FROM Employees;
