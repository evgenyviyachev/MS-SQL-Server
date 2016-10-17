SELECT c.CountryName,
	   con.ContinentName AS Mountain,
	   COUNT(r.Id) AS RiversCount,
	   SUM(ISNULL(r.[Length], 0)) AS TotalLength
  FROM Countries AS c
  LEFT JOIN Continents AS con
    ON c.ContinentCode = con.ContinentCode
  LEFT JOIN CountriesRivers AS cr
    ON cr.CountryCode = c.CountryCode
  LEFT JOIN Rivers AS r
    ON cr.RiverId = r.Id
 GROUP BY c.CountryName, con.ContinentName
 ORDER BY COUNT(r.Id) DESC, SUM(ISNULL(r.[Length], 0)) DESC, c.CountryName