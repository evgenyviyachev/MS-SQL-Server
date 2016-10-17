 CREATE PROC usp_GetHoldersWithBalanceHigherThan(@balance FLOAT)
     AS
  BEGIN
 SELECT sub.FirstName, sub.LastName FROM
(SELECT ah.FirstName, ah.LastName, SUM(a.Balance) AS TotalBalance
   FROM [dbo].[AccountHolders] AS ah
  INNER JOIN [dbo].[Accounts] AS a
     ON ah.Id = a.AccountHolderId
  GROUP BY ah.FirstName, ah.LastName
 HAVING SUM(a.Balance) > @balance) AS sub
    END