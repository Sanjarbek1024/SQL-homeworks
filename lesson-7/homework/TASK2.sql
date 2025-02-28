-- Select the class7 database
USE class7;
GO

-- Retrieve customers who have never placed an order
SELECT 
    cus.CustomerID,   -- Unique identifier for the customer
    cus.CustomerName  -- Customer's name
FROM Customers AS cus
LEFT JOIN Orders AS ord
    ON cus.CustomerID = ord.CustomerID
WHERE ord.OrderID IS NULL; -- Filters customers with no matching order

