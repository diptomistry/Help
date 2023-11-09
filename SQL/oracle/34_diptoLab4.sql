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

