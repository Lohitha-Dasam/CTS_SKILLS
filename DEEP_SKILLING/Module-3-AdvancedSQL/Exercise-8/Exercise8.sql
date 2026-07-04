-- =====================================================
-- Module 3 - Advanced SQL Using SQL Server
-- Exercise 8 - Exception Handling
-- Part 1 (Questions 1-3)
-- =====================================================

USE Cognizant_SQL_Exception;
GO

---------------------------------------------------------
-- Drop Procedure if exists
---------------------------------------------------------

DROP PROCEDURE IF EXISTS AddEmployee;
GO

---------------------------------------------------------
-- Question 1
-- TRY...CATCH with Error Logging
---------------------------------------------------------

CREATE PROCEDURE AddEmployee
(
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Email VARCHAR(100),
    @Salary DECIMAL(10,2),
    @DepartmentID INT
)
AS
BEGIN

BEGIN TRY

INSERT INTO Employees
(
EmployeeID,
FirstName,
LastName,
Email,
Salary,
DepartmentID
)

VALUES
(
@EmployeeID,
@FirstName,
@LastName,
@Email,
@Salary,
@DepartmentID
);

PRINT 'Employee Added Successfully';

END TRY

BEGIN CATCH

INSERT INTO AuditLog
(
Action,
ErrorMessage
)

VALUES
(
'Add Employee',
ERROR_MESSAGE()
);

PRINT 'Error Logged';

END CATCH

END;
GO

---------------------------------------------------------
-- Test Question 1
---------------------------------------------------------

EXEC AddEmployee
105,
'Kevin',
'Roy',
'kevin@gmail.com',
45000,
2;
GO

---------------------------------------------------------
-- Question 2
-- THROW
---------------------------------------------------------

ALTER PROCEDURE AddEmployee
(
@EmployeeID INT,
@FirstName VARCHAR(50),
@LastName VARCHAR(50),
@Email VARCHAR(100),
@Salary DECIMAL(10,2),
@DepartmentID INT
)
AS
BEGIN

BEGIN TRY

INSERT INTO Employees
(
EmployeeID,
FirstName,
LastName,
Email,
Salary,
DepartmentID
)

VALUES
(
@EmployeeID,
@FirstName,
@LastName,
@Email,
@Salary,
@DepartmentID
);

END TRY

BEGIN CATCH

INSERT INTO AuditLog
(
Action,
ErrorMessage
)

VALUES
(
'THROW',
ERROR_MESSAGE()
);

THROW;

END CATCH

END;
GO

---------------------------------------------------------
-- Test THROW
---------------------------------------------------------

EXEC AddEmployee
105,
'Kevin',
'Roy',
'kevin@gmail.com',
45000,
2;
GO

---------------------------------------------------------
-- Question 3
-- RAISERROR
---------------------------------------------------------

ALTER PROCEDURE AddEmployee
(
@EmployeeID INT,
@FirstName VARCHAR(50),
@LastName VARCHAR(50),
@Email VARCHAR(100),
@Salary DECIMAL(10,2),
@DepartmentID INT
)
AS
BEGIN

IF @Salary<=0
BEGIN

RAISERROR
(
'Salary must be greater than zero.',
16,
1
);

RETURN;

END

BEGIN TRY

INSERT INTO Employees
(
EmployeeID,
FirstName,
LastName,
Email,
Salary,
DepartmentID
)

VALUES
(
@EmployeeID,
@FirstName,
@LastName,
@Email,
@Salary,
@DepartmentID
);

END TRY

BEGIN CATCH

INSERT INTO AuditLog
(
Action,
ErrorMessage
)

VALUES
(
'RAISERROR',
ERROR_MESSAGE()
);

END CATCH

END;
GO

---------------------------------------------------------
-- Test RAISERROR
---------------------------------------------------------

EXEC AddEmployee
106,
'Alex',
'Joseph',
'alex@gmail.com',
-1000,
2;
GO

---------------------------------------------------------
-- View Audit Log
---------------------------------------------------------

