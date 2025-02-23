-- Find Employees Who Have the Same Salary Rank?

USE class5;
GO

SELECT
	*,
	DENSE_RANK() OVER(ORDER BY Salary) AS First_option,
	RANK() OVER(ORDER BY Salary) AS Second_option
FROM Employees
ORDER BY EmployeeID;


-- To find employees who share the same salary rank, we should use RANK() or DENSE_RANK() because both assign the same rank to employees with identical salaries.