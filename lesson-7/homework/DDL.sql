USE class7;

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

DROP TABLE IF EXISTS OrderDetails;
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2)
);

DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);

-- Insert data into Customers
INSERT INTO Customers (CustomerID, CustomerName) VALUES 
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Alice Johnson'),
(4, 'Bob Brown'),
(5, 'Charlie Green');  -- A customer with no orders

-- Insert data into Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES 
(101, 1, '2024-02-01'),
(102, 2, '2024-02-02'),
(103, 3, '2024-02-03'),
(104, 4, '2024-02-04'),
(105, 1, '2024-02-05'),
(106, 1, '2024-02-06'),  -- John Doe has multiple orders
(107, 3, '2024-02-07');

-- Insert data into Products
INSERT INTO Products (ProductID, ProductName, Category) VALUES 
(201, 'Laptop', 'Electronics'),
(202, 'Smartphone', 'Electronics'),
(203, 'Headphones', 'Electronics'),
(204, 'Coffee Maker', 'Appliances'),
(205, 'Desk Chair', 'Furniture'),
(206, 'Notebook', 'Stationery'),
(207, 'Pen Set', 'Stationery');

-- Insert data into OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES 
(301, 101, 201, 1, 1000.00),
(302, 101, 203, 2, 50.00),
(303, 102, 202, 1, 800.00),
(304, 103, 204, 1, 120.00),
(305, 104, 205, 2, 150.00),
(306, 105, 202, 1, 800.00),
(307, 105, 203, 3, 50.00),
(308, 106, 201, 1, 1000.00),  -- Second order for John Doe
(309, 107, 206, 5, 5.00),     -- Alice bought Stationery
(310, 107, 207, 2, 10.00);    -- Alice bought Stationery


SELECT * FROM Customers;
SELECT * FROM OrderDetails;
SELECT * FROM Products;
SELECT * FROM Orders;