SELECT *
FROM AuditLog;
GO

---------------------------------------------------------
-- Question 4
-- Nested TRY...CATCH
---------------------------------------------------------

DROP PROCEDURE IF EXISTS TransferEmployee;
GO

CREATE PROCEDURE TransferEmployee
(
    @EmployeeID INT,
    @DepartmentID INT
)
AS
BEGIN

BEGIN TRY

    BEGIN TRY

        IF NOT EXISTS
        (
            SELECT *
            FROM Departments
            WHERE DepartmentID=@DepartmentID
        )
        BEGIN

            RAISERROR
            (
                'Department does not exist.',
                16,
                1
            );

        END

        UPDATE Employees

        SET DepartmentID=@DepartmentID

        WHERE EmployeeID=@EmployeeID;

    END TRY

    BEGIN CATCH

        INSERT INTO AuditLog
        (
            Action,
            ErrorMessage
        )

        VALUES
        (
            'Transfer Employee',
            ERROR_MESSAGE()
        );

        THROW;

    END CATCH

END TRY

BEGIN CATCH

    PRINT ERROR_MESSAGE();

END CATCH

END;
GO

---------------------------------------------------------
-- Test Question 4
---------------------------------------------------------

EXEC TransferEmployee
105,
99;
GO

---------------------------------------------------------
-- Question 5
-- Transaction
---------------------------------------------------------

DROP PROCEDURE IF EXISTS BatchInsertEmployees;
GO

CREATE PROCEDURE BatchInsertEmployees
AS
BEGIN

BEGIN TRY

BEGIN TRANSACTION;

INSERT INTO Employees
(
EmployeeID,
FirstName,
LastName,
Email,
Salary,
DepartmentID
)

VALUES
(
106,
'Tom',
'Jerry',
'tom@gmail.com',
50000,
1
);

INSERT INTO Employees
(
EmployeeID,
FirstName,
LastName,
Email,
Salary,
DepartmentID
)

VALUES
(
107,
'Jerry',
'Mouse',
'tom@gmail.com',
52000,
2
);

COMMIT TRANSACTION;

END TRY

BEGIN CATCH

ROLLBACK TRANSACTION;

INSERT INTO AuditLog
(
Action,
ErrorMessage
)

VALUES
(
'Batch Insert',
ERROR_MESSAGE()
);

PRINT 'Transaction Rolled Back';

END CATCH

END;
GO

EXEC BatchInsertEmployees;
GO

---------------------------------------------------------
-- Question 6
-- Severity Levels
---------------------------------------------------------

ALTER PROCEDURE AddEmployee
(
@EmployeeID INT,
@FirstName VARCHAR(50),
@LastName VARCHAR(50),
@Email VARCHAR(100),
@Salary DECIMAL(10,2),
@DepartmentID INT
)
AS
BEGIN

IF @Salary<0
BEGIN

RAISERROR
(
'Negative Salary Not Allowed',
16,
1
);

RETURN;

END

IF @Salary<1000
BEGIN

RAISERROR
(
'Salary is very low.',
10,
1
);

END

BEGIN TRY

INSERT INTO Employees
(
EmployeeID,
FirstName,
LastName,
Email,
Salary,
DepartmentID
)

VALUES
(
@EmployeeID,
@FirstName,
@LastName,
@Email,
@Salary,
@DepartmentID
);

END TRY

BEGIN CATCH

INSERT INTO AuditLog
(
Action,
ErrorMessage
)

VALUES
(
'Severity Test',
ERROR_MESSAGE()
);

END CATCH

END;
GO

---------------------------------------------------------
-- Test Question 6
---------------------------------------------------------

EXEC AddEmployee
108,
'Low',
'Salary',
'low@gmail.com',
500,
1;
GO

EXEC AddEmployee
109,
'Negative',
'Salary',
'negative@gmail.com',
-100,
1;
GO

---------------------------------------------------------
-- Display Audit Log
---------------------------------------------------------

SELECT *
FROM AuditLog;
GO