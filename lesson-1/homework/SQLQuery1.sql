--1. NOT NULL Constraint
-- Create a table named student with columns:
---- id (integer, should not allow NULL values)
---- name (string, can allow NULL values)
---- age (integer, can allow NULL values)
-- First, create the table without the NOT NULL constraint.
-- Then, use ALTER TABLE to apply the NOT NULL constraint to the id column.

CREATE DATABASE homework1

USE homework1

CREATE TABLE student
(
	id int,
	name VARCHAR(50),
	age int
);

ALTER TABLE student 
ALTER COLUMN id INT NOT NULL;




