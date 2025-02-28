-- Select the class7 database
USE class7;
GO


-- Find total amount spent by each customer
SELECT
	cus.CustomerID,
	cus.CustomerName,
	SUM(od.Quantity * od.Price) AS TotalSpent -- Total amount spent by customer
FROM Customers AS cus
JOIN Orders AS ord
	ON cus.CustomerID = ord.CustomerID
JOIN OrderDetails AS od
	ON ord.OrderID = od.OrderID
GROUP BY cus.CustomerID, cus.CustomerName -- Grouping to get total per customer
ORDER BY TotalSpent DESC; -- Sort customers by highest spenders