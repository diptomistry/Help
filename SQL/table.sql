
CREATE TABLE employees (
    id INT PRIMARY KEY,--column1 datatype,
    first_name VARCHAR(50),-- column2 datatype,
    last_name VARCHAR(50),-- column3 datatype,
    hire_date DATE-- column4 datatype,
);

INSERT INTO employees (id, first_name, last_name, hire_date)
VALUES (1, 'John', 'Doe', '2023-01-15');
--querying data:
SELECT first_name, last_name
FROM employees
WHERE hire_date >= '2023-01-01';
--updating data:
UPDATE employees
SET first_name = 'Jane'--SET column1 = value1, column2 = value2, ...
WHERE id = 1;



