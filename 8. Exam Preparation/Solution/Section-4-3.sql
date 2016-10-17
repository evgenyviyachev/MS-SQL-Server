CREATE PROC usp_TakeLoan (@CustomerID INT, @LoanAmount DECIMAL(18, 2), @Interest DECIMAL(4, 2), @StartDate DATE)
AS
	BEGIN

			BEGIN TRAN

			INSERT INTO Loans (StartDate, Amount, Interest, ExpirationDate, CustomerID)
			VALUES (@StartDate, @LoanAmount, @Interest, NULL, @CustomerID)

			IF (@LoanAmount NOT BETWEEN 0.01 AND 100000)
				BEGIN
						RAISERROR('Invalid Loan Amount.',16,1)
						ROLLBACK
				  END

			IF (@CustomerID != ANY(SELECT CustomerID FROM Loans))
				BEGIN						
						ROLLBACK
				  END

			ELSE
				BEGIN
						COMMIT
				  END

	  END