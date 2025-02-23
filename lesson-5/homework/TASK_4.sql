-- Find the Lowest-Paid Employees in Each Department

USE class5;
GO

SELECT *
FROM (
	SELECT
		*,
		DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary ASC) as Ranks -- RANK() ANOTHER VERSION
	FROM Employees
) AS Small
WHERE Ranks = 1;
