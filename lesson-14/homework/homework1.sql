 
DECLARE @HTML NVARCHAR(MAX);

SET @HTML = 
    N'<html>
        <head>
            <style>
                table { border-collapse: collapse; width: 100%; font-family: Arial, sans-serif; }
                th, td { border: 1px solid black; padding: 8px; text-align: left; }
                th { background-color: #f2f2f2; }
            </style>
        </head>
        <body>
            <h3>Index Metadata</h3>
            <table>
                <tr>
                    <th>Table Name</th>
                    <th>Index Name</th>
                    <th>Index Type</th>
                    <th>Column Name</th>
                </tr>';

SELECT @HTML = @HTML + 
    N'<tr>
        <td>' + t.name + '</td>
        <td>' + i.name + '</td>
        <td>' + i.type_desc + '</td>
        <td>' + c.name + '</td>
    </tr>'
FROM sys.indexes i
JOIN sys.objects t ON i.object_id = t.object_id
JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
JOIN sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
WHERE t.type = 'U';

SET @HTML = @HTML + N'</table></body></html>';

-- Sending email using Database Mail
EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'Sanjarbek',  -- Profile nomini o'zgartiring
    @recipients = 'gsanjarbek1024@gmail.com',
    @subject = 'SQL Server Index Metadata',
    @body = @HTML,
    @body_format = 'HTML';


-- I think it works, because in my laptop, i cannot execute. Because of my SQL server express edition, I cannot open an account and a profile. I try to understand the syntaxis.