--Enrollment of students to courses
SELECT c.Course_Name, COUNT(e.Enroll_ID) AS Enrolled_Students
    -> FROM Course c
    -> LEFT JOIN Enrollment e ON c.Course_ID = e.Course_ID
    -> GROUP BY c.Course_Name
    -> ORDER BY Enrolled_Students DESC;


-- Average grade per course
SELECT c.Course_Name, AVG(g.Grade) AS Average_Grade
    FROM Course c
    LEFT JOIN Enrollment e ON c.Course_ID = e.Course_ID
    LEFT JOIN Grades g ON e.Enroll_ID = g.Enroll_ID
    GROUP BY c.Course_Name
    ORDER BY Average_Grade DESC;

-- Number of students per grade category
SELECT g.Grade, COUNT(e.Enroll_ID) AS Number_of_Students
    FROM Grades g
    LEFT JOIN Enrollment e ON g.Enroll_ID = e.Enroll_ID
    GROUP BY g.Grade
    ORDER BY Number_of_Students DESC;