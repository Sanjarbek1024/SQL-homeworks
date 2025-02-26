USE class6;
GO

SELECT
	E.EmployeeID,
	E.Name,
	D.DepartmentName,
	E.Salary,
	P.ProjectName
FROM Employees AS E
INNER JOIN Departments AS D
	ON E.DepartmentID = D.DepartmentID
LEFT JOIN Projects AS P
	ON E.EmployeeID = P.EmployeeID