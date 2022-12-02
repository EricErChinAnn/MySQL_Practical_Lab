----- Question 01 -----
SELECT 
    city AS "City",
    phone AS "Phone",
    country AS "Country"
FROM offices



----- Question 02 -----
SELECT
    *
FROM orders
WHERE orders.comments 
LIKE "%FedEX%"



----- Question 03 -----
SELECT
    customerName AS "Customer Name",
    contactFirstName AS "Contact First Name",
    contactLastName AS "Contact Last Name"
FROM customers
ORDER BY customerName DESC


----- Question 04 -----
SELECT 
    *
FROM employees
WHERE (officeCode BETWEEN 1 AND 3)
AND (
    firstName LIKE "%son%"
    OR
    lastName LIkE "%son%"
)



----- Question 05 -----
select 
    orders.*,
    customers.customerName as "Customer Name",
    customers.contactFirstName as "Contact First Name",
    customers.contactLastName as "Contact Last Name"
from orders
join customers
on orders.customerNumber LIKE customers.customerNumber
Where orders.customerNumber LIKE 124




----- Question 06 -----
SELECT 
    products.productName AS "Product Name",
    orderdetails.*
FROM orderdetails
JOIN products
ON orderdetails.productCode LIKE products.productCode;




