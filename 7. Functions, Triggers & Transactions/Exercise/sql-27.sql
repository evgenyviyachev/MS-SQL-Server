DECLARE @totalPrice MONEY = (SELECT SUM(Price) FROM Items
							  WHERE [Name] IN ('Blackguard',
											   'Bottomless Potion of Amplification', 
											   'Eye of Etlich (Diablo III)', 
											   'Gem of Efficacious Toxin', 
											   'Golden Gorget of Leoric',
											   'Hellfire Amulet'))

DECLARE @userId INT = (SELECT Id FROM Users WHERE Username = 'Alex')

DECLARE @gameId INT = (SELECT Id FROM Games WHERE [Name] = 'Edinburgh')

DECLARE @userGameId INT = (SELECT Id FROM UsersGames WHERE UserId = @userId AND GameId = @gameId)

UPDATE UsersGames
   SET Cash -= @totalPrice
 WHERE Id = @userGameId

INSERT INTO UserGameItems (ItemId, UserGameId)
SELECT Id, @userGameId FROM Items
 WHERE [Name] IN ('Blackguard',
				  'Bottomless Potion of Amplification', 
			  	  'Eye of Etlich (Diablo III)', 
				  'Gem of Efficacious Toxin', 
			  	  'Golden Gorget of Leoric',
				  'Hellfire Amulet')

SELECT u.Username, g.[Name], ug.Cash, i.[Name] FROM UsersGames AS ug
 INNER JOIN Users AS u
    ON ug.UserId = u.Id
 INNER JOIN Games AS g
    ON g.Id = ug.GameId
 INNER JOIN UserGameItems AS ugi
    ON ugi.UserGameId = ug.Id
 INNER JOIN Items AS i
    ON ugi.ItemId = i.Id
 WHERE g.[Name] = 'Edinburgh'
 ORDER BY i.[Name]