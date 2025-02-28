-- Select the class7 database
USE class7;
GO

-- Retrieve customers who have placed more than one order
SELECT
    cus.CustomerName,     -- Customer's full name
    COUNT(ord.OrderID) AS OrderCount -- Total number of orders placed
FROM Customers AS cus
JOIN Orders AS ord
    ON cus.CustomerID = ord.CustomerID
GROUP BY cus.CustomerName  -- Group by customer name
HAVING COUNT(ord.OrderID) > 1; -- Only include customers with more than one order
