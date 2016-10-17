SELECT SUM(Fin.Diff) AS 'SumDifference'
FROM 
(
	   SELECT Id, DepositAmount,
	   Wd.DepositAmount -
       COALESCE((SELECT TOP 1 Wd2.DepositAmount
       FROM WizzardDeposits AS Wd2
       WHERE Wd2.Id > Wd.Id), 0) AS Diff
	   FROM WizzardDeposits AS Wd
	   WHERE Id < (SELECT MAX(Id) FROM WizzardDeposits))
AS Fin