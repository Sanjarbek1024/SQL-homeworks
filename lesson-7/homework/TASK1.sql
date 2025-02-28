-- Select the class7 database
USE class7;
GO

-- Retrieve customer names along with their order details (if available)
SELECT 
    cus.CustomerName,  -- Customer's full name
    ord.OrderID,       -- Unique identifier for the order
    ord.OrderDate      -- Date when the order was placed
FROM Customers AS cus
LEFT JOIN Orders AS ord
    ON cus.CustomerID = ord.CustomerID; -- Match customers with their orders (if any)
