SELECT 
    P.Category,
    P.ProductName AS MostExpensiveProduct,
    P.Price AS The_most_expensive,
    IIF(P.Stock = 0, 'Out of Stock', 
        IIF(P.Stock BETWEEN 1 AND 10, 'Low Stock', 'In Stock')) AS INVENTORY_STATUS
FROM [dbo].[Products] P
WHERE P.Price = (
    SELECT MAX(Price) 
    FROM [dbo].[Products] 
    WHERE Category = P.Category
)
ORDER BY P.Price DESC
OFFSET 5 ROWS;
