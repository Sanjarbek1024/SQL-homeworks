--Find the Sum of Salaries for the Last 3 Hired Employees

USE class5;
GO


SELECT
	*,
	SUM(Salary) OVER() AS Summa
FROM (
	SELECT TOP 3
		*
	FROM Employees
	ORDER BY HireDate DESC
) AS new;



SELECT 
    SUM(Salary) AS TotalSalary
FROM (
    SELECT TOP 3 
        Salary 
    FROM Employees 
    ORDER BY HireDate DESC
) AS RecentHires;