SELECT cur.CurrencyCode,
	   cur.[Description] AS Currency,
	   COUNT(c.CountryCode) AS NumberOfCountries
  FROM Countries AS c
 RIGHT JOIN Currencies AS cur
    ON cur.CurrencyCode = c.CurrencyCode
 GROUP BY cur.CurrencyCode, cur.[Description]
 ORDER BY COUNT(c.CountryCode) DESC, cur.[Description]