CREATE TABLE person (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    dob DATE,
    gender VARCHAR2(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    father_id NUMBER,
    mother_id NUMBER,
    CONSTRAINT fk_father FOREIGN KEY (father_id) REFERENCES person(id),
    CONSTRAINT fk_mother FOREIGN KEY (mother_id) REFERENCES person(id)-- (i) The father and mother refer to the person_id, 
);
CREATE TABLE company (
    id INT PRIMARY KEY,
    name VARCHAR2(255) UNIQUE,
    capital DECIMAL(18, 2)
);
CREATE TABLE investment (
    company_id INT,
    person_id INT,
    comShare DECIMAL(10, 2),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);
                                       --insert into person--

-- Male person with no parents
INSERT INTO person (id, name, dob, gender, father_id, mother_id)
VALUES (1, 'Mohammad Rahman', TO_DATE('1985-03-10', 'YYYY-MM-DD'), 'Male', NULL, NULL);

-- Female person with parents
INSERT INTO person (id, name, dob, gender, father_id, mother_id)
VALUES (2, 'Fatima Ahmed', TO_DATE('1990-06-25', 'YYYY-MM-DD'), 'Female', 1, 1);

-- Male person with parents
INSERT INTO person (id, name, dob, gender, father_id, mother_id)
VALUES (3, 'Abdul Khan', TO_DATE('1980-12-05', 'YYYY-MM-DD'), 'Male', 1, 2);

-- Female person with parents
INSERT INTO person (id, name, dob, gender, father_id, mother_id)
VALUES (4, 'Ayesha Rahman', TO_DATE('1995-09-15', 'YYYY-MM-DD'), 'Female', 3, 2);
-- Inserting more Bangladeshi data into the person table

-- Male person with parents
INSERT INTO person (id, name, dob, gender, father_id, mother_id)
VALUES (5, 'Arif Khan', TO_DATE('1992-08-20', 'YYYY-MM-DD'), 'Male', 3, 4);

-- Female person with parents
INSERT INTO person (id, name, dob, gender, father_id, mother_id)
VALUES (6, 'Nadia Ahmed', TO_DATE('1998-04-12', 'YYYY-MM-DD'), 'Female', 1, 2);

-- Male person with no parents
INSERT INTO person (id, name, dob, gender, father_id, mother_id)
VALUES (7, 'Rahim Hasan', TO_DATE('1987-11-30', 'YYYY-MM-DD'), 'Male', NULL, NULL);

-- Female person with parents
INSERT INTO person (id, name, dob, gender, father_id, mother_id)
VALUES (8, 'Sabina Khan', TO_DATE('1994-02-18', 'YYYY-MM-DD'), 'Female', 5, 6);

-- Male person with parents
INSERT INTO person (id, name, dob, gender, father_id, mother_id)
VALUES (9, 'Imran Ahmed', TO_DATE('1983-06-08', 'YYYY-MM-DD'), 'Male', 7, 8);

-- Female person with parents
INSERT INTO person (id, name, dob, gender, father_id, mother_id)
VALUES (10, 'Farida Rahman', TO_DATE('1996-09-22', 'YYYY-MM-DD'), 'Female', 9, 8);

-- Male person with parents
INSERT INTO person (id, name, dob, gender, father_id, mother_id)
VALUES (11, 'Samiul Islam', TO_DATE('1989-12-15', 'YYYY-MM-DD'), 'Male', 7, 6);

-- Female person with parents
INSERT INTO person (id, name, dob, gender, father_id, mother_id)
VALUES (12, 'Nazia Khan', TO_DATE('1991-03-28', 'YYYY-MM-DD'), 'Female', 5, 4);

-- Male person with parents
INSERT INTO person (id, name, dob, gender, father_id, mother_id)
VALUES (13, 'Ashraf Ahmed', TO_DATE('1980-05-10', 'YYYY-MM-DD'), 'Male', 11, 12);

-- Female person with parents
INSERT INTO person (id, name, dob, gender, father_id, mother_id)
VALUES (14, 'Sultana Rahman', TO_DATE('1985-10-05', 'YYYY-MM-DD'), 'Female', 13, 12);
INSERT INTO person (id, name, dob, gender, father_id, mother_id)
VALUES (15, 'Fariha Haque', TO_DATE('1985-10-05', 'YYYY-MM-DD'), 'Female', NULL, 12);
INSERT INTO person (id, name, dob, gender, father_id, mother_id)
VALUES (16, 'Rakib Hassan', TO_DATE('1995-10-05', 'YYYY-MM-DD'), 'Female', 12, NULL);
INSERT INTO person (id, name, dob, gender, father_id, mother_id)
VALUES (17, 'Rakib Khan', TO_DATE('2010-10-05', 'YYYY-MM-DD'), 'Male', 11, 10);

                                    --insert into company--
INSERT INTO company (id, name, capital) VALUES (1, 'Google', 500000.00);
INSERT INTO company (id, name, capital) VALUES (2, 'Microsoft', 750000.50);
INSERT INTO company (id, name, capital) VALUES (3, 'Oracle', 300000.75);

                                 --insert into investment--
INSERT INTO investment (company_id, company_name, person_id, comShare)
VALUES (1, 'Google', 1, 20.50);

INSERT INTO investment (company_id, company_name, person_id, comShare)
VALUES (2, 'Microsoft', 3, 15.75);

INSERT INTO investment (company_id, company_name, person_id, comShare)
VALUES (3, 'Google', 5, 30.25);

INSERT INTO investment (company_id, company_name, person_id, comShare)
VALUES (4, 'Microsoft', 2, 25.00);

INSERT INTO investment (company_id, company_name, person_id, comShare)
VALUES (5, 'Google', 4, 10.50);

INSERT INTO investment (company_id, company_name, person_id, comShare)
VALUES (6, 'Microsoft', 6, 40.75);

INSERT INTO investment (company_id, company_name, person_id, comShare)
VALUES (7, 'Google', 8, 18.20);

INSERT INTO investment (company_id, company_name, person_id, comShare)
VALUES (8, 'Microsoft', 10, 22.80);

INSERT INTO investment (company_id, company_name, person_id, comShare)
VALUES (9, 'Google', 7, 35.60);

INSERT INTO investment (company_id, company_name, person_id, comShare)
VALUES (10, 'Oracle', 9, 28.90);


                                              --QUERIES--
--1)Find the number of investors of the companies.
CREATE OR REPLACE PROCEDURE GetCompanyInvestorCount AS
BEGIN
    FOR company_rec IN (SELECT c.name AS company_name, COUNT(i.person_id) AS investor_count
                        FROM company c
                        LEFT JOIN investment i ON c.id = i.company_id
                        GROUP BY c.name)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Company: ' || company_rec.company_name || ', Investor Count: ' || company_rec.investor_count);
    END LOOP;
