--Enrollment of students to courses
SELECT c.Course_Name, COUNT(e.Enroll_ID) AS Enrolled_Students
    -> FROM Course c
    -> LEFT JOIN Enrollment e ON c.Course_ID = e.Course_ID
    -> GROUP BY c.Course_Name
    -> ORDER BY Enrolled_Students DESC;

