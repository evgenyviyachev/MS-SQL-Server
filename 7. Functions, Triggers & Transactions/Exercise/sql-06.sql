 CREATE PROC usp_EmployeesBySalaryLevel @levelOfSalary VARCHAR(10)
     AS
 SELECT FirstName, LastName FROM Employees
  WHERE @levelOfSalary = (SELECT ufn_GetSalaryLevel(CONVERT(MONEY, Salary))