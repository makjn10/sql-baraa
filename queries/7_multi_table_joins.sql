use salesdb;

-- using salesdb, retrieve a list of all orders, along with related customer, product and employee details
-- order id, cutomer name, product name, sales amount, product price, salesperson's name
select
	o.orderid,
    c.firstname as customer_name,
    p.product,
    p.price,
    o.sales,
    e.firstname as salesperson_name
from orders o
left join customers c 
on o.customerid = c.customerid
left join products p 
on o.productid = p.productid
left join employees e
on o.salespersonid = e.employeeid;