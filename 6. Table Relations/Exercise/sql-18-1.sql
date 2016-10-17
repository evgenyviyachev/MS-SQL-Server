    WITH sub AS ((SELECT con.ContinentCode, cur.CurrencyCode, COUNT(cur.CurrencyCode) AS 'CurrencyUsage'
    FROM Continents AS con
   INNER JOIN Countries AS c
      ON c.ContinentCode = con.ContinentCode
   INNER JOIN Currencies AS cur
      ON c.CurrencyCode = cur.CurrencyCode
   GROUP BY con.ContinentCode, cur.CurrencyCode
  HAVING COUNT(cur.CurrencyCode) > 1))

  SELECT con2.ContinentCode, sub.CurrencyCode, sub.CurrencyUsage AS 'CurrencyUsage' FROM sub
   INNER JOIN Continents AS con2
      ON sub.ContinentCode = con2.ContinentCode
   WHERE sub.CurrencyUsage =
				(SELECT MAX(sub.CurrencyUsage) FROM sub
				  WHERE sub.ContinentCode = con2.ContinentCode)
   ORDER BY ContinentCode