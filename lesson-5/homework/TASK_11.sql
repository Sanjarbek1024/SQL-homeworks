--Calculate the Running Average of Salaries Over All Previous Employees

USE class5;
GO

SELECT 
    EmployeeID, 
    Name, 
    Department, 
    Salary, 
    HireDate, 
    AVG(Salary) OVER (ORDER BY HireDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningAverage
FROM Employees;