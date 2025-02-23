-- Find the Difference Between an Employee’s Salary and Their Department’s Average

USE class5;
GO

SELECT 
	*,
	Salary - (AVG(Salary) OVER(PARTITION BY Department)) AS DIFFERENCE 
FROM Employees;