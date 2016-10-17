 CREATE FUNCTION ufn_CashInUsersGames(@GameName NVARCHAR(50))
RETURNS @rtnTable TABLE (SumCash MONEY)
AS 
BEGIN
 DECLARE @tempTable TABLE ([Row] INT, Cash MONEY)
  
 INSERT INTO @tempTable
 SELECT ROW_NUMBER() OVER(ORDER BY ug.Cash DESC), ug.Cash FROM UsersGames AS ug
  INNER JOIN Games AS g
     ON g.Id = ug.GameId
  WHERE g.[Name] = @GameName  

 INSERT INTO @rtnTable (SumCash)
 SELECT SUM(Cash) FROM @tempTable
  WHERE [Row] % 2 = 1

 RETURN
END
