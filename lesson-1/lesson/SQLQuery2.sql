/* CONSTRAINT = Cheklov */


/* 1. NOT NULL Constraint*/
drop table if exists person;
create table person
(
	id int not null,
	name varchar(50)
);

insert into person(id)
values (1);

select * from person;

/* 2. UNIQUEConstraint */

drop table if exists person;
create table person
(
	id int not null unique,
	name varchar(50)
);

insert into person
values
	(1, 'Pupil'),
	(2, 'Porple');

insert into person
select null, 'josh'

select * from person

--if null is null
--begin
--	print 'true'
--end
--else
--begin
--	print 'False'
--end

drop table if exists person;
create table person
(
	id int not null,
	name varchar(50)
);

alter table person
add constraint UC_person_id unique(id)

alter table person
drop constraint [UQ__person__3213E83EEFD3A2F4]

drop table if exists person;
create table person
(
	id int,
	name varchar(50)
);

alter table person
add unique(id, name);

insert into person(id, name)
values (2, 'josh2')

select* from person
--josh
--josh
--Pupil
--ydgsvjc
--josh
--josh2
--Porple

drop table if exists person;
create table person
(
	id int not null,
	name varchar(50)
);

alter table person
add unique(id);

alter table person
add unique(name);

alter table person
add unique(id, name);

insert into person(id, name)
values (1, 'John');

select * from person;

-- Primary key

drop table if exists person;
create table person
(
	id int primary key,
	name varchar(50),
	department int
);

insert into person(id, name, department)
values (13, 'josich', 1);

insert into person(id, name, department)
values (10, 'joshshi', 2);
insert into person(id, name, department)
values (22, 'kimdur', 1);

select * from person;

insert into department
values
	(1, 'hr'),
	(2, 'or'),
	(3, 'pr')


-- next

drop table if exists person;
create table person
(
	id int primary key,
	name varchar(50),
	department_id int
);

insert into person
values (1, 'John', 1);
insert into person
values (2, 'Adam', 2);
insert into person
values (3, 'Anna', 1);

insert into person
values (4, 'Smith', 5);

--select * from person;

create table department
(
	id int primary key,
	name varchar(50)
);

insert into department
values 
	(1	,'HR'),
	(2	,'IT'),
	(3	,'Marketing')

select * from department;
select * from person;


---------------------------------------------------------------------------------

drop table if exists employee;
create table employee
(
	id int primary key,
	name varchar(50),
	age int check (age > 0
);

insert into employee
select 1, 'John', -1

select * from employee;


/* DEFAULT Constraint */

drop table if exists employee;
create table employee
(
	id int primary key,
	name varchar(50),
	age int check (age > 0),
	email varchar(255) NOT NULL DEFAULT 'No Email'
);


insert into employee(id, name, age, email)
select 1, 'Josh', 45, NULL

select * from employee;

/* IDENTITY */

drop table if exists person;
create table person
(
	id int primary key identity,
	name varchar(50)
);

insert into person(id, name)
values (3, 'John')

--An explicit value for the identity column in table 'person' can only be specified when a column list is used and IDENTITY_INSERT is ON.

insert into person(name)
values ('John')

select * from person

SET IDENTITY_INSERT person OFF