END;
/
EXEC getcompanyinvestorcount;
--output:

Company: Oracle, Investor Count: 1
Company: Microsoft, Investor Count: 4
Company: Google, Investor Count: 5


--2)Find the total amount invested by a family
CREATE OR REPLACE PROCEDURE CalculateFamilyInvestment (
    in_person_id IN NUMBER
) AS
    v_total_investment NUMBER;
BEGIN
    SELECT NVL(SUM(i.comShare), 0)
    INTO v_total_investment
    FROM investment i
    JOIN person p ON i.person_id = p.id
    WHERE i.person_id = in_person_id
       OR i.person_id IN (
           SELECT id
           FROM person
           WHERE father_id = in_person_id OR mother_id = in_person_id
       );

    DBMS_OUTPUT.PUT_LINE('Total investment by the family: ' || v_total_investment);
END;
/

EXEC CalculateFamilyInvestment(1);
--output:
Total investment by the family: 102
                              --5 more queries--
    --1)person with no father
CREATE OR REPLACE PROCEDURE GetPersonsNoFather AS
  CURSOR no_father_cursor IS
    SELECT id, name
    FROM person
    WHERE father_id IS NULL;
  
  v_id NUMBER;
  v_name VARCHAR2(255);
BEGIN
  OPEN no_father_cursor;
  LOOP
    FETCH no_father_cursor INTO v_id, v_name;
    EXIT WHEN no_father_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Name: ' || v_name);
  END LOOP;
  CLOSE no_father_cursor;
