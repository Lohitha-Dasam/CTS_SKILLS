-- =====================================================
-- Module 3 - Advanced SQL Using SQL Server
-- Exercise 2 - Indexes
-- =====================================================

USE Cognizant_SQL;
GO

---------------------------------------------------------
-- Create Customers Table
---------------------------------------------------------

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Region VARCHAR(50)
);

---------------------------------------------------------
-- Create Products Table
---------------------------------------------------------

CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

---------------------------------------------------------
-- Create Orders Table
---------------------------------------------------------

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,

    FOREIGN KEY(CustomerID)
    REFERENCES Customers(CustomerID)
);

---------------------------------------------------------
-- Create OrderDetails Table
---------------------------------------------------------

CREATE TABLE OrderDetails
(
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,

    FOREIGN KEY(OrderID)
    REFERENCES Orders(OrderID),

    FOREIGN KEY(ProductID)
    REFERENCES Products(ProductID)
);

---------------------------------------------------------
-- Insert Customers
---------------------------------------------------------

INSERT INTO Customers
VALUES
(1,'Alice','North'),
(2,'Bob','South'),
(3,'Charlie','East'),
(4,'David','West');

---------------------------------------------------------
-- Insert Products
---------------------------------------------------------

INSERT INTO Products
VALUES
(1,'Laptop','Electronics',75000),
(2,'Mouse','Electronics',800),
(3,'Keyboard','Electronics',1500),
(4,'Mobile','Electronics',30000);

---------------------------------------------------------
-- Insert Orders
---------------------------------------------------------

INSERT INTO Orders
VALUES
(101,1,'2024-01-10'),
(102,2,'2024-01-15'),
(103,3,'2024-02-01'),
(104,4,'2024-02-12');

---------------------------------------------------------
-- Insert Order Details
---------------------------------------------------------

INSERT INTO OrderDetails
VALUES
(1,101,1,1),
(2,102,2,2),
(3,103,3,1),
(4,104,4,3);

---------------------------------------------------------
-- Display Data
---------------------------------------------------------

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

---------------------------------------------------------
-- Non-Clustered Index
---------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_ProductName
ON Products(ProductName);

SELECT *
FROM Products
WHERE ProductName='Laptop';

---------------------------------------------------------
-- Composite Index
---------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_Customer_OrderDate
ON Orders(CustomerID, OrderDate);

SELECT *
FROM Orders
WHERE CustomerID=1
AND OrderDate='2024-01-10';

---------------------------------------------------------
-- Covering Index
---------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_Product_Category
ON Products(Category)
INCLUDE(ProductName, Price);

SELECT
ProductName,
Price
FROM Products
WHERE Category='Electronics';

---------------------------------------------------------
-- Display Created Indexes
---------------------------------------------------------

EXEC sp_helpindex 'Products';

EXEC sp_helpindex 'Orders';

GO