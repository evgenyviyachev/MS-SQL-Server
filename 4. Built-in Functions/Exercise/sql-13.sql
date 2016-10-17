SELECT Username, SUBSTRING(Email, CHARINDEX('@',Email) + 1, LEN(Email)-CHARINDEX('@',Email)) AS 'Email Provider' FROM Users
ORDER BY 2, Username