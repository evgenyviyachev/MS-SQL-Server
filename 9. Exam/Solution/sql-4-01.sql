CREATE PROC usp_SubmitReview (@CustomerID INT, @ReviewContent TEXT, @ReviewGrade INT, @AirlineName VARCHAR(30))
AS
BEGIN

	BEGIN TRAN

	DECLARE @AirlineID INT = (SELECT AirlineID FROM Airlines
				   WHERE AirlineName = @AirlineName)

	IF (@AirlineID IS NULL)
		BEGIN
				RAISERROR('Airline does not exist.',16,1)
				ROLLBACK
		  END
	ELSE
		BEGIN
			DECLARE @ReviewID INT

			IF NOT EXISTS (SELECT * FROM CustomerReviews)
				BEGIN
						SET @ReviewID = 1
				  END
			ELSE
				BEGIN
						SET @ReviewID = (SELECT TOP 1 ReviewID FROM CustomerReviews ORDER BY ReviewID DESC) + 1
				  END

			INSERT INTO CustomerReviews (ReviewID, ReviewContent, ReviewGrade, AirlineID, CustomerID)
			VALUES (@ReviewID, @ReviewContent, @ReviewGrade, @AirlineID, @CustomerID)
		
			IF (@ReviewGrade NOT BETWEEN 0 AND 10)
				BEGIN
						ROLLBACK
				  END
			ELSE
				BEGIN
						COMMIT
				  END
		  END
END