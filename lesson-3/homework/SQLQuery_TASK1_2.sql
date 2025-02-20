USE class3;

SELECT
    Department,
    AverageSalary,
    CASE 
        WHEN AverageSalary > 80000 THEN 'High'
        WHEN AverageSalary BETWEEN 50000 AND 80000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM (
    SELECT 
        Department,
        AVG(Salary) AS AverageSalary
    FROM Employees
    GROUP BY Department
) AS DepartmentSalaries
ORDER BY AverageSalary DESC
OFFSET 2 ROWS FETCH NEXT 5 ROWS ONLY;
