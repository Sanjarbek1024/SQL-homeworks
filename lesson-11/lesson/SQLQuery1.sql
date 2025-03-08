USE class11;
GO

declare @txt varchar(max); --= 'Test';

--set @txt = 'Nimadur';

select @txt = 9;
select @txt 

CREATE TABLE EMP
(
	ID INT PRIMARY KEY IDENTITY,
	NAME VARCHAR(50)
);
INSERT INTO EMP(NAME) VALUES ('JACFK')

--=============
--BUILT IN VARIABLE

SELECT @@SERVERNAME	-- : Sanjarbek\SQLEXPRESS
SELECT @@IDENTITY -- : 

select @@ROWCOUNT
select @@ERROR

select @@VERSION -- Microsoft SQL Server 2022 (RTM) - 16.0.1000.6 (X64)   Oct  8 2022 05:58:25   Copyright (C) 2022 Microsoft Corporation  Express Edition (64-bit) on Windows 10 Pro 10.0 <X64> (Build 26100: ) 

select @@TRANCOUNT

select * from emp;

begin tran t1
insert into emp(name)
values ('adam')

commit tran t1
rollback tran t1

--The ROLLBACK TRANSACTION request has no corresponding BEGIN TRANSACTION.



--===========================================================
-- TABLE VARIABLE
--===========================================================



DECLARE @dept table (
	id int,
	name varchar(50)
);
insert into @dept
values (1, 'hr'), (2, 'it');

select * into newtable from @dept

select * from newtable



























