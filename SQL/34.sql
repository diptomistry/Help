                         #PERSON#
CREATE TABLE person (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dob DATE,
    gender ENUM('Male', 'Female', 'Other'),
    father_id INT,
    mother_id INT,
    FOREIGN KEY (father_id) REFERENCES person(id),
    FOREIGN KEY (mother_id) REFERENCES person(id)
);
INSERT INTO person (name, dob, gender, father_id, mother_id)
VALUES
    ('John Doe', '1990-05-15', 'Male', NULL, NULL),
    ('Jane Smith', '1985-10-20', 'Female', NULL, NULL),
    ('Michael Johnson', '2000-02-10', 'Male', 1, 2),
    ('Emily Brown', '1998-09-03', 'Female', 1, 2),
    ('Robert Wilson', '1978-12-08', 'Male', NULL, NULL),
    ('Mary Davis', '1965-07-25', 'Female', NULL, NULL),
    ('David Anderson', '1992-04-18', 'Male', 5, 6),
    ('Olivia Martinez', '1994-08-22', 'Female', 5, 6),
    ('William Taylor', '1980-06-30', 'Male', NULL, NULL),
    ('Sophia Johnson', '1982-03-12', 'Female', NULL, NULL);


                          #COMPANY#
CREATE TABLE company (
    name VARCHAR(255) PRIMARY KEY,
    capital DECIMAL(18, 2)
);

INSERT INTO company (name, capital)
VALUES ('ABC Corporation', 1000000.00);


INSERT INTO company (name, capital)
VALUES
    ('XYZ Enterprises', 750000.50),
    ('123 Inc.', 500000.75),
    ('Acme Industries', 1200000.25);



                       #INVESTMENT#
CREATE TABLE investment (
    id INT PRIMARY KEY,
    company_name VARCHAR(255),
    person_id INT,
    share DECIMAL(10, 2),
    FOREIGN KEY (company_name) REFERENCES company(name),
    FOREIGN KEY (person_id) REFERENCES person(id)
);
-- Inserting an investment for 'ABC Corporation' and 'John Doe'
INSERT INTO investment (id, company_name, person_id, share)
VALUES (1, 'ABC Corporation', 1, 1000.00);

-- Inserting an investment for 'XYZ Enterprises' and 'Jane Smith'
INSERT INTO investment (id, company_name, person_id, share)
VALUES (2, 'XYZ Enterprises', 2, 750.50);

-- Inserting another investment for 'ABC Corporation' with a different person
INSERT INTO investment (id, company_name, person_id, share)
VALUES (3, 'ABC Corporation', 3, 500.25);

-- Inserting an investment for 'Acme Industries' and 'John Doe'
INSERT INTO investment (id, company_name, person_id, share)
VALUES (4, 'Acme Industries', 1, 300.75);

-- Inserting an investment for 'XYZ Enterprises' and 'Emily Brown'
INSERT INTO investment (id, company_name, person_id, share)
VALUES (5, 'XYZ Enterprises', 4, 250.00);

--no father:
SELECT id, name
FROM person
WHERE father_id IS NULL;
+----+-----------------+
| id | name            |
+----+-----------------+
|  1 | John Doe        |
|  2 | Jane Smith      |
|  5 | Robert Wilson   |
|  6 | Mary Davis      |
|  9 | William Taylor  |
| 10 | Sophia Johnson  |
+----+-----------------+
--no mother 
SELECT id, name
FROM person
WHERE mother_id IS NULL;
+----+-----------------+
| id | name            |
+----+-----------------+
|  1 | John Doe        |
|  2 | Jane Smith      |
|  5 | Robert Wilson   |
|  6 | Mary Davis      |
|  9 | William Taylor  |
| 10 | Sophia Johnson  |
+----+-----------------+

--no father or mother

SELECT p.id, p.name
FROM person p
LEFT JOIN person father ON p.father_id = father.id
LEFT JOIN person mother ON p.mother_id = mother.id
WHERE father.id IS NULL OR mother.id IS NULL;
--output: 
+----+-----------------+
| id | name            |
+----+-----------------+
|  1 | John Doe        |
|  2 | Jane Smith      |
|  5 | Robert Wilson   |
|  6 | Mary Davis      |
|  9 | William Taylor  |
| 10 | Sophia Johnson  |
+----+-----------------+
--No father and mother
SELECT p.id, p.name
FROM person p
LEFT JOIN person father ON p.father_id = father.id
LEFT JOIN person mother ON p.mother_id = mother.id
WHERE father.id IS NULL AND mother.id IS NULL;
+----+----------------+
| id | name           |
+----+----------------+
|  1 | John Doe       |
|  2 | Jane Smith     |
|  5 | Robert Wilson  |
|  6 | Mary Davis     |
|  9 | William Taylor |
| 10 | Sophia Johnson |
+----+----------------+
--to find the lists of age between 20 to 50
SELECT id, name, dob, gender
FROM person
WHERE TIMESTAMPDIFF(YEAR, dob, CURDATE()) BETWEEN 20 AND 50;
+----+-----------------+------------+--------+
| id | name            | dob        | gender |
+----+-----------------+------------+--------+
|  1 | John Doe        | 1990-05-15 | Male   |
|  2 | Jane Smith      | 1985-10-20 | Female |
|  3 | Michael Johnson | 2000-02-10 | Male   |
|  4 | Emily Brown     | 1998-09-03 | Female |
|  5 | Robert Wilson   | 1978-12-08 | Male   |
|  7 | David Anderson  | 1992-04-18 | Male   |
|  8 | Olivia Martinez | 1994-08-22 | Female |
|  9 | William Taylor  | 1980-06-30 | Male   |
| 10 | Sophia Johnson  | 1982-03-12 | Female |
+----+-----------------+------------+--------+


