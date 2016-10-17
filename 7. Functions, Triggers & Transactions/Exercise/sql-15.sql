CREATE PROC usp_TransferMoney(@firstAccountId INT, @secondAccountID INT, @moneyAmount MONEY)
AS
BEGIN
	BEGIN TRAN
		UPDATE Accounts
		SET Balance -= @moneyAmount
		WHERE Accounts.Id = @firstAccountId

		UPDATE Accounts
		SET Balance += @moneyAmount
		WHERE Accounts.Id = @secondAccountId

		IF NOT EXISTS (SELECT Id FROM Accounts WHERE Id = @firstAccountId)
			BEGIN
					RAISERROR('First account does not exist',16,1)
					ROLLBACK
			END
		ELSE IF NOT EXISTS (SELECT Id FROM Accounts WHERE Id = @secondAccountId)
			BEGIN
					RAISERROR('Second account does not exist',16,1)
					ROLLBACK
			END
		ELSE IF ((SELECT Balance FROM Accounts WHERE Id = @firstAccountId) < 0)
			BEGIN
					RAISERROR('Funds from first account not sufficient',16,1)
					ROLLBACK
			END
		ELSE IF (@moneyAmount < 0)
			BEGIN
					RAISERROR('Transferred amount can not be negative',16,1)
					ROLLBACK
			END
		ELSE
			BEGIN
					COMMIT
			END
END