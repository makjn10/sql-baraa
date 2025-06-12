use MyDatabase;

-- Left Anti Join
-- Get all the customers who haven't placed any order
select
	c.id,
    c.first_name,
    o.order_id,
    o.sales
from customers as c
left join orders as o
on c.id = o.customer_id
where o.customer_id is null;

-- Right anti join
-- Get all orders without matching customers
select
	c.id,
    c.first_name,
    o.order_id,
    o.sales
from customers as c
right join orders as o
on c.id = o.customer_id
where c.id is null;

-- Get all customers along with their orders, but only for customers who have placed an order (without inner join)
select
	c.id,
    c.first_name,
    o.order_id,
    o.sales
from customers as c
left join orders as o
on c.id = o.customer_id
where o.customer_id is not null;

-- cross join
select * 
from customers 
cross join orders;