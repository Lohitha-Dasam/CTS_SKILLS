-- =====================================================
-- Module 3 - Advanced SQL Using SQL Server
-- Exercise 4 - Stored Procedures
-- Part 1 (Exercises 1 - 4)
-- =====================================================

USE Cognizant_SQL;
GO

---------------------------------------------------------
-- Drop Existing Procedures
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_GetEmployeesByDepartment;
DROP PROCEDURE IF EXISTS sp_InsertEmployee;
GO

---------------------------------------------------------
-- Exercise 1
-- Create Stored Procedure
---------------------------------------------------------

CREATE PROCEDURE sp_GetEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT
        EmployeeID,
        FirstName,
        LastName,
        Salary,
        JoinDate
    FROM Employees
    WHERE DepartmentID=@DepartmentID;
END;
GO

---------------------------------------------------------
-- Test Exercise 1
---------------------------------------------------------

EXEC sp_GetEmployeesByDepartment 1;
GO

---------------------------------------------------------
-- Create Stored Procedure
-- Insert Employee
---------------------------------------------------------

CREATE PROCEDURE sp_InsertEmployee
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2),
    @JoinDate DATE
AS
BEGIN

    INSERT INTO Employees
    (
        EmployeeID,
        FirstName,
        LastName,
        DepartmentID,
        Salary,
        JoinDate
    )

    VALUES
    (
        @EmployeeID,
        @FirstName,
        @LastName,
        @DepartmentID,
        @Salary,
        @JoinDate
    );

END;
GO

---------------------------------------------------------
-- Test Insert Procedure
---------------------------------------------------------

IF NOT EXISTS
(
    SELECT 1
    FROM Employees
    WHERE EmployeeID = 105
)
BEGIN

    EXEC sp_InsertEmployee
        105,
        'Robert',
        'Miller',
        3,
        65000,
        '2024-01-20';

END;
GO

SELECT * FROM Employees;
GO

---------------------------------------------------------
-- Exercise 2
-- Modify Stored Procedure
---------------------------------------------------------

ALTER PROCEDURE sp_GetEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN

    SELECT
        EmployeeID,
        FirstName,
        LastName,
        Salary,
        JoinDate

    FROM Employees

    WHERE DepartmentID=@DepartmentID;

END;
GO

---------------------------------------------------------
-- Test Modified Procedure
---------------------------------------------------------

EXEC sp_GetEmployeesByDepartment 3;
GO

---------------------------------------------------------
-- Exercise 3
-- Delete Procedure
---------------------------------------------------------

DROP PROCEDURE sp_InsertEmployee;
GO

---------------------------------------------------------
-- Verify Procedure Deleted
---------------------------------------------------------

SELECT name

FROM sys.procedures

WHERE name='sp_InsertEmployee';
GO

---------------------------------------------------------
-- Exercise 4
-- Execute Stored Procedure
---------------------------------------------------------

EXEC sp_GetEmployeesByDepartment 2;
GO

---------------------------------------------------------
-- Exercise 5
-- Return Employee Count by Department
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_GetEmployeeCount;
GO

CREATE PROCEDURE sp_GetEmployeeCount
    @DepartmentID INT
AS
BEGIN

    SELECT
        COUNT(*) AS TotalEmployees

    FROM Employees

    WHERE DepartmentID=@DepartmentID;

END;
GO

EXEC sp_GetEmployeeCount 3;
GO

---------------------------------------------------------
-- Exercise 6
-- Output Parameter
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_GetTotalSalary;
GO

CREATE PROCEDURE sp_GetTotalSalary
    @DepartmentID INT,
    @TotalSalary DECIMAL(12,2) OUTPUT
AS
BEGIN

    SELECT
        @TotalSalary = SUM(Salary)

    FROM Employees

    WHERE DepartmentID=@DepartmentID;

END;
GO

DECLARE @Salary DECIMAL(12,2);

EXEC sp_GetTotalSalary
    3,
    @Salary OUTPUT;

SELECT @Salary AS TotalSalary;
GO

---------------------------------------------------------
-- Exercise 7
-- Update Employee Salary
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_UpdateEmployeeSalary;
GO

CREATE PROCEDURE sp_UpdateEmployeeSalary
    @EmployeeID INT,
    @NewSalary DECIMAL(10,2)
AS
BEGIN

    UPDATE Employees

    SET Salary=@NewSalary

    WHERE EmployeeID=@EmployeeID;

END;
GO

EXEC sp_UpdateEmployeeSalary
    101,
    48000;
GO

SELECT *
FROM Employees
WHERE EmployeeID=101;
GO

---------------------------------------------------------
-- Exercise 8
-- Give Bonus
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_GiveBonus;
GO

CREATE PROCEDURE sp_GiveBonus
    @DepartmentID INT,
    @BonusAmount DECIMAL(10,2)
AS
BEGIN

    UPDATE Employees

    SET Salary = Salary + @BonusAmount

    WHERE DepartmentID=@DepartmentID;

END;
GO

EXEC sp_GiveBonus
    3,
    5000;
GO

SELECT *
FROM Employees
WHERE DepartmentID=3;
GO

---------------------------------------------------------
-- Exercise 9
-- Transaction in Stored Procedure
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_UpdateSalaryTransaction;
GO

CREATE PROCEDURE sp_UpdateSalaryTransaction
    @EmployeeID INT,
    @NewSalary DECIMAL(10,2)
AS
BEGIN
    BEGIN TRY

        BEGIN TRANSACTION;

        UPDATE Employees
        SET Salary = @NewSalary
        WHERE EmployeeID = @EmployeeID;

        COMMIT TRANSACTION;

        PRINT 'Salary Updated Successfully';

    END TRY

    BEGIN CATCH

        ROLLBACK TRANSACTION;

        PRINT 'Transaction Failed';

    END CATCH
END;
GO

EXEC sp_UpdateSalaryTransaction
    102,
    60000;
GO

SELECT *
FROM Employees
WHERE EmployeeID = 102;
GO

---------------------------------------------------------
-- Exercise 10
-- Dynamic SQL
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_SearchEmployee;
GO

CREATE PROCEDURE sp_SearchEmployee
    @ColumnName VARCHAR(50),
    @Value VARCHAR(100)
AS
BEGIN

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL =
    'SELECT * FROM Employees
     WHERE ' + QUOTENAME(@ColumnName) + ' = @Value';

    EXEC sp_executesql
        @SQL,
        N'@Value VARCHAR(100)',
        @Value;

END;
GO

EXEC sp_SearchEmployee
    'FirstName',
    'John';
GO

---------------------------------------------------------
-- Exercise 11
-- TRY...CATCH Error Handling
---------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_UpdateEmployeeSalarySafe;
GO

CREATE PROCEDURE sp_UpdateEmployeeSalarySafe
    @EmployeeID INT,
    @Salary DECIMAL(10,2)
AS
BEGIN

    BEGIN TRY

        UPDATE Employees
        SET Salary=@Salary
        WHERE EmployeeID=@EmployeeID;

        PRINT 'Salary Updated Successfully';

    END TRY

    BEGIN CATCH

        PRINT 'Error Occurred';

        PRINT ERROR_MESSAGE();

    END CATCH

END;
GO

EXEC sp_UpdateEmployeeSalarySafe
    103,
    75000;
GO

SELECT *
FROM Employees
WHERE EmployeeID = 103;
GO