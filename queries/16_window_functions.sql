-- window functions / Analytical functions

use salesdb;

-- Find the total sales across all orders
select * from orders;
select
	sum(sales) total_sales
from orders;

-- find the total sales for each product
select
	productid,
    sum(sales) as total_sales
from orders
group by productid;

-- Find the total sales across all orders
-- Additionally provide details like orderid and orderdate
select * from orders;

select
	orderid,
    orderdate,
	sum(sales) over() as total_sales
from orders;

-- find the total sales for each product
-- additionaly provide details such as orderid, and orderdate
select
	orderid,
    orderdate,
	productid,
    sum(sales) over(partition by productid) as totalsalesbyproduct
from orders;

-- Combine previous two results
select
	orderid,
    orderdate,
	productid,
    sales,
    sum(sales) over() as totalsales,
    sum(sales) over(partition by productid) as totalsalesbyproduct
from orders;

-- Find the total sales for each combination of product and order status
-- provide non-aggregated details as well
select * from orders;

select
	orderid,
    orderdate,
    productid,
    sales,
    orderstatus,
	sum(sales) over(partition by productid, orderstatus) as totalsalesbyprodandstatus
from orders;

-- Rank each order based on their sales from highest to lowest
-- Provide additional details such as orderid and orderdate
select
	orderid,
    orderdate,
    sales,
    rank() over(order by sales desc) as ranks
from orders;

-- frames
-- unbounded preceding and current row is default frame when order by is used
-- always define frame when using order by
select
	orderid,
    orderdate,
    orderstatus,
    sales,
    sum(sales) over(partition by orderstatus order by orderdate rows between current row and 2 following) as totalsales
from orders;

-- Find total sales for each order status,
-- only for product 101 and 102 
select
	orderstatus,
    productid,
    sales,
    sum(sales) over(partition by orderstatus) as totalsales
from orders
where productid in (101, 102);

-- Rank the customers based on their total sales
select * from orders;

select
	customerID,
    sum(sales) as totalsales,
    rank() over(order by sum(sales) desc) as customerRank
from orders
group by customerid;