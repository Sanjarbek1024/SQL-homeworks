-- SENDING EMAIL


EXEC sp_configure 'Database Mail XPs', 1;
RECONFIGURE;



EXEC msdb.dbo.sp_send_dbmail
	@profile_name = ''