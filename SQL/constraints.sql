                            #UNIQUE#
--Ensures that all values in a column (or a set of columns) are unique.
--Allows NULL values, but no two non-NULL values can be the same.
CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  email VARCHAR(100) UNIQUE,--we cant insert any email that are the same//we can use NOT NULL also(email VARCHAR(100) NOT NULL)
  department VARCHAR(50)
);
--unique constraint to an existing table:
 CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  email VARCHAR(100),
  department VARCHAR(50)
);
ALTER TABLE employees
ADD CONSTRAINTS UNIQUE(email);--MODIFY email VARCHAR(100)  NOT NULL;


                            #CHECK#
--Specifies a condition that must be true for each row.
--Prevents insertion or update of data that does not meet the specified condition.
--Example: 
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  order_date DATE,
  total_amount DECIMAL(10, 2),
  CONSTRAINT chk_total_amount CHECK (total_amount > 0)
);
--For existing table:
ALTER TABLE orders
ADD CONSTRAINTS chk_total_amount CHECK (total_amount > 0) ;
--to remove:
ALTER TABLE orders
DROP CHECK chk_total_amount;



