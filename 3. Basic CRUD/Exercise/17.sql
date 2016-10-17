CREATE VIEW v_EmployeesNameJobTitle AS
SELECT
	CASE
	WHEN MiddleName IS NOT NULL THEN FirstName + ' ' + MiddleName + ' ' + LastName
	ELSE FirstName + ' ' + '' + ' ' + LastName
	END AS 'Full Name', JobTitle AS 'Job Title'
FROM Employees