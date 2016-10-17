CREATE PROC usp_PurchaseTicket (@CustomerID INT, @FlightID INT, @TicketPrice DECIMAL(8,2), @Class VARCHAR(6), @Seat VARCHAR(5))
AS
BEGIN

		BEGIN TRAN

		DECLARE @TicketID INT

		IF NOT EXISTS (SELECT * FROM Tickets)
			BEGIN
					SET @TicketID = 1
			  END
		ELSE
			BEGIN
					SET @TicketID = (SELECT TOP 1 TicketID FROM Tickets ORDER BY TicketID DESC) + 1
			  END

		INSERT INTO Tickets (TicketID, Price, Class, Seat, CustomerID, FlightID)
		VALUES (@TicketID, @TicketPrice, @Class, @Seat, @CustomerID, @FlightID)

		UPDATE CustomerBankAccounts
		   SET Balance -= @TicketPrice
		 WHERE CustomerID = @CustomerID

		DECLARE @AccountBalance DECIMAL(10,2) = (SELECT Balance FROM CustomerBankAccounts
												  WHERE CustomerID = @CustomerID)

		IF (@TicketPrice > @AccountBalance)
			BEGIN
					RAISERROR('Insufficient bank account balance for ticket purchase.',16,1)
					ROLLBACK
			  END
		ELSE
			BEGIN
					COMMIT
			  END
END