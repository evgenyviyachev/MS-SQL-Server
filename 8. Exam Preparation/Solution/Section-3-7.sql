SELECT TOP 3 e.FirstName, c.CityName FROM Employees AS e
 INNER JOIN Branches AS b
    ON e.BranchID = b.BranchID
 INNER JOIN Cities AS c
    ON c.CityID = b.CityID
 UNION ALL
SELECT TOP 3 cust.FirstName, c.CityName FROM Customers AS cust
 INNER JOIN Cities AS c
    ON cust.CityID = c.CityID