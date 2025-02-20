Use class3;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(20) CHECK (Status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate) VALUES
(1, 'Ali', 'Karimov', 'IT', 5000.00, '2022-01-15'),
(2, 'Olim', 'Rajabov', 'HR', 4200.00, '2021-05-20'),
(3, 'Zarina', 'Yoqubova', 'Finance', 4800.00, '2019-11-10'),
(4, 'Kamila', 'Xolmirzayeva', 'Marketing', 4500.00, '2020-03-25'),
(5, 'Jasur', 'Usmonov', 'IT', 5200.00, '2023-06-05'),
(6, 'Aziz', 'Tursunov', 'IT', 5100.00, '2022-07-18'),
(7, 'Madina', 'Hakimova', 'HR', 4300.00, '2020-09-22'),
(8, 'Dilshod', 'Mamatov', 'Finance', 4900.00, '2018-12-05'),
(9, 'Shahnoza', 'Qosimova', 'Marketing', 4600.00, '2019-06-17'),
(10, 'Rustam', 'Norov', 'IT', 5300.00, '2023-03-10');

-- Insert sample data into Orders table
INSERT INTO Orders (OrderID, CustomerName, OrderDate, TotalAmount, Status) VALUES
(1, 'Akmal Shodiev', '2023-01-10', 250.50, 'Pending'),
(2, 'Xurshida Norova', '2023-02-15', 1250.00, 'Shipped'),
(3, 'Gulchehra Hasanova', '2023-03-20', 320.75, 'Delivered'),
(4, 'Behruz Karimov', '2023-04-25', 780.60, 'Cancelled'),
(5, 'Diyorbek Erkinov', '2023-05-30', 150.00, 'Pending'),
(6, 'Jamshid Ismoilov', '2023-06-12', 560.80, 'Shipped'),
(7, 'Muhammad Alimov', '2023-07-18', 980.40, 'Delivered'),
(8, 'Zebiniso Abdullayeva', '2023-08-25', 120.50, 'Cancelled'),
(9, 'Javohir Murodov', '2023-09-30', 650.00, 'Pending'),
(10, 'Nodira Rahmonova', '2023-10-05', 870.75, 'Shipped');

-- Insert sample data into Products table
INSERT INTO Products (ProductID, ProductName, Category, Price, Stock) VALUES
(1, 'Laptop', 'Electronics', 1200.99, 50),
(2, 'Smartphone', 'Electronics', 800.49, 100),
(3, 'Desk Chair', 'Furniture', 150.75, 20),
(4, 'Table Lamp', 'Home Decor', 45.30, 200),
(5, 'Backpack', 'Accessories', 60.00, 150),
(6, 'Headphones', 'Electronics', 150.00, 80),
(7, 'Office Desk', 'Furniture', 300.99, 25),
(8, 'Wall Clock', 'Home Decor', 35.50, 120),
(9, 'Sunglasses', 'Accessories', 75.00, 95),
(10, 'Toy Car', 'Toys', 25.40, 60);
