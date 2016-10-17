UPDATE Tickets
   SET Tickets.Price += 0.5 * Tickets.Price
  FROM Flights AS f, Airlines AS a
 WHERE Tickets.FlightID = f.FlightID
   AND f.AirlineID = a.AirlineID
   AND a.Rating = (SELECT MAX(a.Rating) FROM Tickets AS t
		 INNER JOIN Flights AS f
		    ON t.FlightID = f.FlightID
		 INNER JOIN Airlines AS a
		    ON f.AirlineID = a.AirlineID)