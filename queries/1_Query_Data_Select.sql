use MyDatabase;

-- Retrieve all customer data
select * 
from customers;

-- Retrieve all order data
select * 
from orders;

-- Retrieve each customer's name, country and score
select 
	first_name, 
	country, 
	score 
from customers;

-- Retrieve customers with a score not equal to zero
select *
from customers
where score != 0;

-- Retrieve customers from Germany
select *
from customers
where country = "Germany";

-- Retrieve all the customers and sort the results by the highest score first
select *
from customers
order by score DESC;

-- Retrieve all the customers and sort the results by the lowest score first
select *
from customers
order by score ASC;

-- Retrieve all the customers and sort the results by country and then by the highest score
select *
from customers
order by country ASC, score DESC;

-- Find the total score for each country
select 
	country,
    sum(score) as total_score
from customers
group by country;

-- Find the total score and total number of customers for each country
select
	country,
    sum(score) as total_score,
    count(*) as total_customers
from customers
group by country;

/* Find the average score for each country
considering only customers with a score not equal to 0
And return only those countries with an average score greater than 430 */
select 
	country,
    avg(score) as average_score
from customers
where score != 0
group by country
having avg(score) > 430;

-- Return unique list of all countries
select distinct
country
from customers;

-- Retrieve only 3 customers
select *
from customers
limit 3;

--  Retrieve the top 3 customers with the highest scores
select *
from customers
order by score desc
limit 3;

-- Retrieve the lowest two customers based on score
select *
from customers
order by score asc
limit 2;

-- Get the two most recent orders
select *
from orders
order by order_date desc
limit 2;