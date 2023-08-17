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

