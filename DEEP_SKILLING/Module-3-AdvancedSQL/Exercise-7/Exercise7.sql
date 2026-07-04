-- =====================================================
-- Module 3 - Advanced SQL Using SQL Server
-- Exercise 7 - Cursors
-- =====================================================

USE Cognizant_SQL;
GO

---------------------------------------------------------
-- Exercise 1
-- Simple Cursor
---------------------------------------------------------

DECLARE

@EmployeeID INT,
@FirstName VARCHAR(50),
@LastName VARCHAR(50),
@DepartmentID INT,
@Salary DECIMAL(10,2),
@JoinDate DATE;

DECLARE EmployeeCursor CURSOR
FOR

SELECT
EmployeeID,
FirstName,
LastName,
DepartmentID,
Salary,
JoinDate

FROM Employees;

OPEN EmployeeCursor;

FETCH NEXT FROM EmployeeCursor
INTO
@EmployeeID,
@FirstName,
@LastName,
@DepartmentID,
@Salary,
@JoinDate;

WHILE @@FETCH_STATUS = 0
BEGIN

    PRINT
    'EmployeeID: '
    + CAST(@EmployeeID AS VARCHAR)
    + ' | Name: '
    + @FirstName
    + ' '
    + @LastName
    + ' | Department: '
    + CAST(@DepartmentID AS VARCHAR)
    + ' | Salary: '
    + CAST(@Salary AS VARCHAR);

    FETCH NEXT FROM EmployeeCursor
    INTO
    @EmployeeID,
    @FirstName,
    @LastName,
    @DepartmentID,
    @Salary,
    @JoinDate;

END;

CLOSE EmployeeCursor;

DEALLOCATE EmployeeCursor;
GO

---------------------------------------------------------
-- Exercise 2
-- Static Cursor
---------------------------------------------------------

DECLARE StaticCursor CURSOR STATIC
FOR

SELECT *

FROM Employees;

OPEN StaticCursor;

PRINT 'STATIC CURSOR CREATED';

CLOSE StaticCursor;

DEALLOCATE StaticCursor;
GO

---------------------------------------------------------
-- Dynamic Cursor
---------------------------------------------------------

DECLARE DynamicCursor CURSOR DYNAMIC
FOR

SELECT *

FROM Employees;

OPEN DynamicCursor;

PRINT 'DYNAMIC CURSOR CREATED';

CLOSE DynamicCursor;

DEALLOCATE DynamicCursor;
GO

---------------------------------------------------------
-- Forward Only Cursor
---------------------------------------------------------

DECLARE ForwardCursor CURSOR FORWARD_ONLY
FOR

SELECT *

FROM Employees;

OPEN ForwardCursor;

PRINT 'FORWARD ONLY CURSOR CREATED';

CLOSE ForwardCursor;

DEALLOCATE ForwardCursor;
GO

---------------------------------------------------------
-- Keyset Cursor
---------------------------------------------------------

DECLARE KeysetCursor CURSOR KEYSET
FOR

SELECT *

FROM Employees;

OPEN KeysetCursor;

PRINT 'KEYSET CURSOR CREATED';

CLOSE KeysetCursor;

DEALLOCATE KeysetCursor;
GO

---------------------------------------------------------
-- Display Cursor Types
---------------------------------------------------------

PRINT 'Cursor Comparison';

PRINT 'STATIC CURSOR  -> Snapshot of data';
PRINT 'DYNAMIC CURSOR -> Reflects changes';
PRINT 'FORWARD ONLY   -> Moves only forward';
PRINT 'KEYSET CURSOR  -> Keys are fixed but data changes are visible';
GO