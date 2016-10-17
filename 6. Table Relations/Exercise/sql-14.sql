SELECT e.EmployeeID, e.FirstName, e.ManagerID, e2.FirstName
  FROM Employees AS e
 INNER JOIN Employees AS e2
    ON e.ManagerID = e2.EmployeeID
   AND e.ManagerID IN (3, 7)
 ORDER BY e.EmployeeID ASC