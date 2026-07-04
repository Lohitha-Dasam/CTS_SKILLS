-- =====================================================
-- Module 3 - Advanced SQL Using SQL Server
-- Exercise 5 - User Defined Functions
-- Part 1 (Exercises 1 - 5)
-- =====================================================

USE Cognizant_SQL;
GO

---------------------------------------------------------
-- Drop Existing Functions
---------------------------------------------------------

DROP FUNCTION IF EXISTS fn_CalculateAnnualSalary;
DROP FUNCTION IF EXISTS fn_GetEmployeesByDepartment;
DROP FUNCTION IF EXISTS fn_CalculateBonus;
GO

---------------------------------------------------------
-- Exercise 1
-- Scalar Function
---------------------------------------------------------

CREATE FUNCTION fn_CalculateAnnualSalary
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(12,2)
AS
BEGIN

    RETURN @Salary * 12;

END;
GO

---------------------------------------------------------
-- Test Scalar Function
---------------------------------------------------------

SELECT
    EmployeeID,
    FirstName,
    Salary,
    dbo.fn_CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees;
GO

---------------------------------------------------------
-- Exercise 2
-- Table Valued Function
---------------------------------------------------------

CREATE FUNCTION fn_GetEmployeesByDepartment
(
    @DepartmentID INT
)

RETURNS TABLE

AS

RETURN
(
    SELECT
        EmployeeID,
        FirstName,
        LastName,
        Salary,
        JoinDate

    FROM Employees

    WHERE DepartmentID=@DepartmentID
);
GO

---------------------------------------------------------
-- Test Table Valued Function
---------------------------------------------------------

SELECT *
FROM dbo.fn_GetEmployeesByDepartment(2);
GO

---------------------------------------------------------
-- Exercise 3
-- Bonus Function
---------------------------------------------------------

CREATE FUNCTION fn_CalculateBonus
(
    @Salary DECIMAL(10,2)
)

RETURNS DECIMAL(12,2)

AS
BEGIN

    RETURN @Salary * 0.10;

END;
GO

---------------------------------------------------------
-- Test Bonus Function
---------------------------------------------------------

SELECT
EmployeeID,
FirstName,
Salary,
dbo.fn_CalculateBonus(Salary) AS Bonus

FROM Employees;
GO

---------------------------------------------------------
-- Exercise 4
-- Modify Bonus Function
---------------------------------------------------------

ALTER FUNCTION fn_CalculateBonus
(
    @Salary DECIMAL(10,2)
)

RETURNS DECIMAL(12,2)

AS
BEGIN

    RETURN @Salary * 0.15;

END;
GO

---------------------------------------------------------
-- Test Modified Function
---------------------------------------------------------

SELECT
EmployeeID,
FirstName,
Salary,
dbo.fn_CalculateBonus(Salary) AS Bonus

FROM Employees;
GO

---------------------------------------------------------
-- Exercise 5
-- Delete Function
---------------------------------------------------------

DROP FUNCTION fn_CalculateBonus;
GO

---------------------------------------------------------
-- Verify Function Deleted
---------------------------------------------------------

SELECT name

FROM sys.objects

WHERE type='FN'
AND name='fn_CalculateBonus';
GO

---------------------------------------------------------
-- Exercise 6
-- Recreate Bonus Function
---------------------------------------------------------

CREATE FUNCTION fn_CalculateBonus
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(12,2)
AS
BEGIN
    RETURN @Salary * 0.15;
END;
GO

---------------------------------------------------------
-- Exercise 6
-- Execute Annual Salary Function
---------------------------------------------------------

SELECT
    EmployeeID,
    FirstName,
    dbo.fn_CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees;
GO

---------------------------------------------------------
-- Exercise 7
-- Annual Salary for EmployeeID = 1
---------------------------------------------------------

SELECT
    EmployeeID,
    FirstName,
    Salary,
    dbo.fn_CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees
WHERE EmployeeID = 1;
GO

---------------------------------------------------------
-- Exercise 8
-- Employees in Department 3
---------------------------------------------------------

SELECT *
FROM dbo.fn_GetEmployeesByDepartment(3);
GO

---------------------------------------------------------
-- Exercise 9
-- Nested Function
---------------------------------------------------------

DROP FUNCTION IF EXISTS fn_CalculateTotalCompensation;
GO

CREATE FUNCTION fn_CalculateTotalCompensation
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(12,2)
AS
BEGIN

    RETURN dbo.fn_CalculateAnnualSalary(@Salary)
           + dbo.fn_CalculateBonus(@Salary);

END;
GO

---------------------------------------------------------
-- Test Nested Function
---------------------------------------------------------

SELECT
    EmployeeID,
    FirstName,
    Salary,
    dbo.fn_CalculateTotalCompensation(Salary) AS TotalCompensation
FROM Employees;
GO

---------------------------------------------------------
-- Exercise 10
-- Modify Nested Function
---------------------------------------------------------

ALTER FUNCTION fn_CalculateTotalCompensation
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(12,2)
AS
BEGIN

    RETURN dbo.fn_CalculateAnnualSalary(@Salary)
           + (@Salary * 0.20);

END;
GO

---------------------------------------------------------
-- Test Modified Nested Function
---------------------------------------------------------

SELECT
    EmployeeID,
    FirstName,
    Salary,
    dbo.fn_CalculateTotalCompensation(Salary) AS TotalCompensation
FROM Employees;
GO