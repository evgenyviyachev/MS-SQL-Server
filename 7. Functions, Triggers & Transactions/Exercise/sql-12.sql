CREATE PROC usp_CalculateFutureValueForAccount(@accountId INT, @rate FLOAT)
    AS
 BEGIN
SELECT a.Id AS 'Account Id',
       ah.FirstName AS 'First Name',
	   ah.LastName AS 'Last Name',
	   a.Balance AS 'Current Balance',
	   dbo.ufn_CalculateFutureValue(a.Balance, @rate, 5) AS 'Balance in 5 years'
  FROM AccountHolders AS ah
 INNER JOIN Accounts AS a
    ON a.AccountHolderId = ah.Id
   AND ah.Id = @accountId
   END