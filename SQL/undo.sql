-- Disable AUTOCOMMIT to manage transactions manually
SET AUTOCOMMIT = 0;

-- Start a new transaction
BEGIN;

-- Perform some database operations
INSERT INTO students (student_id, first_name, last_name) VALUES (1, 'John', 'Doe');
UPDATE enrollments SET grade = 'A' WHERE student_id = 1;

-- If everything is successful, commit the changes
COMMIT;

-- If there's an issue or you want to cancel the changes, rollback the transaction
ROLLBACK;

-- Re-enable AUTOCOMMIT
SET AUTOCOMMIT = 1;
