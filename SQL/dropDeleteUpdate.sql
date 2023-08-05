DROP TABLE table_name;-- Removes a table and all of its associated data, indexes, constraints, and triggers.
DROP INDEX index_name ON table_name;-- Removes an index from a table.
DROP VIEW view_name;--Deletes a view and its definition.
DROP DATABASE database_name;--Deletes an entire database and all of its objects.
/*
The "DELETE" command is used to remove specific rows or records from a table. It's used to selectively remove data based on certain 
conditions. The "DELETE" command doesn't remove the table structure or the table itself; it only removes rows from the table.
*/

DELETE FROM table_name WHERE condition;
--Update a single column for specific rows:
UPDATE employees
SET salary = salary * 1.10
WHERE department = 'Sales';
--Update multiple columns for specific rows:
UPDATE products
SET price = price * 0.90,
    quantity_in_stock = quantity_in_stock - 1
WHERE category = 'Electronics' AND price > 1000;
--Update all rows:
UPDATE customers
SET status = 'Inactive';
--Using subqueries to update data:
UPDATE orders
SET total_amount = (SELECT SUM(order_total) FROM order_items WHERE order_id = orders.id)
WHERE order_date >= '2023-01-01';

