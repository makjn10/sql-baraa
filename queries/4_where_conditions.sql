use MyDatabase;

-- Comparison operators
-- Retrieve all customers form Germany
select *
from customers
where country = 'Germany';

-- Retrieve all customers who are not form Germany
select *
from customers
where country != 'Germany';

-- Retrieve all customers with a score greater than 500
select *
from customers
where score > 500;

-- Retrieve all customers with a score of 500 or more
select *
from customers
where score >= 500;

-- Retrieve all customers with a score less than 500
select *
from customers
where score < 500;

-- Retrieve all customers with a score of 500 or less
select *
from customers
where score <= 500;

-- Retrieve all customers from USA and a score greater than 500
select *
from customers
where 
	country = 'USA' 
    and score > 500;
    
-- Retrieve all customers who are either from USA or have a score greater than 500
select *
from customers
where 
	country = 'USA' 
    or score > 500;

-- Retieve all the customers with a score not less than 500
select *
from customers
where not score < 500;

-- Retrieve all customers whose score fall in range between 100 and 500
select *
from customers
where score between 100 and 500;

select *
from customers
where score >= 100 and score <= 500;

-- Retrieve customers from either Germany or USA
select *
from customers
where country IN ('Germany', 'USA');
-- We can use OR operator also but prefer IN

-- Find all customers whose name start with 'M'
select *
from customers
where first_name like 'M%';

-- Find all the customers whose first name ends with 'n'
select *
from customers
where first_name like '%n';

-- Find all the customers whose first name contains 'r'
select *
from customers 
where first_name like '%r%';

-- Find all customers whose first name has a 'r' in the third position
select * 
from customers 
where first_name like '__r%';