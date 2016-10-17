SELECT c.CityName, b.[Name], COUNT(e.EmployeeID) AS EmployeesCount FROM Employees AS e
 INNER JOIN Branches AS b
    ON b.BranchID = e.BranchID
 INNER JOIN Cities AS c
    ON b.CityID = c.CityID
 WHERE c.CityID NOT IN (4,5)
 GROUP BY c.CityName, b.[Name]
HAVING COUNT(e.EmployeeID) > 2