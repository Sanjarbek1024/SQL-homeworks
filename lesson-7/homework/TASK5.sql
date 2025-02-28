-- Select the class7 database
USE class7;
GO

-- Retrieve the most expensive product in each order
SELECT 
    od.OrderID,           -- Unique order identifier
    prd.ProductName,      -- Product name
    od.Price              -- Price of the product in the order
FROM OrderDetails AS od
JOIN Products AS prd
    ON od.ProductID = prd.ProductID
WHERE od.Price = (
    -- Get the maximum price in each order
    SELECT MAX(Price) 
    FROM OrderDetails 
    WHERE OrderDetails.OrderID = od.OrderID
);
