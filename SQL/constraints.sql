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


                            #DEFAULT#
--Sets a default value for a column if no value is provided during insertion.
--Ensures that a column always has a value even if not explicitly provided.
--Example:
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100),
  price DECIMAL(10, 2) DEFAULT 0.00
);
--For existing table:
ALTER TABLE products
ALTER price SET DEFAULT 0;
--insertion:
INSERT INTO products (product_id, product_name)
VALUES (1, 'Widget A');
--example 2
CREATE TABLE transactions(
        transaction_id INT,
     amount DECIMAL(5, 2),
    transaction_date DATETIME DEFAULT NOW()-- the NOW() function is used to retrieve the current date and time from the server. It returns the current date and time in the format 'YYYY-MM-DD HH:MM:SS'. 
);
SELECT * FROM transactions;

INSERT INTO transactions (transaction_id, amount)
VALUES (1, 4.99);
SELECT * FROM transactions;

INSERT INTO transactions (transaction_id, amount)
VALUES (2, 2.89);
SELECT * FROM transactions;

                         #PrimaryKey#
--unique+not null
--Ensures that a column (or a set of columns) uniquely identifies each row in a table.
--Prevents duplicate and NULL values in the specified column(s).
--Example:
CREATE TABLE students (
  student_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);
--for existing table:
ALTER TABLE students
ADD CONSTRAINTS PRIMARY KEY(student_id);
--we cant have multiple primary keys for a table ,for example now we cant set any other column except student_id as primary key

--FETURES:
  --AUTOINCREMENT:
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,--id number will start from 1
    amount DECIMAL(5, 2)
);
 --to start with a particular number:
ALTER TABLE transactions 
AUTO_INCREMENT = 1000;

                                    #ForeignKey#
--if the same primary key is used in a different table ,it will be called a foreign key.
--Establishes a relationship between two tables, where the values in a column of one table match the values in another table's primary key column.
--Ensures referential integrity, maintaining consistency between related tables.
--Example:
CREATE TABLE enrollments (
  enrollment_id INT PRIMARY KEY,
  student_id INT,
  course_id INT,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);






