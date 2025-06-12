use MyDatabase;

-- Retrieve all data from customers and orders as separate results
-- No Join
select * from customers;
select * from orders;

-- Inner join
-- Add the table name before columns to avoid confusion in joins with same named columns

-- Get all customers along with their orders
-- but only for customers who have placed an order
select 
	customers.id,
    customers.first_name,
    orders.order_id,
    orders.sales
from customers
inner join orders
on customers.id = orders.customer_id;

select 
	c.id,
    c.first_name,
    o.order_id,
    o.sales
from customers as c
inner join orders as o
on c.id = o.customer_id;

-- Left join
-- Get all customers with their orders including the ones without order
select
	c.id,
    c.first_name,
    o.order_id,
    o.sales
from customers as c
left join orders o
on c.id = o.customer_id;

-- Right join
-- Get all customers alongn with their orders, including orders without matching customers
select
	c.id,
    c.first_name,
    o.order_id,
    o.sales
from customers as c
right join orders o
on c.id = o.customer_id;

-- Using left join
select
	c.id,
    c.first_name,
    o.order_id,
    o.sales
from orders o
left join customers as c
on c.id = o.customer_id;

-- full join
-- Get all customers and all orders even if there is not a match
-- MySQL doesn't support full join (or full outer join)
-- We have to use a workaround using left join, right join, and union all