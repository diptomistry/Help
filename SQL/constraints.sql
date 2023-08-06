#UNIQUE:
--Ensures that all values in a column (or a set of columns) are unique.
--Allows NULL values, but no two non-NULL values can be the same.
CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  email VARCHAR(100) UNIQUE,--we cant insert any email that are the same
  department VARCHAR(50)
);
--unique constraint to an existing table:
 CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  email VARCHAR(100),
  department VARCHAR(50)
);
ALTER TABLE employees
ADD CONSTRAINTS UNIQUE(email);

