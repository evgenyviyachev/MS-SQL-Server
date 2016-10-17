CREATE TRIGGER tr_RestrictItems
ON UserGameItems
INSTEAD OF UPDATE
AS
BEGIN
	DECLARE @itemLevel INT =  (SELECT MinLevel FROM Items
								INNER JOIN inserted AS i
								   ON i.ItemId = Items.Id)

	DECLARE @userLEVER INT =  (SELECT [Level] FROM UsersGames
								INNER JOIN inserted AS i
								   ON i.UserGameId = UsersGames.Id)

	DECLARE @itemPrice MONEY = (SELECT Price FROM Items
								 INNER JOIN inserted AS i
								    ON i.ItemId = Items.Id)

	DECLARE @userMoney MONEY =  (SELECT Cash FROM UsersGames
								INNER JOIN inserted AS i
								   ON i.UserGameId = UsersGames.Id)

	IF (@userLEVER >= @itemLevel AND @itemPrice <= @userMoney)
		BEGIN
				INSERT INTO UserGameItems (ItemId, UserGameId)
				SELECT * FROM inserted

				UPDATE UsersGames
				   SET Cash -= @itemPrice
				 WHERE GameId = (SELECT UserGameId FROM inserted)
		  END
END