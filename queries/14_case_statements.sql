use salesdb;
 
-- Categorisation
-- Generate a report showing total sales for each category:
-- High - If the sales is greater than 50
-- Medium - If the sales is between 20 and 50
-- Low : if sale is 20 or less
-- Sort the result from lowest to highest

select * from orders;

select
	sales_category,
    sum(sales) as total_sales from (
		select
			orderid,
			sales,
			case
				when sales > 50 then 'High'
				when sales > 20 then 'Medium'
				else 'Low'
			end as sales_category
		from orders
	) as t
group by sales_category
order by total_sales asc;

-- Mapping data
-- Retrieve employee details with gender displayed as full text
select * from employees;

select
	employeeid,
    firstname,
    lastname,
    department,
    case
		when gender = 'M' then 'Male'
        when gender = 'F' then 'Female'
        else 'not available'
	end as gender_full
from employees;

-- Retrive customer details with abbreviated country code
select * from customers;
select distinct country
from customers;

select
	customerid,
    firstname,
    lastname,
    score,
    case
		when country = 'USA' then 'US'
        when country = 'Germany' then 'DE'
        else 'not available'
	end as country_abbr
from customers;
-- quick format to use when only one column is used for logic
select
	customerid,
    firstname,
    lastname,
    score,
    case country
		when 'USA' then 'US'
        when 'Germany' then 'DE'
        else 'not available'
	end as country_abbr
from customers;

-- Handling nulls
-- Find the average score of customers	and treat nulls as 0
select 
	avg(mapped_score)
from (
	select
		score,
		case 
			when score is null then 0
			when score is not null then score
		end as mapped_score
	from customers
) as t;

-- Or we can use null functions as we learnt earlier
select
	avg(ifnull(score, 0))
from customers;

-- or we can use case inside avg
select
	avg(
		case
			when score is null then 0
            else score
		end
	)
from customers;

-- conditional aggregation
-- count how many times each customer has made an order with sales greater than 30

select * from orders;

select
	customerid,
    sum(sales_30) as num_sales_30
from (
	select
		orderid,
		customerid,
		sales,
		case 
			when sales > 30 then 1
			else 0
		end as sales_30
	from orders
) as t
group by customerid;

select
	customerid,
    sum(case 
			when sales > 30 then 1
			else 0
		end) as num_sales_30
from orders
group by customerid;