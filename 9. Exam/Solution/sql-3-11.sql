SELECT a.AirportID, a.AirportName, COUNT(c.CustomerID) AS Passengers FROM Airports AS a
 INNER JOIN Flights AS f
    ON f.OriginAirportID = a.AirportID
   AND f.[Status] = 'Departing'
 INNER JOIN Tickets AS t
    ON t.FlightID = f.FlightID
 INNER JOIN Customers AS c
    ON t.CustomerID = c.CustomerID
 GROUP BY a.AirportID, a.AirportName
 ORDER BY a.AirportID