use salesdb;

-- count
-- sum
-- avg
-- max
-- min

-- Find total number of orders
-- Find the total sales of all orders
-- Find the avg sales of all orders
-- Find highest and lowest sale of all orders
select
	count(*) as total_orders,
    sum(sales) as total_sales,
    avg(sales) as avg_sales,
    max(sales) as max_sale,
    min(sales) as min_sale
from orders;

-- aggregate functions with group by
select
	customerid,
	count(*) as total_orders,
    sum(sales) as total_sales,
    avg(sales) as avg_sales,
    max(sales) as max_sale,
    min(sales) as min_sale
from orders
group by customerid;