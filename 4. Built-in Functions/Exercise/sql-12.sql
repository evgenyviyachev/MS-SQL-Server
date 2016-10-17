SELECT TOP(50) [Name] AS Game, CONVERT(VARCHAR(10),[Start],120) AS [Start] FROM Games AS g
WHERE YEAR([Start]) IN (2011, 2012)
ORDER BY g.[Start], Game