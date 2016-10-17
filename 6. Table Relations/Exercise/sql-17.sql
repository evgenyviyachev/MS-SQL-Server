SELECT TOP 5 c.CountryName, r.[RiverName]
  FROM Countries AS c
  FULL JOIN CountriesRivers AS cr
    ON cr.CountryCode = c.CountryCode
  FULL JOIN Rivers AS r
    ON r.Id = cr.RiverId
 INNER JOIN Continents AS con
    ON c.ContinentCode = con.ContinentCode
   AND con.ContinentName = 'Africa'
 ORDER BY c.CountryName