-- =====================================================
-- Module 3 - Advanced SQL Using SQL Server
-- Exercise 6 - Triggers
-- =====================================================

USE Cognizant_SQL;
GO

---------------------------------------------------------
-- Drop Existing Trigger
---------------------------------------------------------

DROP TRIGGER IF EXISTS trg_AfterSalaryUpdate;
DROP TRIGGER IF EXISTS trg_PreventDelete;
DROP TRIGGER IF EXISTS trg_UpdateAnnualSalary;
GO

---------------------------------------------------------
-- Create Log Table
---------------------------------------------------------

DROP TABLE IF EXISTS EmployeeChanges;
GO

CREATE TABLE EmployeeChanges
(
    ChangeID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT,
    OldSalary DECIMAL(10,2),
    NewSalary DECIMAL(10,2),
    ChangeDate DATETIME DEFAULT GETDATE()
);
GO

---------------------------------------------------------
-- Exercise 1
-- AFTER UPDATE Trigger
---------------------------------------------------------

CREATE TRIGGER trg_AfterSalaryUpdate
ON Employees
AFTER UPDATE
AS
BEGIN

    INSERT INTO EmployeeChanges
    (
        EmployeeID,
        OldSalary,
        NewSalary
    )

    SELECT
        d.EmployeeID,
        d.Salary,
        i.Salary

    FROM deleted d

    INNER JOIN inserted i
        ON d.EmployeeID=i.EmployeeID

    WHERE d.Salary<>i.Salary;

END;
GO

---------------------------------------------------------
-- Test AFTER Trigger
---------------------------------------------------------

UPDATE Employees
SET Salary = 52000
WHERE EmployeeID = 101;
GO

SELECT *
FROM EmployeeChanges;
GO

---------------------------------------------------------
-- Exercise 2
-- INSTEAD OF DELETE Trigger
---------------------------------------------------------

CREATE TRIGGER trg_PreventDelete
ON Employees
INSTEAD OF DELETE
AS
BEGIN

    RAISERROR
    (
        'Employee records cannot be deleted.',
        16,
        1
    );

END;
GO

---------------------------------------------------------
-- Test Delete Trigger
---------------------------------------------------------

BEGIN TRY

    DELETE FROM Employees
    WHERE EmployeeID = 101;

END TRY

BEGIN CATCH

    PRINT ERROR_MESSAGE();

END CATCH;
GO

---------------------------------------------------------
-- Exercise 3
-- LOGON Trigger
---------------------------------------------------------

/*

DO NOT EXECUTE THIS ON YOUR LOCAL SQL SERVER

CREATE TRIGGER trg_LogonRestriction

ON ALL SERVER

FOR LOGON

AS
BEGIN

    IF DATEPART(HOUR,GETDATE()) BETWEEN 2 AND 3
        ROLLBACK;

END;
GO

*/

---------------------------------------------------------
-- Exercise 4
-- Modify Trigger
---------------------------------------------------------

ALTER TRIGGER trg_AfterSalaryUpdate
ON Employees
AFTER UPDATE
AS
BEGIN

    INSERT INTO EmployeeChanges
    (
        EmployeeID,
        OldSalary,
        NewSalary
    )

    SELECT
        d.EmployeeID,
        d.Salary,
        i.Salary

    FROM deleted d

    INNER JOIN inserted i
        ON d.EmployeeID=i.EmployeeID;

END;
GO

---------------------------------------------------------
-- Exercise 5
-- Delete Trigger
---------------------------------------------------------

DROP TRIGGER trg_PreventDelete;
GO

---------------------------------------------------------
-- Verify Trigger Deleted
---------------------------------------------------------

SELECT name
FROM sys.triggers
WHERE name='trg_PreventDelete';
GO

---------------------------------------------------------
-- Exercise 6
-- Annual Salary Trigger
---------------------------------------------------------

IF COL_LENGTH('Employees','AnnualSalary') IS NULL
BEGIN

    ALTER TABLE Employees
    ADD AnnualSalary DECIMAL(12,2);

END;
GO

---------------------------------------------------------
-- Drop Trigger if Already Exists
---------------------------------------------------------

DROP TRIGGER IF EXISTS trg_UpdateAnnualSalary;
GO

CREATE TRIGGER trg_UpdateAnnualSalary
ON Employees
AFTER UPDATE
AS
BEGIN

    UPDATE E

    SET AnnualSalary = E.Salary * 12

    FROM Employees E

    INNER JOIN inserted I
        ON E.EmployeeID = I.EmployeeID;

END;
GO

---------------------------------------------------------
-- Test Annual Salary Trigger
---------------------------------------------------------

UPDATE Employees
SET Salary = 55000
WHERE EmployeeID = 102;
GO

SELECT
    EmployeeID,
    FirstName,
    Salary,
    AnnualSalary
FROM Employees
WHERE EmployeeID = 102;
GO