SELECT c.CountryCode, COUNT(m.MountainRange) AS MountainRanges
  FROM Countries AS c
 INNER JOIN MountainsCountries AS mc
    ON c.CountryCode = mc.CountryCode
   AND c.CountryName IN ('Bulgaria', 'Russia', 'United States')
 INNER JOIN Mountains AS m
    ON m.Id = mc.MountainId
 GROUP BY c.CountryCode