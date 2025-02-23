create table customer (
    customer_id int,
    first_name varchar(50),
	last_name varchar(50),
	gender varchar(30),
	DOB varchar(50),
	job_title varchar(50),
	job_industry_category varchar(50),
	wealth_segment varchar(50),
	deceased_indicator varchar(50),
	owns_car varchar(30),
	address varchar(50),
	postcode varchar(30),
	state varchar(30),
	country varchar(30),
	property_valuation int
);

create table transaction (
    transaction_id int,
    product_id int,
	customer_id int,
	transaction_date varchar(30),
	online_order varchar(30),
	order_status varchar(30),
	brand varchar(30),
	product_line varchar(30),
	product_class varchar(30),
	product_size varchar(30),
	list_price float,
	standard_cost float
);

SELECT DISTINCT brand FROM transaction WHERE standard_cost > 1500;

SELECT * FROM transaction WHERE order_status = 'Approved' AND to_Date(transaction_date,'DD.MM.YYYY') 
BETWEEN to_Date('01.04.2017','DD.MM.YYYY') and to_Date('09.04.2017','DD.MM.YYYY');

SELECT DISTINCT job_title FROM customer WHERE job_industry_category IN ('IT', 'Financial Services') AND job_title LIKE 'Senior%';

SELECT DISTINCT brand FROM transaction JOIN customer ON transaction.customer_id = customer.customer_id 
WHERE customer.job_industry_category = 'Financial Services';

SELECT DISTINCT customer.customer_id, customer.first_name, customer.last_name 
FROM customer JOIN transaction ON customer.customer_id = transaction.customer_id
WHERE transaction.online_order = 'True' AND transaction.brand IN ('Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles')  LIMIT 10;

SELECT customer.customer_id, customer.first_name, customer.last_name FROM customer LEFT JOIN transaction ON customer.customer_id = transaction.customer_id
WHERE transaction.transaction_id IS null

WITH MaxCost AS (SELECT MAX(standard_cost) AS max_cost FROM transaction)
SELECT customer.customer_id, customer.first_name, customer.last_name FROM customer
JOIN transaction ON customer.customer_id = transaction.customer_id JOIN MaxCost ON transaction.standard_cost = MaxCost.max_cost
WHERE customer.job_industry_category = 'IT';

SELECT DISTINCT customer.customer_id, customer.first_name, customer.last_name FROM customer JOIN transaction ON customer.customer_id = transaction.customer_id
WHERE customer.job_industry_category IN ('IT', 'Health') AND transaction.order_status = 'Approved' AND to_Date(transaction_date,'DD.MM.YYYY') 
BETWEEN to_Date('07.07.2017','DD.MM.YYYY') and to_Date('17.07.2017','DD.MM.YYYY');