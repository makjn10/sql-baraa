use salesdb;

-- union
-- combine the data from employees and customers into one table excluding duplicates
select * from customers;
select * from employees;
select 
	customerid as Id,
	firstname,
    lastname
from customers
union
select
	employeeid,
	firstname,
    lastname
from employees;

-- union all
-- combine the data from employees and customers into one table including duplicates
select 
	customerid as Id,
	firstname,
    lastname
from customers
union all
select
	employeeid,
	firstname,
    lastname
from employees;

-- except / minus
-- Find the employees who are not customers at the same time
select 
	firstname,
    lastname
from employees
except
select
	firstname,
    lastname
from customers;

-- intersect
-- Find the employees who are also customers
select 
	firstname,
    lastname
from employees
intersect
select
	firstname,
    lastname
from customers;

-- Orders are stored in orders and orders_archive. Combine all orders into one report, avoid duplicates
select * from orders;
select * from orders_archive;

select *, 'orders' as source
from orders
union
select *, 'orders_archive' as source
from orders_archive;

