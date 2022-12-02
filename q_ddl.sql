---- https://www.mysqltutorial.org/tryit/'
---- we are using this site to test query

--Get all  info from table
select * from employees;

--Show only the info u wan
select firstName, lastName, email from employees;

--Show info to be more user friendly
select firstName as "First Name",
        lastName as "Last Name",
        email as "email" 
from employees;

select productLine as "Product Name",
        textDescription as "Product Description"
from productlines


--Show unique value in a column
select distinct jobTitle from employees


-- Show selected info based on criteria
select * from employees where officeCode = 1;


----Combining what we have learnt so far
select firstName as "First Name",
        lastName as "Last Name",
        email as "Email"
from employees
where officeCode = 1;

select productCode as "Product ID",
        productName as "Product Name",
		buyPrice as "Price"
from products
where buyPrice > 50;


--- Search via a string 
    -- Find employees that have a jobtitle of sale in its name
SELECT firstName, lastName, email, jobTitle 
FROM employees 
WHERE jobTitle 
LIKE "%Sales%";


--- Search via 2 or more Criteria
select * 
from employees
where officeCode 
    LIKE 1
AND jobTitle 
    LIKE "%sales%";

----Multi Search () the 
select * 
from employees
where(
    officeCode 
        LIKE 1 
    OR officeCode
        LIKE 3
    )
AND jobTitle 
    LIKE "%sales%";


----- Show data from 2 different table by joining them and display selected info 
SELECT 
	employees.firstName,
	employees.lastName,
	offices.*
FROM employees
JOIN offices
ON employees.officeCode LIKE offices.officeCode;


SELECT 
    customers.customerName,
    employees.firstName,
	employees.lastName,
    employees.email,
    customers.salesRepEmployeeNumber,
    employees.employeeNumber
FROM customers
JOIN employees
ON customers.salesRepEmployeeNumber LIKE employees.employeeNumber;


---Type of JOIN
    --LEFT JOIN (Will display all data from the left table)
    --RIGHT JOIN (Will display all data from the left table)



---- Date manipulation
    --Show current date
select curdate();
    -- show current date and time
select now();

--- Date manipulation within a range
SELECT * FROM payments where paymentDate >= "2003-01-01" AND paymentDate <= "2003-12-31";
SELECT * FROM payments where paymentDate BETWEEN "2003-01-01" AND "2003-12-31";

--Displaying Year/Month/Day
SELECT 
    checkNumber, 
    amount, 
    YEAR(paymentDate), 
    Month(paymentDate), 
    DAY(paymentDate) 
FROM payments

--Display data manipulation within a range
SELECT * FROM payments where YEAR(paymentDate) LIKE "2003";