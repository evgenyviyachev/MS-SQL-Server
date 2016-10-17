CREATE PROC usp_WithdrawMoney(@AccountId INT, @moneyAmount MONEY)
AS
BEGIN
	BEGIN TRAN
		UPDATE Accounts
		SET Balance -= @moneyAmount
		WHERE Accounts.Id = @AccountId

		IF NOT EXISTS (SELECT Id FROM Accounts WHERE Id = @AccountId)
			BEGIN
					RAISERROR('This account does not exist',16,1)
					ROLLBACK
			END
		ELSE IF ((SELECT Balance FROM Accounts WHERE Id = @AccountId) < 0)
			BEGIN
					RAISERROR('Funds not sufficient',16,1)
					ROLLBACK
			END
		ELSE
			BEGIN
					COMMIT
			END
END