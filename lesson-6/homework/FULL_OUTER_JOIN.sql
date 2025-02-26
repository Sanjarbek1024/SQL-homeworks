USE class6;
GO

SELECT
	E.EmployeeID,
	E.Name,
	D.DepartmentName,
	E.Salary
FROM Employees AS E
FULL OUTER JOIN Departments AS D
	ON E.DepartmentID = D.DepartmentID
ORDER BY E.EmployeeID, D.DepartmentID;