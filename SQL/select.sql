SELECT * FROM employees;--selects all columns(* means all)
--to select specific column:
SELECT first_name, last_name
FROM employees
WHERE department = 'Sales';--for null values ,we have to use 'is' instead of '='( department is null)//we can use is not null also
--select with multiple conditions:
SELECT product_name, price
FROM products
WHERE category = 'Electronics' AND price > 500;
--select with sorting:
SELECT customer_name, order_date, total_amount
FROM orders
WHERE order_date >= '2023-01-01'
ORDER BY order_date DESC;
--Select with aggregation (using functions):
SELECT department, AVG(salary) AS avg_salary, COUNT(*) AS num_employees
FROM employees
GROUP BY department;
--select with joining tables:
SELECT customers.customer_name, orders.order_date, orders.total_amount
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id;


