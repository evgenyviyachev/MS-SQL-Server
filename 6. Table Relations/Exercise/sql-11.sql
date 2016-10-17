SELECT DISTINCT TOP 3 e.EmployeeID, e.FirstName
  FROM Employees AS e
  FULL JOIN EmployeesProjects AS ep
    ON ep.EmployeeID = e.EmployeeID
 WHERE ep.ProjectID IS NULL
   AND e.EmployeeID IS NOT NULL
 ORDER BY e.EmployeeID ASC