-- FUNCTIONS
-- 1. Scalar function
-- 2. Table valued function
	-- 2.1 Inline
	-- 2.2 Multiline
go
create function myfunction()
returns int
as 
begin
	return 11
end;
go

go
alter function makesquere(@num int = null)
returns int
as
begin
	return iif(@num is null, 0, @num * @num)
end;

 
select dbo.myfunction(), dbo.makesquere(empid) from [TSQLV6].[HR].[Employees]


-- 888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888


-- 

declare @str varchar(max) = '            demo        ';
select @str			-- '            demo        '
select trim(@str)	-- 'demo'

--*************************************************

create table emails
(
	id int,
	email varchar(255)
);

insert into emails
values 
	(1, 'example1@gmail.com'),
	(2, 'example2@gmail.com
	'),
	(3, 'example3@gmail.com
'),
	(4, '	example4@gmail.com')

select *, trim(replace(replace(email, char(13), ''), char(9), ''))
from emails

select char(9)
select ascii('')

--*************************************************************************************

---- TABLE VALUED FUNCTION

-- 2.1 Inline function

alter function my_tvf(@store int)
returns table
as 
return(
	select * from [TSQLV6].[HR].[Employees] where mgrid = @store
)

select * from dbo.my_tvf(1)




