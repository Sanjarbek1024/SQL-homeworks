-- Select the class7 database
USE class7;
GO

-- Retrieve all orders along with product names and quantities
SELECT
    ord.OrderID,         -- Unique identifier for each order
    prd.ProductName,     -- Name of the ordered product
    od.Quantity          -- Quantity of the product in the order
FROM Orders AS ord
JOIN OrderDetails AS od  -- Using 'od' instead of 'OrderDetails' for better readability
    ON ord.OrderID = od.OrderID
JOIN Products AS prd
    ON od.ProductID = prd.ProductID;
