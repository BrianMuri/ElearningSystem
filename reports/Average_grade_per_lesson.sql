-- Average grade per lesson
SELECT l.Lesson_Title, AVG(s.Grade) AS Average_Grade
    FROM Lesson l
    JOIN Assignment a ON l.Course_ID = a.Course_ID
    JOIN Submission s ON a.Assign_ID = s.Assign_ID
    GROUP BY l.Lesson_Title
    ORDER BY Average_Grade DESC;