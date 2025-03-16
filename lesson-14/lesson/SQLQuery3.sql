
select * from msdb.dbo.sysmail_allitems


exec msdb.dbo.sp_send_dbmail
	@profile_name = '',
	@recipients = '',
	@subject = '',
	@body = '',
	@body_format = 'html'





