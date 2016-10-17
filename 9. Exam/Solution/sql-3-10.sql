SELECT c.CustomerID, 
	   c.FirstName + ' ' + c.LastName AS FullName,
	   DATEDIFF(YEAR,c.DateOfBirth,'2016') AS Age
  FROM Customers AS c
 INNER JOIN Tickets AS t
    ON t.CustomerID = c.CustomerID
 INNER JOIN Flights AS f
    ON t.FlightID = f.FlightID
 WHERE f.[Status] = 'Arrived'
   AND DATEDIFF(YEAR,c.DateOfBirth,'2016') < 21
 ORDER BY Age DESC, c.CustomerID