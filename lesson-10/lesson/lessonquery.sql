CREATE TABLE Orders (    OrderID INT PRIMARY KEY,    CustomerName VARCHAR(100),    OrderDate DATE);CREATE TABLE OrderDetails (    OrderDetailID INT PRIMARY KEY,    OrderID INT,    ProductName VARCHAR(100),    Quantity INT,    UnitPrice DECIMAL(10,2),    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID));INSERT INTO Orders VALUES     (1, 'Alice', '2024-03-01'),    (2, 'Bob', '2024-03-02'),    (3, 'Charlie', '2024-03-03');INSERT INTO OrderDetails VALUES     (1, 1, 'Laptop', 1, 1000.00),    (2, 1, 'Mouse', 2, 50.00),    (3, 2, 'Phone', 1, 700.00),    (4, 2, 'Charger', 1, 30.00),    (5, 3, 'Tablet', 1, 400.00),    (6, 3, 'Keyboard', 1, 80.00);select * from Ordersselect * from OrderDetails--===================================================================;WITH cte AS (	SELECT 		o.OrderID,		o.CustomerName,		od.ProductName,		od.Quantity,		od.UnitPrice,		ROW_NUMBER() OVER(PARTITION BY o.CustomerName ORDER BY od.UnitPrice DESC) AS RNK	FROM Orders AS o	JOIN OrderDetails AS od		ON o.OrderID = od.OrderID)SELECT 	OrderID,	CustomerName,	ProductName,	Quantity,	UnitPricefrom ctewhere RNK = 1--============================================
CREATE TABLE TestMax
(
    Year1 INT
    ,Max1 INT
    ,Max2 INT
    ,Max3 INT
);

INSERT INTO TestMax 
VALUES
    (2001,10,101,87)
    ,(2002,103,19,88)
    ,(2003,21,23,89)
    ,(2004,27,28,91);

--select * from TestMax;

/*
2001	101
2002	103
2003	89
2004	91
*/

-- Solution 1
select Year1, GREATEST(Max1, max2, Max3) from TestMaxselect 	year1,	iif(max1 > max2 and max1 > max3, max1, 		iif(max2 > max3, max2, max3))from testmax--=======================================================-- VALUES--=======================================================CREATE TABLE demo(	col1 int, col2 int)insert into demovalues	(1, 2),	(3, 4),	(5, 6);insert into demoselect 1, 2union allselect 3, 4union allselect 5, 6select col1 + col2 from (	values	(1, 2),	(3, 4),	(5, 6)) v1(col1, col2)