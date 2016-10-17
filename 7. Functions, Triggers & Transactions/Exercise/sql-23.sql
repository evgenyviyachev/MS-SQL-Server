SELECT sub.Username, sub.Game, COUNT(sub.CountOfItems) AS 'Items Count', sub.PriceOfItems AS 'Items Price'
  FROM
(SELECT u.Username, g.[Name] AS Game, ic.CountOfItems, ip.PriceOfItems
  FROM UsersGames ug
 INNER JOIN Users AS u
    ON u.Id = ug.UserId
 INNER JOIN Games AS g
    ON g.Id = ug.GameId
 INNER JOIN UserGameItems AS ugi
    ON ugi.UserGameId = ug.Id
 INNER JOIN Items AS i
    ON ugi.ItemId = i.Id
 INNER JOIN (SELECT UserGameId, COUNT(ItemId) AS CountOfItems
  FROM UserGameItems
 GROUP BY UserGameId) AS ic
    ON ic.UserGameId = ugi.UserGameId
 INNER JOIN (SELECT UserId, g.Id, SUM(i.Price) AS PriceOfItems
   FROM Users AS u
  INNER JOIN UsersGames AS ug
     ON ug.UserId = u.Id
  INNER JOIN Games AS g
     ON g.Id = ug.GameId
  INNER JOIN UserGameItems AS ugi
     ON ug.Id = ugi.UserGameId
  INNER JOIN Items AS i
     ON i.Id = ugi.ItemId
  GROUP BY UserId, g.Id) AS ip
    ON ip.UserId = u.Id
   AND ip.Id = g.Id) AS sub
 GROUP BY sub.Username, sub.Game, sub.PriceOfItems
HAVING COUNT(sub.CountOfItems) >= 10
 ORDER BY COUNT(sub.CountOfItems) DESC, sub.PriceOfItems DESC, sub.Username