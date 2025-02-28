-- Select the class7 database
USE class7;
GO

-- Find customers who ordered at least one 'Stationery' product
SELECT DISTINCT
    cus.CustomerID,
    cus.CustomerName
FROM Customers AS cus
JOIN Orders AS ord
    ON cus.CustomerID = ord.CustomerID
JOIN OrderDetails AS od
    ON ord.OrderID = od.OrderID
JOIN Products AS prd
    ON od.ProductID = prd.ProductID
WHERE prd.Category = 'Stationery';
