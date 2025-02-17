CREATE TABLE person
(
	name varchar(100),
	birth_date DATE
);

INSERT INTO person
select 'john', '1950-11-7';

select * from person
