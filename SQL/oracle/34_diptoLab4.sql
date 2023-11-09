CREATE TABLE person (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    dob DATE,
    gender VARCHAR2(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    father_id NUMBER,
    mother_id NUMBER,
    CONSTRAINT fk_father FOREIGN KEY (father_id) REFERENCES person(id),
    CONSTRAINT fk_mother FOREIGN KEY (mother_id) REFERENCES person(id)
);
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
-- Commit the changes
COMMIT;

CREATE TABLE company (
    name VARCHAR2(255) PRIMARY KEY,
    capital DECIMAL(18, 2)
);

-- Inserting Bangladeshi company data into the company table
-- Replace the values with actual data

INSERT INTO company (name, capital) VALUES ('ABC Ltd.', 500000.00);
INSERT INTO company (name, capital) VALUES ('XYZ Group', 750000.50);
INSERT INTO company (name, capital) VALUES ('Tech Solutions Ltd.', 300000.75);
INSERT INTO company (name, capital) VALUES ('Fashion World', 1000000.25);
INSERT INTO company (name, capital) VALUES ('Green Agro Ltd.', 800000.00);
INSERT INTO company (name, capital) VALUES ('City Bank', 2000000.50);
INSERT INTO company (name, capital) VALUES ('Health Care Pharma', 450000.00);
INSERT INTO company (name, capital) VALUES ('Travel Express', 600000.75);
INSERT INTO company (name, capital) VALUES ('Energy Power Ltd.', 1200000.25);
INSERT INTO company (name, capital) VALUES ('Educate Plus', 350000.00);
CREATE TABLE investment (
    id NUMBER PRIMARY KEY,
    company_name VARCHAR2(255),
    person_id NUMBER,
    comShare DECIMAL(10, 2),
    FOREIGN KEY (company_name) REFERENCES company(name),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

INSERT INTO investment (id, company_name, person_id, comShare)
VALUES (1, 'ABC Ltd.', 1, 20.50);

INSERT INTO investment (id, company_name, person_id, comShare)
VALUES (2, 'XYZ Group', 3, 15.75);

INSERT INTO investment (id, company_name, person_id, comShare)
VALUES (3, 'Tech Solutions Ltd.', 5, 30.25);

INSERT INTO investment (id, company_name, person_id, comShare)
VALUES (4, 'Fashion World', 2, 25.00);

INSERT INTO investment (id, company_name, person_id, comShare)
VALUES (5, 'Green Agro Ltd.', 4, 10.50);

INSERT INTO investment (id, company_name, person_id, comShare)
VALUES (6, 'City Bank', 6, 40.75);

INSERT INTO investment (id, company_name, person_id, comShare)
VALUES (7, 'Health Care Pharma', 8, 18.20);

INSERT INTO investment (id, company_name, person_id, comShare)
VALUES (8, 'Travel Express', 10, 22.80);

INSERT INTO investment (id, company_name, person_id, comShare)
VALUES (9, 'Energy Power Ltd.', 7, 35.60);

INSERT INTO investment (id, company_name, person_id, comShare)
VALUES (10, 'Educate Plus', 9, 28.90);

SELECT id, name
FROM person
WHERE father_id IS NULL;

        ID NAME                                                                                                                                                                                                                                                           
---------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
         1 Mohammad Rahman                                                                                                                                                                                                                                                
         7 Rahim Hasan                                                                                                                                                                                                                                                    
        15 Fariha Haque 
SELECT id, name
FROM person
WHERE mother_id IS NULL;
        ID NAME                                                                                                                                                                                                                                                           
---------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
         1 Mohammad Rahman                                                                                                                                                                                                                                                
         7 Rahim Hasan                                                                                                                                                                                                                                                    
        16 Rakib Hassan         
                                                                                                                                                                                                                                                 
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

SELECT p.id, p.name
FROM person p
LEFT JOIN person father ON p.father_id = father.id
LEFT JOIN person mother ON p.mother_id = mother.id
WHERE father.id IS NULL AND mother.id IS NULL;
        ID NAME                                                                                                                                                                                                                                                           
---------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
         1 Mohammad Rahman                                                                                                                                                                                                                                                
         7 Rahim Hasan        
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
