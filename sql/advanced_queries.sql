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
