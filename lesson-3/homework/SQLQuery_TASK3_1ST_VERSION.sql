USE class3;

-- REAL TABLE
SELECT * FROM [dbo].[Products];

-- TABLE OF THE MOST EXPENSIVE
SELECT 
	Category,
	MAX(Price) AS The_most_expensive
FROM [dbo].[Products]
GROUP BY Category;

-- IIF

SELECT
	*,
	IIF(Stock = 0, 'Out of Stock', IIF(Stock BETWEEN 1 AND 10, 'Low Stock', 'In Stock' )) AS INVENTORY_STATUS
FROM [dbo].[Products]
ORDER BY Price DESC
OFFSET 5 ROWS;