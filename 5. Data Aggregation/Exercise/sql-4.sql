SELECT DepositGroup
FROM WizzardDeposits
GROUP BY DepositGroup
HAVING AVG(MagicWandSize) = (SELECT MIN(g.Size) FROM
(SELECT DepositGroup, AVG(MagicWandSize) AS Size
 FROM WizzardDeposits
 GROUP BY DepositGroup) AS g)