SELECT DISTINCT c.CustomerID, c.FirstName + ' ' + c.LastName AS FullName, t2.TownName AS HomeTown FROM Customers AS c
 INNER JOIN Tickets AS t
    ON t.CustomerID = c.CustomerID
 INNER JOIN Flights AS f
    ON t.FlightID = f.FlightID
 INNER JOIN Airports AS a
    ON f.OriginAirportID = a.AirportID
 INNER JOIN Towns AS t1
    ON t1.TownID = a.TownID
 INNER JOIN Towns AS t2
    ON t2.TownID = c.HomeTownID
   AND t2.TownID = t1.TownID
 ORDER BY c.CustomerID