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
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
     first_name VARCHAR(50),
     last_name VARCHAR(50)
);
INSERT INTO customers (first_name, last_name)
VALUES  ("Fred", "Fish"),
                ("Larry", "Lobster"),
                ("Bubble", "Bass");

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
--another example
CREATE TABLE enrollments (
  enrollment_id INT PRIMARY KEY,
  student_id INT,
  course_id INT,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
--to drop foreign key:
ALTER TABLE transactions
DROP FOREIGN KEY foreignKeyName;--name will be found in the schemas->database->table->foreign key
--to set foreign key name manually(for existing table with foreign key):
ALTER TABLE transactions
ADD CONSTRAINTS keyName
FOREIGN KEY (course_id) REFERENCES courses(course_id);
-----------------------joins--------------------------
                      #INNER_JOIN#
--transactionTable:
+------------------+--------+--------------+
| transaction_id   | amount |customer_id(f)|
+------------------+--------+--------------+
|  1000            |  4.34  |      3       |
+------------------+--------+--------------+
|  1001            | 3.43   |       2      |
+------------------+--------+--------------+
|  1002            |  3.56  |       3      |
+------------------+--------+--------------+
|  1003            | 2.34   |        1     |
+------------------+--------+--------------+
|  1004            | 5.43   |     null     |
+------------------+--------+--------------+

--customerTable:
+------------------+--------+-------------+
| customer_id(pk)  | F_name |  L_name     |
+------------------+--------+-------------+
|  1               | sdfafd |     fgdfg   |
+------------------+--------+-------------+
|  2               | asdfdf |       sdfg  |
+------------------+--------+-------------+
|  3               |  dfg   |     sdfgd   |
+------------------+--------+-------------+
|  4               | dfgdfg |      dfgdf  |
+------------------+--------+-------------+

-- INNER JOIN selects records that have a matching key in both tables.
SELECT *
FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;
+------------------+--------+-------------+---------------------+----------------+----------+     
| transaction_id   | amount | customer_id | customer_id         | F_name         | L_name   |
+------------------+--------+-------------+---------------------+----------------+----------+
| 1000             |  ''    |    3        |          3          |   dfg          |   sdfgd  |
+------------------+--------+-------------+---------------------+----------------+----------+        --here '' means the data will be same as before
| 1001             | ''     |    2        |          2          |        ''      |          |
+------------------+--------+-------------+---------------------+----------------+----------+
| 1002             |   ''   |     3       |         3           |     dfg        | sdfgd    |
+------------------+--------+-------------+---------------------+----------------+----------+
| 1003             |  ''    |     1       |         1           |       ''       |   ''     |
+------------------+--------+-------------+---------------------+----------------+----------+
--we can select selectively also
  SELECT transaction_id , amount ,F_name, L_name  
FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;
  
                                  #leftJoin#
-- LEFT JOIN returns all records from the left table 
-- and the matching records from the right table
SELECT *
FROM transactions LEFT JOIN customers
ON transactions.customer_id = customers.customer_id;

+------------------+--------+-------------+---------------------+----------------+----------+
| transaction_id   | amount | customer_id | customer_id         | F_name         | L_name   |
+------------------+--------+-------------+---------------------+----------------+----------+
| 1000             |  ''    |    3        |          3          |   dfg          |   sdfgd  |
+------------------+--------+-------------+---------------------+----------------+----------+
| 1001             | ''     |    2        |          2          |        ''      |          |
+------------------+--------+-------------+---------------------+----------------+----------+
| 1002             |   ''   |     3       |         3           |     dfg        | sdfgd    |
+------------------+--------+-------------+---------------------+----------------+----------+
| 1003             |  ''    |     1       |         1           |       ''       |   ''     |
+------------------+--------+-------------+---------------------+----------------+----------+
| 1004             |  ''    |    null     |         null        |       null     |   null   |
+------------------+--------+-------------+---------------------+----------------+----------+
                              #rightJoin#

-- RIGHT JOIN returns all records from the right table 
-- and the matching records from the left table
SELECT *
FROM transactions RIGHT JOIN customers
ON transactions.customer_id = customers.customer_id;

+------------------+--------+-------------+---------------------+----------------+----------+
| transaction_id   | amount | customer_id | customer_id         | F_name         | L_name   |
+------------------+--------+-------------+---------------------+----------------+----------+
| 1000             |  ''    |    3        |          3          |   dfg          |   sdfgd  |
+------------------+--------+-------------+---------------------+----------------+----------+
| 1001             | ''     |    2        |          2          |        ''      |          |
+------------------+--------+-------------+---------------------+----------------+----------+
| 1002             |   ''   |     3       |         3           |     dfg        | sdfgd    |
+------------------+--------+-------------+---------------------+----------------+----------+
| 1003             |  ''    |     1       |         1           |       ''       |   ''     |
+------------------+--------+-------------+---------------------+----------------+----------+
| null             |  null  |    null     |        4            |      ''        |   ''     |
+------------------+--------+-------------+---------------------+----------------+----------+








