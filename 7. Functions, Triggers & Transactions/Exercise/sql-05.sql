 CREATE FUNCTION ufn_GetSalaryLevel(@salary MONEY)
RETURNS VARCHAR(10) AS
  BEGIN
DECLARE @result VARCHAR(10)
     IF @salary < 30000
  BEGIN
		SET @result = 'Low'
    END
     IF @salary BETWEEN 30000 AND 50000
  BEGIN
		SET @result = 'Average'
    END
     IF @salary > 50000
  BEGIN
		SET @result = 'High'
    END
 RETURN (@result)
	END