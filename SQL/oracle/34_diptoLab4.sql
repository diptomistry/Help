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
