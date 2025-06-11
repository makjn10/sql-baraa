use MyDatabase;

-- Insert new data in customers table
insert into customers (id, first_name, country, score) 
values 
	(6, 'Anna', 'USA', null),
	(7, 'Sam', null, 100);
select * from customers;

-- Other inserts (DB doesn't care about the content of data, so maintain order)
insert into customers (id, first_name, country, score) 
values
	(8, 'USA', 'Max', null);
    
-- This will fail due to Data Type mismatch
insert into customers (id, first_name, country, score) 
values
	('USA', 9, 'Max', null);
    
-- Skip columns if inserting values for all columns
insert into customers 
values
	(9, 'Andreas', 'Germany', null);
    
-- Columns not included in columns become null (unleass a default or constraint exists)
insert into customers (id, first_name)
values
	(10, 'Sahra');
	
select * from customers;


-- Insert using Select
-- Copy data from customers into persons table
create table persons (
	id int not null,
    person_name varchar(50) not null,
	birth_date date,
    phone varchar(15) not null,
    constraint pk_persons primary key (id)
);

-- Columns can be ignored as we have exact match on what we are inserting
insert into persons (id, person_name, birth_date, phone)
select
	id,
    first_name,
    null,
    'Unknown'
from customers;

select * from persons;


-- Update Command
-- Always use where condition to avoid updating all the rows unintentionally

-- Change the score of customer 6 to 0
select * from customers;

update customers
set 
	score = 0
where id = 6;

select * from customers
where id = 6;

-- Change the score of customer 10 to 0
-- And update the country to UK
update customers
set
	score = 0,
    country = 'UK'
where
	id = 10;

select * 
from customers
where
	id = 10;
    
-- Update all the customers with a null score by setting their score to 0
update customers
set
	score = 0
where
	score is null;

select * from customers;

-- DELETE DML command
-- Always use WHERE to avoid deleting all the rows unintentionally

-- Delete all customers with an id > 5
delete from customers
where
	id > 5;
    
-- Delete all data from table persons
delete from persons;

-- Truncate is faster than delete as it deletes the rows without checking/logging
truncate table persons;


