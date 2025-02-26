-- Write a query to get a list of employees along with their department names.

USE class6;
GO

SELECT
	E.EmployeeID, --I didn’t use an alias name there; I don’t need it. But I can use "AS."
	E.Name,
	D.DepartmentName,
	E.Salary
FROM [dbo].[Employees] AS E
INNER JOIN [dbo].[Departments] AS D -- We can use only JOIN instead of INNER JOIN
	ON E.DepartmentID = D.DepartmentID
ORDER BY E.EmployeeID, D.DepartmentID;

