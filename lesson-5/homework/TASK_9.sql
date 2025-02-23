--Calculate the Moving Average Salary Over 3 Employees (Including Current, Previous, and Next)


USE class5;
GO

SELECT 
	*,
	AVG(Salary) OVER(ORDER BY Department ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS MOVING_AVG
FROM Employees;

-----------------------------------------------------

SELECT 
	*,
	AVG(Salary) OVER(ORDER BY EmployeeID ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS MOVING_AVG
FROM Employees;

-----------------------------------------------------

SELECT 
	*,
	AVG(Salary) OVER(PARTITION BY Department ORDER BY EmployeeID ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS MOVING_AVG
FROM Employees;













