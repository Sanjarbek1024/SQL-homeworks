
CREATE PROCEDURE GetProceduresAndFunctionsInfo
    @DatabaseName NVARCHAR(255) = NULL  -- Optional parameter
AS
BEGIN
    SET NOCOUNT ON;

    -- Create a temporary table to store the results
    CREATE TABLE #TempResult (
        DatabaseName NVARCHAR(255),
        SchemaName NVARCHAR(255),
        RoutineName NVARCHAR(255),
        ParameterName NVARCHAR(255),
        DataType NVARCHAR(255)
    );

    DECLARE @sql NVARCHAR(MAX) = N'';

    -- If a specific database is provided
    IF @DatabaseName IS NOT NULL
    BEGIN
        SET @sql = N'
        INSERT INTO #TempResult
        SELECT 
            ''' + @DatabaseName + ''' AS DatabaseName,
            SPECIFIC_SCHEMA AS SchemaName,
            SPECIFIC_NAME AS RoutineName,
            PARAMETER_NAME AS ParameterName,
            DATA_TYPE + 
                COALESCE(
                    ''('' + 
                    CASE 
                        WHEN CHARACTER_MAXIMUM_LENGTH = -1 THEN ''MAX''
                        ELSE CAST(CHARACTER_MAXIMUM_LENGTH AS NVARCHAR)
                    END + '')'', 
                    ''''
                ) AS DataType
        FROM ' + QUOTENAME(@DatabaseName) + '.INFORMATION_SCHEMA.PARAMETERS';

        EXEC sp_executesql @sql;
    END
    ELSE
    BEGIN
        -- If no database is specified, retrieve from all user databases
        SELECT @sql = @sql + '
        INSERT INTO #TempResult
        SELECT 
            ''' + name + ''' AS DatabaseName,
            SPECIFIC_SCHEMA AS SchemaName,
            SPECIFIC_NAME AS RoutineName,
            PARAMETER_NAME AS ParameterName,
            DATA_TYPE + 
                COALESCE(
                    ''('' + 
                    CASE 
                        WHEN CHARACTER_MAXIMUM_LENGTH = -1 THEN ''MAX''
                        ELSE CAST(CHARACTER_MAXIMUM_LENGTH AS NVARCHAR)
                    END + '')'', 
                    ''''
                ) AS DataType
        FROM ' + QUOTENAME(name) + '.INFORMATION_SCHEMA.PARAMETERS;'
        FROM sys.databases 
        WHERE name NOT IN ('master', 'tempdb', 'model', 'msdb') 
        AND state_desc = 'ONLINE';

        EXEC sp_executesql @sql;
    END

    -- Retrieve the final results
    SELECT * FROM #TempResult;

    -- Drop the temporary table to free memory
    DROP TABLE #TempResult;
END;


EXEC GetProceduresAndFunctionsInfo;

EXEC GetProceduresAndFunctionsInfo @DatabaseName = 'class12';


