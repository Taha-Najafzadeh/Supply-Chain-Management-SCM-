drop database if exists Salesdb;
CREATE DATABASE SalesDB;
USE Salesdb;
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    SaleDate DATE,
    QuantitySold INT,
    UnitPrice DECIMAL(10, 2)
);

INSERT INTO Sales (SaleID, ProductName, Category, SaleDate, QuantitySold, UnitPrice) VALUES
(1, 'Laptop', 'Electronics', '2024-12-01', 5, 800),
(2, 'Smartphone', 'Electronics', '2024-12-02', 10, 600),
(3, 'Jeans', 'Clothing', '2024-12-03', 20, 40),
(4, 'Jacket', 'Clothing', '2024-12-04', 15, 80),
(5, 'Printer', 'Office Supply', '2024-12-05', 2, 200),
(6, 'Notebook', 'Office Supply', '2024-12-06', 50, 5),
(7, 'Toaster', 'Home Appliance', '2024-12-07', 3, 50),
(8, 'Vacuum Cleaner', 'Home Appliance', '2024-12-08', 1, 150);

SELECT 
    Category,
    SUM(QuantitySold * UnitPrice) AS TotalSales
FROM 
    Sales
GROUP BY 
    Category;

SELECT 
    ProductName,
    SUM(QuantitySold * UnitPrice) AS TotalRevenue
FROM 
    Sales
GROUP BY 
    ProductName
ORDER BY 
    TotalRevenue DESC
LIMIT 3;

SELECT 
    DATE_FORMAT(SaleDate, '%Y-%m') AS Month,
    SUM(QuantitySold * UnitPrice) AS MonthlyRevenue
FROM 
    Sales
GROUP BY 
    Month
ORDER BY 
    Month;

SELECT 
    Category,
    AVG(UnitPrice) AS AvgPrice
FROM 
    Sales
GROUP BY 
    Category;

SELECT 
    ProductName,
    SUM(QuantitySold) AS TotalQuantity
FROM 
    Sales
GROUP BY 
    ProductName
ORDER BY 
    TotalQuantity DESC;
