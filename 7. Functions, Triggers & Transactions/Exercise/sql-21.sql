SELECT SUBSTRING(Email, CHARINDEX('@',Email) + 1, LEN(Email)-CHARINDEX('@',Email)) AS 'Email Provider',
       COUNT(Username) 
  FROM Users
 GROUP BY SUBSTRING(Email, CHARINDEX('@',Email) + 1, LEN(Email)-CHARINDEX('@',Email))
 ORDER BY 2 DESC, 1
