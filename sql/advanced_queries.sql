--List of overdo assignments
SELECT a.Assign_Description, c.Course_Name, a.Due_Date
    -> FROM Assignment a
    -> JOIN Course c ON a.Course_ID = c.Course_ID
    -> WHERE a.Due_Date < CURDATE();


--List of the instructors who teach the same courses
SELECT
    ->     c.Course_Name,
    ->     u.F_name AS Instructor_First_Name,
    ->     u.L_name AS Instructor_Last_Name,
    ->     i.Expertise
    -> FROM Course c
    -> JOIN Instructor_Credentials i ON c.Instructor_ID = i.Instructor_ID
    -> JOIN Users u ON i.User_ID = u.User_ID
    -> WHERE c.Course_Name = 'Database Systems';

--List of students enrolled in more than one course
SELECT
    s.Student_ID,
    u.F_name AS Student_First_Name,
    u.L_name AS Student_Last_Name,
    COUNT(e.Course_ID) AS Number_Of_Courses
FROM Enrollment e
JOIN Students s ON e.Student_ID = s.Student_ID
JOIN Users u ON s.User_ID = u.User_ID
GROUP BY s.Student_ID
HAVING COUNT(e.Course_ID) > 1;


--List of courses with the number of assignments
SELECT
    c.Course_Name,
    COUNT(a.Assign_ID) AS Number_Of_Assignments
FROM Course c
JOIN Assignment a ON c.Course_ID = a.Course_ID
GROUP BY c.Course_Name;


--List of students who have not submitted any assignments
SELECT
    s.Student_ID,
    u.F_name AS Student_First_Name,
    u.L_name AS Student_Last_Name
FROM Students s
JOIN Users u ON s.User_ID = u.User_ID
LEFT JOIN Submissions sub ON s.Student_ID = sub.Student_ID
WHERE sub.Submission_ID IS NULL;
