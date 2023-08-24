--INSERT INTO company (name, capital)
    -> VALUES ('Google', 1000000.00);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO company (name, capital)
    -> VALUES ('Microsoft', 2000000.00);
Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO company (name, capital)
    -> VALUES ('Oracle', 2000000.00);
Query OK, 1 row affected (0.08 sec)

mysql> select*from company
    -> ;
+-----------+------------+
| name      | capital    |
+-----------+------------+
| 123 Inc.  |    5000.00 |
| Google    | 1000000.00 |
| Microsoft | 2000000.00 |
| Oracle    | 2000000.00 |
+-----------+------------+
4 rows in set (0.00 sec)

mysql> DELETE FROM company
    -> WHERE capital = 5000;
Query OK, 1 row affected (0.11 sec)


mysql> INSERT INTO investment (id, company_name, person_id, share)
    -> VALUES (1, 'Google', 1, 1000.00);
Query OK, 1 row affected (0.08 sec)

mysql> INSERT INTO investment (id, company_name, person_id, share)
    -> VALUES (1, 'Microsoft', 1, 1000.00);
ERROR 1062 (23000): Duplicate entry '1' for key 'investment.PRIMARY'
mysql> INSERT INTO investment (id, company_name, person_id, share)
    -> VALUES (2, 'Microsoft', 2, 2000.00);
Query OK, 1 row affected (0.09 sec)

mysql> INSERT INTO investment (id, company_name, person_id, share) VALUES (3, 'Oracle', 3, 3000.00);
Query OK, 1 row affected (0.07 sec)

mysql> select* from investment;
+----+--------------+-----------+---------+
| id | company_name | person_id | share   |
+----+--------------+-----------+---------+
|  1 | Google       |         1 | 1000.00 |
|  2 | Microsoft    |         2 | 2000.00 |
|  3 | Oracle       |         3 | 3000.00 |
+----+--------------+-----------+---------+
3 rows in set (0.00 sec)

mysql> select*from company;
+-----------+------------+
| name      | capital    |
+-----------+------------+
| Google    | 1000000.00 |
| Microsoft | 2000000.00 |
| Oracle    | 2000000.00 |
+-----------+------------+
3 rows in set (0.01 sec)

mysql> VALUES (2, 'Microsoft', 2, 2000.00);-- Inserting an investment for 'Microsoft' and 'Jane Smith'
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(2, 'Microsoft', 2, 2000.00)' at line 1
mysql> INSERT INTO investment (id, company_name, person_id, share)
    -> VALUES (6, 'Microsoft', 2, 1500.00);
Query OK, 1 row affected (0.02 sec)

mysql> 
mysql> -- Inserting an investment for 'Apple' and 'Michael Johnson'
mysql> INSERT INTO investment (id, company_name, person_id, share)
    -> VALUES (7, 'Google', 3, 2000.00);
Query OK, 1 row affected (0.02 sec)

mysql> 
mysql> -- Inserting another investment for 'Oracle' and 'Emily Brown'
mysql> INSERT INTO investment (id, company_name, person_id, share)
    -> VALUES (8, 'Oracle', 4, 1200.00);
Query OK, 1 row affected (0.09 sec)

mysql> select * from investment;
+----+--------------+-----------+---------+
| id | company_name | person_id | share   |
+----+--------------+-----------+---------+
|  1 | Google       |         1 | 1000.00 |
|  2 | Microsoft    |         2 | 2000.00 |
|  3 | Oracle       |         3 | 3000.00 |
|  6 | Microsoft    |         2 | 1500.00 |
|  7 | Google       |         3 | 2000.00 |
|  8 | Oracle       |         4 | 1200.00 |
+----+--------------+-----------+---------+
6 rows in set (0.00 sec)

mysql> -- Inserting an investment for 'Google' and 'John Doe'
mysql> INSERT INTO investment (id, company_name, person_id, share)
    -> VALUES (9, 'Google', 1, 800.00);
Query OK, 1 row affected (0.05 sec)

mysql> 
mysql> -- Inserting an investment for 'Microsoft' and 'Jane Smith'
mysql> INSERT INTO investment (id, company_name, person_id, share)
    -> VALUES (10, 'Microsoft', 2, 2500.00);
Query OK, 1 row affected (0.04 sec)

mysql> 
mysql> -- Inserting an investment for 'Oracle' and 'Michael Johnson'
mysql> INSERT INTO investment (id, company_name, person_id, share)
    -> VALUES (11, 'Oracle', 3, 1700.00);
Query OK, 1 row affected (0.02 sec)

mysql> 
mysql> -- Inserting an investment for 'Google' and 'Emily Brown'
mysql> INSERT INTO investment (id, company_name, person_id, share)
    -> VALUES (12, 'Google', 4, 1200.00);
Query OK, 1 row affected (0.01 sec)

mysql> 
mysql> -- Inserting an investment for 'Microsoft' and 'Robert Wilson'
mysql> INSERT INTO investment (id, company_name, person_id, share)
    -> VALUES (13, 'Microsoft', 5, 900.00);
Query OK, 1 row affected (0.03 sec)

