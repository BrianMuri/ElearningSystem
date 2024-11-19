-- List of lessons per course
SELECT c.Course_Name, l.Lesson_Title, l.Lesson_Content
    FROM Course c
    JOIN Lesson l ON c.Course_ID = l.Course_ID
    ORDER BY c.Course_Name, l.Lesson_Title;