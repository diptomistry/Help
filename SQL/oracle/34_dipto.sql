CREATE TABLE universities (
    university_id NUMBER PRIMARY KEY,
    university_name VARCHAR2(255),
    founded_date DATE,
    location VARCHAR2(255),
    website VARCHAR2(255),
    ranking_2023 NUMBER,
    type VARCHAR2(20),
    QSWorldRanking_2023 VARCHAR2(20)
);
CREATE TABLE facilities (
    facility_id NUMBER PRIMARY KEY,
    Faculty_number NUMBER,
    Departments_num NUMBER,
    Institutes_num NUMBER,
    Residential_Halls_num NUMBER,
    Research_Centres NUMBER,
    Library NUMBER,
    university_id NUMBER,
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);
CREATE TABLE university_metrics (
    metric_id NUMBER PRIMARY KEY,
    university_id NUMBER,
    Enrollment NUMBER,
    Budget_in_crore NUMBER,
    FacultyToStudentRatio VARCHAR2(20),
    ResearchFunding_in_crore NUMBER,
    CampusSize_in_acre NUMBER,
    GraduationRate NUMBER,
    AcceptanceRate NUMBER,
    SatisfactionRating NUMBER,
    Endowment_in_crore NUMBER,
    ResearchPublications NUMBER,
    Year NUMBER,
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);



--FUNCTION,TRIGGER,PROCEDURE
Function to Generate Facility ID in the ‘facilities’ Table
Creating a function to generate a new facility_id:
CREATE OR REPLACE FUNCTION generateFacilityId RETURN NUMBER IS
  newFacilityId NUMBER;
BEGIN
  SELECT NVL(MAX(facility_id), 0) + 1 INTO newFacilityId FROM facilities;
  RETURN newFacilityId;
END;
/
Trigger to Auto-Generate Facility ID
Creating a trigger that automatically populates the facility_id before an insertion:
CREATE OR REPLACE TRIGGER trg_facility_bef_ins
BEFORE INSERT ON facilities
FOR EACH ROW
BEGIN
  :NEW.facility_id := generateFacilityId;
END;
/

Function to Generate metric_id in the ‘ university_metrics’ Table
CREATE OR REPLACE FUNCTION generatemetric_id RETURN NUMBER IS
  new_metric_id NUMBER;
BEGIN
  SELECT NVL(MAX(metric_id), 0) + 1 INTO new_metric_id FROM university_metrics;
  RETURN new_metric_id;
END;
Trigger
CREATE OR REPLACE TRIGGER trg_metric_id_bef_ins
BEFORE INSERT ON university_metrics
FOR EACH ROW
BEGIN
  :NEW.metric_id := generatemetric_id;
END;
/




Example of a procedure to insert data into the university_metrics table:
CREATE OR REPLACE PROCEDURE InsertUniversityMetrics(
    p_university_id IN NUMBER,
    p_Enrollment IN NUMBER,
    p_Budget_in_crore IN NUMBER,
    p_FacultyToStudentRatio IN VARCHAR2,
    p_ResearchFunding_in_crore IN NUMBER,
    p_CampusSize_in_acre IN NUMBER,
    p_GraduationRate IN NUMBER,
    p_AcceptanceRate IN NUMBER,
    p_SatisfactionRating IN NUMBER,
    p_Endowment_in_crore IN NUMBER,
    p_ResearchPublications IN NUMBER,
    p_Year IN NUMBER
) AS
BEGIN
    INSERT INTO university_metrics (
        university_id,
        Enrollment,
        Budget_in_crore,
        FacultyToStudentRatio,
        ResearchFunding_in_crore,
        CampusSize_in_acre,
        GraduationRate,
        AcceptanceRate,
        SatisfactionRating,
        Endowment_in_crore,
        ResearchPublications,
        Year
    ) VALUES (
        p_university_id,
        p_Enrollment,
        p_Budget_in_crore,
        p_FacultyToStudentRatio,
        p_ResearchFunding_in_crore,
        p_CampusSize_in_acre,
        p_GraduationRate,
        p_AcceptanceRate,
        p_SatisfactionRating,
        p_Endowment_in_crore,
        p_ResearchPublications,
        p_Year
    );
    COMMIT;
    dbms_output.put_line('University Metrics Inserted Successfully for University ID: ' || p_university_id);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error: ' || SQLERRM);
        ROLLBACK;
END;
/
Checking:
BEGIN
    InsertUniversityMetrics(
        101,           -- university_id
        5000,        -- Enrollment
        100,         -- Budget_in_crore
        '1:20',      -- FacultyToStudentRatio
        50,          -- ResearchFunding_in_crore
        50,          -- CampusSize_in_acre
        80,          -- GraduationRate
        70,          -- AcceptanceRate
        4.5,         -- SatisfactionRating
        200,         -- Endowment_in_crore
        1000,        -- ResearchPublications
        2023         -- Year
    );
END;
/

SELECT *
FROM university_metrics
WHERE university_id = 101; 