mysql> 
mysql> -- Inserting an investment for 'Oracle' and 'Mary Davis'
mysql> INSERT INTO investment (id, company_name, person_id, share)
    -> VALUES (14, 'Oracle', 6, 600.00);
Query OK, 1 row affected (0.03 sec)

mysql> 
mysql> -- Inserting an investment for 'Google' and 'David Anderson'
mysql> INSERT INTO investment (id, company_name, person_id, share)
    -> VALUES (15, 'Google', 7, 1800.00);
Query OK, 1 row affected (0.01 sec)

mysql> 
mysql> -- Inserting an investment for 'Microsoft' and 'Olivia Martinez'
mysql> INSERT INTO investment (id, company_name, person_id, share)
    -> VALUES (16, 'Microsoft', 8, 1500.00);
Query OK, 1 row affected (0.02 sec)

mysql> 
mysql> -- Inserting an investment for 'Oracle' and 'William Taylor'
mysql> INSERT INTO investment (id, company_name, person_id, share)
    -> VALUES (17, 'Oracle', 9, 1400.00);
Query OK, 1 row affected (0.03 sec)

mysql> 
mysql> -- Inserting an investment for 'Google' and 'Sophia Johnson'
mysql> INSERT INTO investment (id, company_name, person_id, share)
    -> VALUES (18, 'Google', 10, 1100.00);
Query OK, 1 row affected (0.02 sec)

mysql> select*from investment;
+----+--------------+-----------+---------+
| id | company_name | person_id | share   |
+----+--------------+-----------+---------+
|  1 | Google       |         1 | 1000.00 |
|  2 | Microsoft    |         2 | 2000.00 |
|  3 | Oracle       |         3 | 3000.00 |
|  6 | Microsoft    |         2 | 1500.00 |
|  7 | Google       |         3 | 2000.00 |
|  8 | Oracle       |         4 | 1200.00 |
|  9 | Google       |         1 |  800.00 |
| 10 | Microsoft    |         2 | 2500.00 |
| 11 | Oracle       |         3 | 1700.00 |
| 12 | Google       |         4 | 1200.00 |
| 13 | Microsoft    |         5 |  900.00 |
| 14 | Oracle       |         6 |  600.00 |
| 15 | Google       |         7 | 1800.00 |
| 16 | Microsoft    |         8 | 1500.00 |
| 17 | Oracle       |         9 | 1400.00 |
| 18 | Google       |        10 | 1100.00 |
+----+--------------+-----------+---------+
16 rows in set (0.00 sec)

mysql> select company_name,count(*) as num_investor
    -> from investment 
    -> group by company_name;
+--------------+--------------+
| company_name | num_investor |
+--------------+--------------+
| Google       |            6 |
| Microsoft    |            5 |
| Oracle       |            5 |
+--------------+--------------+
3 rows in set (0.00 sec)
mysql> SELECT DISTINCT
    ->     CONCAT(p1.name, ' and ', p2.name) AS family_investors,
    ->     i.company_name,
    ->     i.share
    -> FROM person p1
    -> JOIN person p2 ON p1.father_id = p2.father_id OR p1.mother_id = p2.mother_id
    -> JOIN investment i ON p1.id = i.person_id OR p2.id = i.person_id
    -> ORDER BY family_investors, i.company_name;
+-------------------------------------+--------------+---------+
| family_investors                    | company_name | share   |
+-------------------------------------+--------------+---------+
| David Anderson and David Anderson   | Google       | 1800.00 |
| David Anderson and Olivia Martinez  | Google       | 1800.00 |
| David Anderson and Olivia Martinez  | Microsoft    | 1500.00 |
| Emily Brown and Emily Brown         | Google       | 1200.00 |
| Emily Brown and Emily Brown         | Oracle       | 1200.00 |
| Emily Brown and Michael Johnson     | Google       | 2000.00 |
| Emily Brown and Michael Johnson     | Google       | 1200.00 |
| Emily Brown and Michael Johnson     | Oracle       | 3000.00 |
| Emily Brown and Michael Johnson     | Oracle       | 1700.00 |
| Emily Brown and Michael Johnson     | Oracle       | 1200.00 |
| Michael Johnson and Emily Brown     | Google       | 2000.00 |
| Michael Johnson and Emily Brown     | Google       | 1200.00 |
| Michael Johnson and Emily Brown     | Oracle       | 3000.00 |
| Michael Johnson and Emily Brown     | Oracle       | 1700.00 |
| Michael Johnson and Emily Brown     | Oracle       | 1200.00 |
| Michael Johnson and Michael Johnson | Google       | 2000.00 |
| Michael Johnson and Michael Johnson | Oracle       | 1700.00 |
| Michael Johnson and Michael Johnson | Oracle       | 3000.00 |
| Olivia Martinez and David Anderson  | Google       | 1800.00 |
| Olivia Martinez and David Anderson  | Microsoft    | 1500.00 |
| Olivia Martinez and Olivia Martinez | Microsoft    | 1500.00 |
+-------------------------------------+--------------+---------+
21 rows in set (0.01 sec)
