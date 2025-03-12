-- Task 1:

-- Write an SQL query to retrieve the database name, schema name, table name, column name, and column data type for all tables across all databases in a SQL Server instance. Ensure that system databases (master, tempdb, model, msdb) are excluded from the results.


DECLARE @sql NVARCHAR(MAX) = N'';

-- Build dynamic SQL to query all user databases
SELECT @sql = @sql + '
SELECT 
    ''' + name + ''' AS DatabaseName, 
    TABLE_SCHEMA AS SchemaName, 
    TABLE_NAME AS TableName, 
    COLUMN_NAME AS ColumnName, 
    DATA_TYPE + 
        COALESCE(
            ''('' + 
            CASE 
                WHEN CHARACTER_MAXIMUM_LENGTH = -1 THEN ''MAX''
                ELSE CAST(CHARACTER_MAXIMUM_LENGTH AS NVARCHAR)
            END + '')'', 
            ''''
        ) AS DataType
FROM ' + QUOTENAME(name) + '.INFORMATION_SCHEMA.COLUMNS
UNION ALL '
FROM sys.databases 
WHERE name NOT IN ('master', 'tempdb', 'model', 'msdb')  
AND state_desc = 'ONLINE';

-- Remove the last UNION ALL to avoid syntax error
SET @sql = LEFT(@sql, LEN(@sql) - 10);

-- Execute the dynamically generated SQL
EXEC(@sql);
