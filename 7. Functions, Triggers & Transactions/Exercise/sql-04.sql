CREATE PROC usp_GetEmployeesFromTown @TownName VARCHAR(50)
    AS
SELECT FirstName, LastName FROM Employees AS e
 INNER JOIN Addresses AS a
    ON a.AddressID = e.AddressID
 INNER JOIN Towns AS t
    ON t.TownID = a.TownID
 WHERE t.Name = @TownName