--Identify the Top 2 Highest Salaries in Each Department

USE class5;

SELECT *
FROM (
	SELECT
		*,
		DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) as Ranks 
	FROM Employees
) AS Small
WHERE Ranks <= 2;

-- I used DENSE_RANK() because it identifies the top 2 highest salaries in each department, ensuring employees with the same salary share the same rank. In contrast, RANK() considers the top 2 employees, which may result in skipping ranks if there are salary duplicates.