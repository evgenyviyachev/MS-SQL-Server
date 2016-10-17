SELECT FirstName + ' ' + MiddleName + ' ' + LastName AS 'Full Name' FROM Employees
WHERE Salary IN (25000, 14000, 12500, 23600)

SELECT * FROM Employees
ORDER BY Salary DESC, FirstName ASC, LastName DESC, MiddleName ASC