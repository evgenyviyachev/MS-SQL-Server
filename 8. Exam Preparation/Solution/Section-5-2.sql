 CREATE TRIGGER tr_AccountLogs
     ON Accounts
INSTEAD OF DELETE
     AS
  BEGIN
  
DECLARE @accountID INT = (SELECT AccountID FROM deleted)
   
 DELETE FROM EmployeesAccounts
  WHERE AccountID = @accountID
   
 DELETE FROM Accounts
  WHERE AccountID = @accountID

 INSERT INTO AccountLogs (AccountID, AccountNumber, StartDate, CustomerID)
 SELECT AccountID, AccountNumber, StartDate, CustomerID
   FROM deleted
  
    END