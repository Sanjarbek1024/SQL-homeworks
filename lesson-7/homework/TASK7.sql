-- Select the class7 database
USE class7;
GO

-- Find customers who ordered only 'Electronics' products
SELECT 
	cus.CustomerID,  
    cus.CustomerName  
FROM Customers AS cus  
JOIN Orders AS ord  
    ON cus.CustomerID = ord.CustomerID  
JOIN OrderDetails AS od  
    ON ord.OrderID = od.OrderID  
JOIN Products AS prd  
    ON od.ProductID = prd.ProductID  
GROUP BY cus.CustomerID, cus.CustomerName  
HAVING COUNT(DISTINCT CASE WHEN prd.Category <> 'Electronics' THEN prd.ProductID END) = 0; -- Filtering step
