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
