CREATE TABLE tbl_ExamMarks (
    StudentID NUMERIC,
    Course VARCHAR(50),
    ExamDate DATE,
    IncourseMarks INT,
    FinalMarks INT,
    TotalMarks INT,
    PRIMARY KEY (StudentID, Course, ExamDate)
);

-- Example data with valid date values
INSERT INTO tbl_ExamMarks (StudentID, Course, ExamDate, IncourseMarks, FinalMarks, TotalMarks)
VALUES
    (1, 'C1', '2023-08-01', 30, 42, 72),
    (1, 'C2', '2023-08-15', 18, 40, 58),
    (1, 'C3', '2023-08-30', 22, 32, 44),
    (2, 'C1', '2023-08-01', 26, 37, 63),
    (2, 'C1', '2023-09-01', 26, 41, 67),
    (1, 'C3', '2023-09-15', 22, 33, 55),
    (1, 'C1', '2023-09-30', 30, 22, 52),
    (2, 'C1', '2023-10-15', 26, 33, 59);

-- Task 2: Queries
-- I) Print GradeSheet/Transcript for a given StudentID
SELECT StudentID, Course, ExamDate, (IncourseMarks + FinalMarks) AS ObtainedMarks
FROM tbl_ExamMarks
WHERE StudentID = '1';

-- II) Find maximum and average obtained marks for a course on a particular exam date
SELECT Course, ExamDate, MAX(IncourseMarks + FinalMarks) AS MaxObtainedMarks, AVG(IncourseMarks + FinalMarks) AS AvgObtainedMarks
FROM tbl_ExamMarks
WHERE Course = 'C1' AND ExamDate = '2023-08-01';

-- III) Find the list of students who attempted a course only once
SELECT StudentID
FROM tbl_ExamMarks
GROUP BY StudentID
HAVING COUNT(DISTINCT Course) = 1;

