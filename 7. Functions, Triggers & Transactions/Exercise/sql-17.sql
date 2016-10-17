CREATE TRIGGER tr_Logs
ON Logs
AFTER INSERT
AS
BEGIN
	INSERT INTO [dbo].[NotificationEmails] (Recipient, [Subject], Body)
	SELECT i.AccountId, CONCAT('Balance change for account: ', i.AccountId),
	CONCAT('On ', CONVERT(NVARCHAR(20),GETDATE(),100), ' your balance was changed from ', i.OldSum, ' to ', i.NewSum)
	FROM inserted AS i
END