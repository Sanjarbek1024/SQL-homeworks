use class3;

create table nums
(
	num INT
);

insert into nums
values (1), (2), (3), (4), (5), (6), (7);

select * from nums;

--num, col
--1   null
--2   hi  
--3	bye
--4	hi
--5	null
--6	hi bye
--7	null


SELECT *, NULL AS COL1
FROM nums
WHERE num % 2 != 0 and num % 3 != 0
union all
SELECT *, 'HI' AS COL1
FROM nums
WHERE NUM % 2 = 0 and num % 3 != 0
	union all
SELECT *, 'Bye' AS COL1
FROM nums
WHERE NUM % 3 = 0 and num % 2 != 0
	union all
SELECT *, 'HI_BYE' AS COL1
FROM nums
WHERE num % 6 = 0
ORDER BY num

