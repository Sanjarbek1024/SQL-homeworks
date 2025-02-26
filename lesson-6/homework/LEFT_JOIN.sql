-- Write a query to list all employees, including those who are not assigned to any department.

USE class6;
GO

SELECT
	E.EmployeeID,
	E.Name,
	D.DepartmentName,
	E.Salary
FROM Employees AS E
LEFT OUTER JOIN Departments AS D
	ON E.DepartmentID = D.DepartmentID
ORDER BY E.EmployeeID, D.DepartmentID;