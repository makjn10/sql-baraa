use salesdb;

-- ifnull
-- coalesce
-- Find average score of customers
select 
	avg(score) as avg_score
from customers;
select 
	avg(ifnull(score, 0)) as avg_score
from customers;

-- Display the full name of a customer in a single field by merging
-- their first and last name and add 10 bonus points to each customer's score
select * from customers;
select
	firstname,
    lastname,
	concat(firstname, ' ', lastname) as fullname,
    score + 10 as newscore
from customers;

select
	firstname,
    lastname,
	concat(firstname, ' ', coalesce(lastname, '')) as fullname,
    coalesce(score, 0) + 10 as newscore
from customers;

-- Sort the customers from lowest to highest scores,
-- with nulls appearing at last
select *
from customers
order by ifnull(score, 100000000) asc;

-- more proffesssional way
select
	*
from customers
order by case when score is null then 1 else 0 end, score;

-- nullif
-- find the sales price for each order
-- by dividing the sales by the quantity
select * from orders;

select 
	sales / nullif(quantity, 0) as price
from orders;

-- is null
-- identify the customers who have no score

select *
from customers
where score is null;

-- show a list os all customers who have a valid score
select * 
from customers
where score is not null;

-- left anti join
-- list all details for customers who have not placed any orders
select 
	c.customerid,
    c.firstname,
    c.lastname,
    c.country,
    c.score
from customers as c
left join orders as o
on c.customerid = o.customerid
where o.customerid is null;