SELECT p.PeakName, m.MountainRange, c.CountryName, con.ContinentName AS Mountain FROM Peaks AS p
 INNER JOIN Mountains AS m
    ON p.MountainId = m.Id
 INNER JOIN MountainsCountries AS mc
    ON mc.MountainId = m.Id
 INNER JOIN Countries AS c
    ON mc.CountryCode = c.CountryCode
 INNER JOIN Continents AS con
    ON c.ContinentCode = con.ContinentCode
 ORDER BY p.PeakName, c.CountryName