--use class12;
--go

--SELECT *
--FROM INFORMATION_SCHEMA.ROUTINES AS R
--JOIN INFORMATION_SCHEMA.PARAMETERS AS P
--	ON R.SPECIFIC_NAME = P.SPECIFIC_NAME

declare @db_name varchar(255);

--open db_cursor2;

--DECLARE db_cursor2 CURSOR FOR 
--SELECT name FROM SYS.databases WHERE name NOT IN ('master', 'tempdb', 'model', 'msdb');

select @db_name
fetch next from db_cursor2 into @db_name;
select @db_name, @@FETCH_STATUS

close db_cursor2 
deallocate db_cursor2



----------------------------


declare @db_name varchar(max);
declare my_cursor cursor for 
SELECT name FROM SYS.databases WHERE name IN ('master', 'tempdb', 'class12');

open my_cursor;

declare @db_name varchar(max);
fetch next from my_cursor into @db_name;
select @db_name, @@FETCH_STATUS;

while @@FETCH_STATUS = 0
begin 
	print @db_name;
	fetch next from my_cursor into @db_name
end
close my_cursor;
deallocate my_cursor;





