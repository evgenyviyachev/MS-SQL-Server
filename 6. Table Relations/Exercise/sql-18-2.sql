SELECT c.ContinentCode, c.CurrencyCode, COUNT(c.CurrencyCode) AS 'CurrencyUsage'
  FROM Countries AS c
 GROUP BY c.ContinentCode, c.CurrencyCode
HAVING COUNT(c.CurrencyCode) >= ALL(SELECT COUNT(c2.CurrencyCode) AS 'Count' 
									  FROM Countries AS c2
									 WHERE c2.ContinentCode = c.ContinentCode
									 GROUP BY c2.ContinentCode, c2.CurrencyCode)
   AND COUNT(c.CurrencyCode) > 1