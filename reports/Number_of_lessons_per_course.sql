-- Number of lessons per course
SELECT c.Course_Name, COUNT(l.Lesson_ID) AS Number_of_Lessons
    FROM Course c
    LEFT JOIN Lesson l ON c.Course_ID = l.Course_ID
    GROUP BY c.Course_Name
    ORDER BY Number_of_Lessons DESC;