CREATE PROC usp_GetTownsStartingWith @Start NVARCHAR(MAX)
    AS
SELECT [Name] AS Town FROM Towns
 WHERE SUBSTRING([Name],1,LEN(@Start)) = @Start