Stored procedure
–to display the Enrollment and Budget metrics for each row fetched from the university_metrics table.
CREATE OR REPLACE PROCEDURE GetUniversityMetrics(
    p_university_id IN NUMBER,
    p_year IN NUMBER
) AS
BEGIN
    FOR metrics IN (
        SELECT *
        FROM university_metrics
        WHERE university_id = p_university_id AND Year = p_year
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Metric ID: ' || metrics.metric_id || ', Enrollment: ' || metrics.Enrollment || ', Budget: ' || metrics.Budget_in_crore);
        -- Add more DBMS_OUTPUT.PUT_LINE lines for other metrics as needed
    END LOOP;
END;
SET SERVEROUTPUT ON;
EXEC GetUniversityMetrics(1, 2023);

Metric ID: 1, Enrollment: 37018, Budget: 913


PL/SQL procedure successfully completed.




--trigger to get notification after DML

create or replace TRIGGER trg_before_UniversityData_change
BEFORE INSERT OR DELETE OR UPDATE ON universities
FOR EACH ROW--operates on each row affected by the triggering statement 
DECLARE
    v_user VARCHAR2(20); --to store the username
BEGIN
    SELECT user INTO v_user From dual;
-- retrieves the current database user and assigns it to the v_user variable.
--DUAL is a dummy table in Oracle, and user is a pseudocolumn that represents the current user.
    IF INSERTING THEN

       DBMS_OUTPUT.PUT_LINE('New data is inserted in the UNIVERSITIES table by '||v_user);

    ELSIF DELETING THEN

        DBMS_OUTPUT.PUT_LINE('New data is deleteded from the UNIVERSITIES table by '||v_user );

    ELSIF UPDATING THEN

        DBMS_OUTPUT.PUT_LINE('New data is updated in the UNIVERSITIES table by '||v_user);

    END IF;

END;

SET SERVEROUTPUT ON; 










--making audit
create table university_audit(
new_name varchar2(30),
old_name varchar2(30),
user_name varchar(30),
entry_date varchar2(30),
operation varchar2(30)
);
ALTER TABLE university_audit
MODIFY new_name VARCHAR2(100);
ALTER TABLE university_audit
MODIFY old_name VARCHAR2(100);


CREATE OR REPLACE trigger university_audit
BEFORE INSERT OR DELETE OR UPDATE ON universities
FOR EACH ROW
ENABLE--will start working as soon as we compile
DECLARE
  v_user varchar2 (30);--to store username
  v_date  varchar2(30);--to store entry date
BEGIN--user is a pseudocolumn that returns the current database user.
  SELECT user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS') INTO v_user, v_date  FROM dual;-- converts the sysdate (current date and time) into a specific string format
  IF INSERTING THEN
    INSERT INTO university_audit (new_name,old_name, user_name, entry_date, operation) 
    VALUES(:NEW.university_name, Null , v_user, v_date, 'Insert');  
  ELSIF DELETING THEN
    INSERT INTO university_audit (new_name,old_name, user_name, entry_date, operation)
    VALUES(NULL,:OLD.university_name, v_user, v_date, 'Delete');
  ELSIF UPDATING THEN
    INSERT INTO university_audit (new_name,old_name, user_name, entry_date, operation) 
    VALUES(:NEW.university_name, :OLD.university_name, v_user, v_date,'Update');
  END IF;
END;
--:NEW and :OLD are pseudorecords
/

--new_name: For an INSERT or UPDATE operation, it captures the new university_name value from the :NEW pseudorecord. For DELETE, it remains NULL.
--old_name: For a DELETE or UPDATE operation, it captures the old university_name value from the :OLD pseudorecord. For INSERT, it remains NULL.
--user_name: It stores the username of the user who initiated the action.
--entry_date: Records the timestamp (date and time) of when the action occurred.
--operation: Identifies the type of operation performed (Insert, Delete, Update).







 --Another audit for DDL update:
CREATE TABLE schema_audit
  (
    ddl_date       DATE,
    ddl_user       VARCHAR2(15),
    object_created VARCHAR2(15),
    object_name    VARCHAR2(30),
    ddl_operation  VARCHAR2(15)
  );

CREATE OR REPLACE TRIGGER audit_tr 
AFTER DDL ON SCHEMA
BEGIN
    INSERT INTO schema_audit VALUES (
sysdate, --date
sys_context('USERENV','CURRENT_USER'), 
ora_dict_obj_type, -- type of the dictionary object(for example table)
ora_dict_obj_name, --obj name(table name)
ora_sysevent);--ddl name
END;
--ddl_date: Records the timestamp (date and time) of when the DDL operation occurred (sysdate).
--ddl_user: Captures the user who executed the DDL operation (sys_context('USERENV','CURRENT_USER')).
--object_created: Specifies the type of object created (e.g., TABLE, VIEW) by extracting the DDL object type (ora_dict_obj_type).
--object_name: Stores the name of the object affected by the DDL operation (e.g., the table name) (ora_dict_obj_name).
--ddl_operation: Identifies the type of DDL operation performed (e.g., CREATE, ALTER, DROP) (ora_sysevent).
