UPDATE Countries
   SET CountryName = 'Burma'
 WHERE CountryName = 'Myanmar'

INSERT INTO Monasteries ([Name], CountryCode)
VALUES ('Hanga Abbey', 'TZ')

SELECT con.ContinentName, c.CountryName, COUNT(mon.Id) AS MonasteriesCount
  FROM Continents AS con
  LEFT JOIN Countries AS c
    ON c.ContinentCode = con.ContinentCode
  LEFT JOIN Monasteries AS mon
    ON mon.CountryCode = c.CountryCode
 WHERE c.IsDeleted IS NULL
 GROUP BY c.CountryName, con.ContinentName
 ORDER BY COUNT(mon.Id) DESC, c.CountryName
