SELECT t.TicketID, a.AirportName AS Destination, c.FirstName + ' ' + c.LastName AS CustomerName FROM Tickets AS t
 INNER JOIN Flights AS f
    ON t.FlightID = f.FlightID
 INNER JOIN Customers AS c
    ON t.CustomerID = c.CustomerID
 INNER JOIN Airports AS a
    ON a.AirportID = f.DestinationAirportID
 WHERE t.Price < 5000
   AND t.Class = 'First'
 ORDER BY t.TicketID