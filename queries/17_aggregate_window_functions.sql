use salesdb;

-- count 

-- Find total number of orders for each product
select
	productId,
	count(*)
from orders
group by productId;

-- Find total number of orders for each product
-- Display other details as well
select
	productId,
    orderid,
    orderdate,
    sales,
    count(sales) over(partition by productid) as totalOrders
from
	orders;

-- find total number of orders
select count(*) as total_orders
from orders;

-- find total number of orders
-- find total number of orders for each customers
-- provide details such as order id and order date
select 
	orderid,
    orderdate,
    customerid,
    count(*) over() as total_orders,
    count(*) over(partition by customerid) as total_orders_by_customer
from orders;

-- find the total number of customers
-- find total number of scores
-- additionally proveide customer details
select
	*,
    count(*) over() as total_customers,
    count(score) over() as total_num_scores
from customers;

-- check whether orders archive data contain any duplicate rows or not
select
	orderid,
    count(*) over(partition by orderid) as checkPK
from orders_archive;

-- sum
-- find total sales acroass all orders
-- and the total sales for each product
-- additionally provide details such as orderid and orderdate

select
	orderid,
	orderdate,
    productid,
    sales,
    sum(sales) over() as total_sales,
    sum(sales) over(partition by productid) as total_sales_by_product
from
orders;

-- part to whole analysis - shows the contribution of each datapoint to the overall dataset
-- find the contribution of each product's sales to the total sales
select
	orderid,
    productid,
    sales,
    sum(sales) over() as totalsales,
    sum(sales) over(partition by productid) as salesbyproductid,
    round(sum(sales) over(partition by productid) / sum(sales) over() * 100, 2) as percentageoftotalsalesbyproduct,
    round(sales / sum(sales) over() * 100, 2) as percentageofcurrentsale
from orders;

-- avg
-- find the average sales for each product
select
	productid,
    round(avg(ifnull(sales, 0)), 2) as averagesalesperproduct
from orders
group by productid;

-- find average sales across all orders and
-- find the average sales for each product
-- additionally provide details like orderid etc.
select
	orderid,
    productid,
    sales,
    round(avg(coalesce(sales, 0)) over(), 2)  as totalaveragesales,
    round(avg(coalesce(sales, 0)) over(partition by productid), 2)  as averagesalesperproduct
from orders;

-- Find average score of customers
-- show info like customerid and lastname
select * from customers;
-- deal with nulls
select
	customerid,
    lastname,
    score,
    coalesce(score, 0) as validscore,
    avg(coalesce(score, 0)) over() as avgScore
from customers;

-- find all orders where the sales are higher than the average sales across all orders
select *
from(
	select 
		orderid,
		sales,
		avg(sales) over() as averageSale
	from orders) as t
where sales > averageSale;

-- min / max
-- find highest and lowest sales for all products
-- and highest and lowest sale for each product
-- prrovide details like orderid, orderdate

select
	orderid,
    orderdate,
    productid,
    sales,
    min(sales) over() as minSalesOverall,
    max(sales) over() as maxSalesOverall,
    min(sales) over(partition by productid) minSalesByProduct,
    max(sales) over(partition by productid) maxSalesByProduct
from orders;

-- show the employees who have highest salary
select * from employees;

select * from (
	select
		employeeid,
		firstname,
		salary,
		max(salary) over() as maxSalary
	from employees) as t
where salary = maxSalary;

-- calculate the deviation of each sale from min and max sale

select
	orderid,
    sales,
    min(sales) over()minsales,
    sales - min(sales) over() as minsalesdeviation,
    max(sales) over() as maxsales,
    sales - max(sales) over() as maxsalesdeviation
from orders;

-- Running and rolling total
-- Caalculate the moving average of sales for each product overtime

select 
	orderid,
    productid,
    sales,
    orderdate,
    round(avg(sales) over(partition by productid order by orderdate asc), 2)as movingAverage
from orders;