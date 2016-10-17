SELECT TOP 5 c.CountryName AS 'Country', 
       CASE
	   WHEN p.PeakName IS NULL THEN '(no highest peak)'
	   ELSE p.PeakName
	   END AS 'HighestPeakName',
	   CASE
	   WHEN p.PeakName IS NULL THEN '0'
	   ELSE p.Elevation 
	   END AS 'HighestPeakElevation',
	   CASE
	   WHEN p.PeakName IS NULL THEN '(no mountain)'
	   ELSE m.MountainRange
	   END AS 'Mountain'
  FROM Countries AS c
  LEFT OUTER JOIN MountainsCountries AS mc
    ON mc.CountryCode = c.CountryCode
  LEFT OUTER JOIN Mountains AS m
    ON m.Id = mc.MountainId
  LEFT OUTER JOIN Peaks AS p
    ON p.MountainId = m.Id
   AND p.Elevation = ALL(SELECT MAX(p2.Elevation) FROM Peaks AS p2 INNER JOIN Mountains AS m2 ON p2.MountainId = m2.Id WHERE m2.Id = mc.MountainId)
 ORDER BY Country, HighestPeakName