DECLARE @boughtItems TABLE (ItemName NVARCHAR(50) NOT NULL)

DECLARE @userLevel INT = (SELECT ug.[Level] FROM UsersGames AS ug
						INNER JOIN Users AS u
							ON ug.UserId = u.Id
							AND u.Username = 'Stamat'
						INNER JOIN Games AS g
							ON g.Id = ug.GameId
							AND g.[Name] = 'Safflower')

DECLARE @userMoney MONEY = (SELECT ug.Cash FROM UsersGames AS ug
						INNER JOIN Users AS u
							ON ug.UserId = u.Id
							AND u.Username = 'Stamat'
						INNER JOIN Games AS g
							ON g.Id = ug.GameId
							AND g.[Name] = 'Safflower')

DECLARE @userId INT = (SELECT ug.UserId FROM UsersGames AS ug
						INNER JOIN Users AS u
							ON ug.UserId = u.Id
							AND u.Username = 'Stamat'
						INNER JOIN Games AS g
							ON g.Id = ug.GameId
							AND g.[Name] = 'Safflower')

DECLARE @userGameId INT = (SELECT ug.Id FROM UsersGames AS ug
						INNER JOIN Users AS u
							ON ug.UserId = u.Id
							AND u.Username = 'Stamat'
						INNER JOIN Games AS g
							ON g.Id = ug.GameId
							AND g.[Name] = 'Safflower')

BEGIN TRAN

	DECLARE @totalSum MONEY = (SELECT SUM(Price) FROM Items WHERE MinLevel IN (11,12))

	INSERT INTO @boughtItems
	SELECT [Name] FROM Items
		WHERE MinLevel IN (11,12)
		 		
		INSERT INTO UserGameItems
		SELECT Id, @userGameId FROM Items
		WHERE MinLevel IN (11,12)
		   	
	IF (@totalSum > @userMoney OR @userLevel < 12)
		BEGIN
				ROLLBACK
			END
	ELSE
		BEGIN
				UPDATE UsersGames
					SET Cash -= @totalSum
					WHERE UserId = @userId

				COMMIT
			END

BEGIN TRAN

	DECLARE @totalSum2 MONEY = (SELECT SUM(Price) FROM Items WHERE MinLevel IN (19,20,21))

	INSERT INTO @boughtItems
	SELECT [Name] FROM Items
		WHERE MinLevel IN (19,20,21)		

		INSERT INTO UserGameItems
		SELECT Id, @userGameId FROM Items
		WHERE MinLevel IN (19,20,21)
		   	
	IF (@totalSum2 > @userMoney OR @userLevel < 21)
		BEGIN
				ROLLBACK
			END
	ELSE
		BEGIN
				UPDATE UsersGames
					SET Cash -= @totalSum2
					WHERE UserId = @userId

				COMMIT
			END

SELECT i.[Name] FROM Items AS i
	INNER JOIN UserGameItems AS ugi
	ON i.Id = ugi.ItemId
	WHERE ugi.UserGameId = @userGameId