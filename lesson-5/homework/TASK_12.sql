-- Find the Maximum Salary Over a Sliding Window of 2 Employees Before and After

USE class5;
GO

SELECT 
    EmployeeID, 
    Name, 
    Department, 
    Salary, 
    HireDate, 
    MAX(Salary) OVER (ORDER BY HireDate ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) AS MAX_SALARY
FROM Employees;