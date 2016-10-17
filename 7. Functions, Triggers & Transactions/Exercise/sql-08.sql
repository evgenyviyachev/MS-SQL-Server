--Instead of DELETE -> SELECT
SELECT e.FirstName, e.LastName, d.[Name] FROM Employees AS e
 INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID
 WHERE d.[Name] IN ('Production', 'Production Control')
 ORDER BY d.[Name]