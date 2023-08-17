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
-- Inserting a single record
INSERT INTO company (name, capital)
VALUES ('ABC Corporation', 1000000.00);

-- Inserting multiple records in a single statement
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

