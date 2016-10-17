CREATE TRIGGER tr_Employees
ON Employees
AFTER INSERT
AS
	BEGIN
				
			DECLARE @NewEmployeeID INT = (SELECT EmployeeID FROM inserted)

			DECLARE @PrevEmployeeID INT = (SELECT EmployeeID FROM inserted) - 1

			DECLARE @PrevEmployeeLoanID INT = (SELECT TOP 1 el.LoanID FROM Employees AS e
												INNER JOIN EmployeesLoans AS el
												   ON el.EmployeeID = e.EmployeeID
												WHERE el.EmployeeID = @PrevEmployeeID)

			INSERT INTO EmployeesLoans (EmployeeID, LoanID)
			VALUES (@NewEmployeeID, @PrevEmployeeLoanID)
	END