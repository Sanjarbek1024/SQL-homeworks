-- Calculate the Average Salary in Each Department Without GROUP BY

USE class5;
GO

SELECT DISTINCT
	Department,
	AVG(Salary) OVER(PARTITION BY Department)
FROM Employees;

