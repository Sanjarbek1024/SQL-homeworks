-- Assign a Unique Rank to Each Employee Based on Salary?

USE class5;

SELECT * FROM Employees;

SELECT 
	*,
	ROW_NUMBER() OVER(ORDER BY Salary) AS Unique_Rank
FROM Employees
ORDER BY EmployeeID;

-- To assign a unique rank, we use ROW_NUMBER() because, in DENSE_RANK() and RANK(), ranks may be repeated for employees with the same salary.


