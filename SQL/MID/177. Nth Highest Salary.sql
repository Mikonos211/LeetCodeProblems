CREATE FUNCTION getNthHighestSalary(@N INT) 
RETURNS INT 
AS
BEGIN
    DECLARE @result INT;
    IF @N <= 0 
    BEGIN
        SET @result = NULL;
        RETURN @result;
    END

    IF @N > (SELECT COUNT(DISTINCT salary) FROM Employee)
    BEGIN
        SET @result = NULL;
        RETURN @result;
    END

    SELECT @result = salary
    FROM (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        OFFSET (@N - 1) ROWS FETCH NEXT 1 ROWS ONLY
    ) AS Temp;
    RETURN @result;
END;
