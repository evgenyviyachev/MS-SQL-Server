CREATE FUNCTION udf_ConcatString(@firstStr VARCHAR(MAX), @secondStr VARCHAR(MAX))
RETURNS VARCHAR(MAX)
AS
	BEGIN
		
		DECLARE @firstStrRev VARCHAR(MAX) = REVERSE(@firstStr)
		DECLARE @secondStrRev VARCHAR(MAX) = REVERSE(@secondStr)

		RETURN CONCAT(@firstStrRev, @secondStrRev)
	END