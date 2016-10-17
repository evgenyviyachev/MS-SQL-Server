CREATE PROC usp_GetEmployeesSalaryAboveNumber @Sal MONEY
    AS
SELECT FirstName, LastName FROM Employees
 WHERE Salary >= @Sal