CREATE TRIGGER tr_Flights
ON Flights
INSTEAD OF UPDATE
AS
BEGIN

		DECLARE @FlightID INT = (SELECT FlightID FROM inserted)
		DECLARE @Status VARCHAR(9) = (SELECT [Status] FROM inserted)

		UPDATE Flights
		   SET [Status] = @Status
		 WHERE FlightID = @FlightID

		IF (@Status = 'Arrived')
			BEGIN
					DECLARE @ArrivalTime DATETIME = (SELECT ArrivalTime FROM inserted)
					DECLARE @Origin VARCHAR(50) = (SELECT a.AirportName FROM inserted AS i
													INNER JOIN Airports AS a
													   ON i.OriginAirportID = a.AirportID)

					DECLARE @Destination VARCHAR(50) = (SELECT a.AirportName FROM inserted AS i
														 INNER JOIN Airports AS a
														    ON i.DestinationAirportID = a.AirportID)

					DECLARE @Passengers INT = (SELECT COUNT(c.CustomerID) FROM Customers AS c
												INNER JOIN Tickets AS t
												   ON t.CustomerID = c.CustomerID
												INNER JOIN Flights AS f
												   ON t.FlightID = f.FlightID
												  AND f.FlightID = @FlightID)

					INSERT INTO ArrivedFlights (FlightID, ArrivalTime, Origin, Destination, Passengers)
					VALUES (@FlightID, @ArrivalTime, @Origin, @Destination, @Passengers)
			  END
END