SELECT t.FirstLetter FROM 
(SELECT LEFT(FirstName, 1) AS FirstLetter 
FROM WizzardDeposits
WHERE DepositGroup = 'Troll Chest') AS t
GROUP BY t.FirstLetter
ORDER BY t.FirstLetter