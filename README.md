# DB_2
1. SELECT DISTINCT brand FROM transaction WHERE standard_cost > 1500;
![image](https://github.com/user-attachments/assets/44e1995a-ed0c-47b7-a26b-8419251f2d33)
2.SELECT * FROM transaction WHERE order_status = 'Approved' AND to_Date(transaction_date,'DD.MM.YYYY') 
BETWEEN to_Date('01.04.2017','DD.MM.YYYY') and to_Date('09.04.2017','DD.MM.YYYY');
![image](https://github.com/user-attachments/assets/8363bd87-33ae-46ee-8455-6bf1556c4db3)
3. SELECT DISTINCT job_title FROM customer WHERE job_industry_category IN ('IT', 'Financial Services') AND job_title LIKE 'Senior%';
![image](https://github.com/user-attachments/assets/32ed62a1-4501-41a9-9dc0-2003d4d909e2)
4. SELECT DISTINCT brand FROM transaction JOIN customer ON transaction.customer_id = customer.customer_id 
WHERE customer.job_industry_category = 'Financial Services';
![image](https://github.com/user-attachments/assets/3a3a2bfb-002d-42cd-be97-5d8b16572a6b)
5. SELECT DISTINCT customer.customer_id, customer.first_name, customer.last_name 
FROM customer JOIN transaction ON customer.customer_id = transaction.customer_id
WHERE transaction.online_order = 'True' AND transaction.brand IN ('Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles')  LIMIT 10;
![image](https://github.com/user-attachments/assets/6cde9478-bc49-4a24-b5ed-8a1283990e02)
6. SELECT customer.customer_id, customer.first_name, customer.last_name FROM customer LEFT JOIN transaction ON customer.customer_id = transaction.customer_id
WHERE transaction.transaction_id IS null
![image](https://github.com/user-attachments/assets/92c0bc0f-b422-4181-b83d-f29c9a6df976)
7. WITH MaxCost AS (SELECT MAX(standard_cost) AS max_cost FROM transaction)
SELECT customer.customer_id, customer.first_name, customer.last_name FROM customer
JOIN transaction ON customer.customer_id = transaction.customer_id JOIN MaxCost ON transaction.standard_cost = MaxCost.max_cost
WHERE customer.job_industry_category = 'IT';
![image](https://github.com/user-attachments/assets/9acacba6-65de-4b65-bfbc-ed67a6e02cc6)
8.SELECT DISTINCT customer.customer_id, customer.first_name, customer.last_name FROM customer JOIN transaction ON customer.customer_id = transaction.customer_id
WHERE customer.job_industry_category IN ('IT', 'Health') AND transaction.order_status = 'Approved' AND to_Date(transaction_date,'DD.MM.YYYY') 
BETWEEN to_Date('07.07.2017','DD.MM.YYYY') and to_Date('17.07.2017','DD.MM.YYYY');
![image](https://github.com/user-attachments/assets/bb75c56c-9d2a-4e82-9e88-40c75f7d9fa4)
