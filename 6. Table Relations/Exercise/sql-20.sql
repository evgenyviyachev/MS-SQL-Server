SELECT TOP 5 c.CountryName, p.Elevation AS HighestPeakElevation, r.[Length] AS LongestRiverLength
  FROM Countries AS c
  LEFT OUTER JOIN MountainsCountries AS mc
    ON mc.CountryCode = c.CountryCode
  LEFT OUTER JOIN Mountains AS m
    ON m.Id = mc.MountainId
  LEFT OUTER JOIN Peaks AS p
    ON p.MountainId = m.Id   
  LEFT OUTER JOIN CountriesRivers AS cr
    ON cr.CountryCode = c.CountryCode
  LEFT OUTER JOIN Rivers AS r
    ON cr.RiverId = r.Id
 WHERE p.Elevation = ALL(SELECT MAX(p2.Elevation) FROM Peaks AS p2 INNER JOIN Mountains AS m2 ON m2.Id=p2.MountainId INNER JOIN MountainsCountries AS mc2 ON mc2.MountainId = m2.Id WHERE mc2.CountryCode = c.CountryCode)
   AND r.[Length] = ALL(SELECT MAX(r2.[Length]) FROM Rivers AS r2 INNER JOIN CountriesRivers AS cr2 ON cr2.RiverId = r2.Id WHERE cr2.CountryCode = c.CountryCode)
 ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, c.CountryName