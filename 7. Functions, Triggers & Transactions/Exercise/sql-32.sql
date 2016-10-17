SELECT con.ContinentName,
	   SUM(CONVERT(BIGINT, c.AreaInSqKm)) AS CountriesArea,
	   SUM(CONVERT(BIGINT, c.[Population])) AS CountriesPopulation
  FROM Continents AS con
 INNER JOIN Countries AS c
    ON c.ContinentCode = con.ContinentCode
 GROUP BY con.ContinentName
 ORDER BY SUM(CONVERT(BIGINT, c.[Population])) DESC