mysql> select sysdate() from dual;
+---------------------+
| sysdate()           |
+---------------------+
| 2023-08-17 15:29:20 |
+---------------------+
1 row in set (0.00 sec)

mysql> select sysdate() -dob from person;
+----------------+
| sysdate() -dob |
+----------------+
| 20230797252420 |
| 20230797301915 |
| 20230797152725 |
| 20230797172032 |
| 20230797371727 |
| 20230797502210 |
| 20230797232517 |
| 20230797212113 |
| 20230797352305 |
| 20230797332623 |
+----------------+
10 rows in set (0.00 sec)
                           --new operations
--1)Retrieve Investments for a Person:

mysql> SELECT * FROM investment WHERE person_id = 1;
+----+-----------------+-----------+---------+
| id | company_name    | person_id | share   |
+----+-----------------+-----------+---------+
|  1 | ABC Corporation |         1 | 1000.00 |
|  4 | Acme Industries |         1 |  300.75 |
+----+-----------------+-----------+---------+
2 rows in set (0.02 sec)

mysql> 
--2)Retrieve Total Capital Invested in a Company:
mysql> SELECT company_name, SUM(share) AS total_investment FROM investment WHERE company_name = 'ABC Corporation' GROUP BY company_name;
+-----------------+------------------+
| company_name    | total_investment |
+-----------------+------------------+
| ABC Corporation |          1500.25 |
+-----------------+------------------+
1 row in set (0.01 sec)
--3)Calculate Average Capital of Companies:
mysql> SELECT AVG(capital) AS average_capital FROM company;
+-----------------+
| average_capital |
+-----------------+
|   862500.375000 |
+-----------------+
1 row in set (0.06 sec)
--4)Retrieve Investments Grouped by Company:
mysql> SELECT company_name, COUNT(*) AS num_investments, SUM(share) AS total_share FROM investment GROUP BY company_name;
+-----------------+-----------------+-------------+
| company_name    | num_investments | total_share |
+-----------------+-----------------+-------------+
| ABC Corporation |               2 |     1500.25 |
| Acme Industries |               1 |      300.75 |
| XYZ Enterprises |               2 |     1000.50 |
+-----------------+-----------------+-------------+
3 rows in set (0.03 sec)
--some more operations:

Update Person's Name:

--Update the name of a person using their ID:

UPDATE person SET name = 'New Name' WHERE id = <person_id>;


--Update the capital of a company using its name:

UPDATE company SET capital = <new_capital> WHERE name = '<company_name>';


--Delete a person along with their investments using their ID:

DELETE FROM investment WHERE person_id = <person_id>;
DELETE FROM person WHERE id = <person_id>;


--Delete an investment using its ID:
DELETE FROM investment WHERE id = <investment_id>;


--Update the share amount for a specific investment:

UPDATE investment SET share = <new_share> WHERE id = <investment_id>;
--Cascade Deletion of Person:

--Configure the foreign key constraint to cascade delete associated investments when a person is deleted:

ALTER TABLE investment ADD CONSTRAINT fk_person CASCADE;
List People and Their Investments:

--Retrieve a list of people along with the investments they made:

SELECT p.id, p.name, i.company_name, i.share FROM person p
LEFT JOIN investment i ON p.id = i.person_id;
List Companies and Their Investors:

--Retrieve a list of companies along with the people who have invested in them:

SELECT c.name AS company_name, p.name AS investor_name FROM company c
LEFT JOIN investment i ON c.name = i.company_name
LEFT JOIN person p ON i.person_id = p.id;
--Change Person's Parent (Father or Mother):

--Update a person's father or mother using their ID:

UPDATE person SET father_id = <new_father_id> WHERE id = <person_id>;
UPDATE person SET mother_id = <new_mother_id> WHERE id = <person_id>;
--List People and Their Full Parents Information:

--Retrieve a list of people along with their father's and mother's names:

SELECT p.name, f.name AS father_name, m.name AS mother_name FROM person p
LEFT JOIN person f ON p.father_id = f.id
LEFT JOIN person m ON p.mother_id = m.id;
