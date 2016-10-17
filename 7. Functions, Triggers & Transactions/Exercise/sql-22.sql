SELECT g.[Name] AS Game, gt.[Name] AS 'Game Type', u.Username, ug.[Level], ug.Cash, c.[Name] AS 'Character'
  FROM UsersGames ug
 INNER JOIN Users AS u
    ON u.Id = ug.UserId
 INNER JOIN Games AS g
    ON g.Id = ug.GameId
 INNER JOIN GameTypes AS gt
    ON g.GameTypeId = gt.Id
 INNER JOIN Characters AS c
    ON ug.CharacterId = c.Id
 ORDER BY ug.[Level] DESC, u.Username, Game