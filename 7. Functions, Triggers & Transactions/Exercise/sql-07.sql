 CREATE FUNCTION ufn_IsWordComprised(@setOfLetters NVARCHAR(MAX), @word NVARCHAR(MAX))
RETURNS BIT
     AS
  BEGIN
DECLARE @result BIT, @helper NVARCHAR(MAX)
    SET @result = 1
	SET @helper = ''
  WHILE (@word IS NOT NULL) 
  BEGIN
    SET @helper = LEFT(@word, 1)
	IF CHARINDEX(@helper,@setOfLetters,1) <= 0
	SET @result = 0
	 IF LEN(@word) = 1
    	SET @word = NULL
	 IF LEN(@word) > 1
	SET @word = SUBSTRING(@word,2,LEN(@word)-1)
    END
 RETURN @result
    END

SELECT [dbo].[ufn_IsWordComprised]('ab','bae')