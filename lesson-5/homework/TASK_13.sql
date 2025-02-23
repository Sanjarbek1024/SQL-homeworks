-- Determine the Percentage Contribution of Each Employee’s Salary to Their Department’s Total Salary

USE class5;
GO

SELECT 
    EmployeeID, 
    Name, 
    Department, 
    Salary, 
    SUM(Salary) OVER (PARTITION BY Department) AS TotalDepartmentSalary,
    CAST((Salary * 100.0) / SUM(Salary) OVER (PARTITION BY Department) AS DECIMAL(10, 2)) AS SalaryPercentage
FROM Employees;