END GetPersonsNoFather;
/

EXEC  GetPersonsNoFather
--output:
ID: 1, Name: Mohammad Rahman
ID: 7, Name: Rahim Hasan
ID: 15, Name: Fariha Haque
--2)person with no father or mother:
SELECT p.id, p.name
FROM person p
LEFT JOIN person father ON p.father_id = father.id
LEFT JOIN person mother ON p.mother_id = mother.id
WHERE father.id IS NULL OR mother.id IS NULL;

        ID NAME                                                                                                                                                                                                                                                           
---------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
         1 Mohammad Rahman                                                                                                                                                                                                                                                
         7 Rahim Hasan                                                                                                                                                                                                                                                    
        15 Fariha Haque                                                                                                                                                                                                                                                   
        16 Rakib Hassan  
--3)person with no father and mother:
SELECT p.id, p.name
FROM person p
LEFT JOIN person father ON p.father_id = father.id
LEFT JOIN person mother ON p.mother_id = mother.id
WHERE father.id IS NULL AND mother.id IS NULL;
        ID NAME                                                                                                                                                                                                                                                           
---------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
         1 Mohammad Rahman                                                                                                                                                                                                                                                
         7 Rahim Hasan    
--4)person with age BETWEEN 20 AND 50:
SELECT id, name, dob, gender
FROM person
WHERE MONTHS_BETWEEN(SYSDATE, dob) / 12 BETWEEN 20 AND 50;

        ID NAME                                                                                                                                                                                                                                                            DOB       GENDER    
---------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------- ----------
         1 Mohammad Rahman                                                                                                                                                                                                                                                 10-MAR-85 Male      
         2 Fatima Ahmed                                                                                                                                                                                                                                                    25-JUN-90 Female    
         3 Abdul Khan                                                                                                                                                                                                                                                      05-DEC-80 Male      
         4 Ayesha Rahman                                                                                                                                                                                                                                                   15-SEP-95 Female    
         5 Arif Khan                                                                                                                                                                                                                                                       20-AUG-92 Male      
         6 Nadia Ahmed                                                                                                                                                                                                                                                     12-APR-98 Female    
         7 Rahim Hasan                                                                                                                                                                                                                                                     30-NOV-87 Male      
         8 Sabina Khan                                                                                                                                                                                                                                                     18-FEB-94 Female    
         9 Imran Ahmed                                                                                                                                                                                                                                                     08-JUN-83 Male      
        10 Farida Rahman                                                                                                                                                                                                                                                   22-SEP-96 Female    
        11 Samiul Islam                                                                                                                                                                                                                                                    15-DEC-89 Male                                                                                                                                                                                                                                                               DOB       GENDER    
        12 Nazia Khan                                                                                                                                                                                                                                                      28-MAR-91 Female    
        13 Ashraf Ahmed                                                                                                                                                                                                                                                    10-MAY-80 Male      
        14 Sultana Rahman                                                                                                                                                                                                                                                  05-OCT-85 Female    
        15 Fariha Haque                                                                                                                                                                                                                                                    05-OCT-85 Female    
        16 Rakib Hassan  
--5)company count
SELECT c.name AS company_name, COUNT(i.person_id) AS investor_count
FROM company c
LEFT JOIN investment i ON c.id = i.company_id
GROUP BY c.name;
--output:
Oracle	1
Microsoft	4
Google	5

