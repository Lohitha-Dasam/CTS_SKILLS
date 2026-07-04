-- =====================================================
-- Module 3 - Advanced SQL Using SQL Server
-- Exercise 3 - Views
-- =====================================================

USE Cognizant_SQL;
GO

---------------------------------------------------------
-- Drop Views (if already exist)
---------------------------------------------------------

DROP VIEW IF EXISTS vw_EmployeeReport;
DROP VIEW IF EXISTS vw_EmployeeAnnualSalary;
DROP VIEW IF EXISTS vw_EmployeeFullName;
DROP VIEW IF EXISTS vw_EmployeeBasicInfo;
GO

---------------------------------------------------------
-- Drop Tables (if already exist)
---------------------------------------------------------

DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;
GO

---------------------------------------------------------
-- Create Departments Table
---------------------------------------------------------

CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);
GO

---------------------------------------------------------
-- Create Employees Table
---------------------------------------------------------

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    JoinDate DATE,

    CONSTRAINT FK_Department
    FOREIGN KEY (DepartmentID)
    REFERENCES Departments(DepartmentID)
);
GO

---------------------------------------------------------
-- Insert Departments
---------------------------------------------------------

INSERT INTO Departments
VALUES
(1,'Human Resources'),
(2,'Finance'),
(3,'Information Technology'),
(4,'Marketing');
GO

---------------------------------------------------------
-- Insert Employees
---------------------------------------------------------

INSERT INTO Employees
VALUES
(101,'John','Smith',1,45000,'2022-01-15'),
(102,'Alice','Johnson',2,55000,'2021-08-20'),
(103,'David','Brown',3,70000,'2020-05-10'),
(104,'Sophia','Wilson',4,50000,'2023-02-18');
GO

---------------------------------------------------------
-- Display Tables
---------------------------------------------------------

SELECT * FROM Departments;
SELECT * FROM Employees;
GO

---------------------------------------------------------
-- Exercise 1
-- Create Simple View
---------------------------------------------------------

CREATE VIEW vw_EmployeeBasicInfo
AS
SELECT
    E.EmployeeID,
    E.FirstName,
    E.LastName,
    D.DepartmentName
FROM Employees E
INNER JOIN Departments D
ON E.DepartmentID = D.DepartmentID;
GO

SELECT * FROM vw_EmployeeBasicInfo;
GO

---------------------------------------------------------
-- Exercise 2
-- Full Name View
---------------------------------------------------------

CREATE VIEW vw_EmployeeFullName
AS
SELECT
    EmployeeID,
    FirstName + ' ' + LastName AS FullName,
    Salary
FROM Employees;
GO

SELECT * FROM vw_EmployeeFullName;
GO

---------------------------------------------------------
-- Exercise 3
-- Annual Salary View
---------------------------------------------------------

CREATE VIEW vw_EmployeeAnnualSalary
AS
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    Salary * 12 AS AnnualSalary
FROM Employees;
GO

SELECT * FROM vw_EmployeeAnnualSalary;
GO

---------------------------------------------------------
-- Exercise 4
-- Employee Report View
---------------------------------------------------------

CREATE VIEW vw_EmployeeReport
AS
SELECT
    E.EmployeeID,
    E.FirstName + ' ' + E.LastName AS FullName,
    D.DepartmentName,
    Salary * 12 AS AnnualSalary,
    (Salary * 12) * 0.10 AS Bonus
FROM Employees E
INNER JOIN Departments D
ON E.DepartmentID = D.DepartmentID;
GO

SELECT * FROM vw_EmployeeReport;
GO