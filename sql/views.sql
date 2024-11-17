--View that helps with seeing active courses
CREATE VIEW ActiveCourses AS
    -> SELECT Course_ID, Course_Name, Start_date, End_date
    -> FROM Course
    -> WHERE CURDATE() BETWEEN Start_date AND End_date;

--View that helps see the enrollement of the users
CREATE VIEW EnrollmentDetails AS
    -> SELECT e.Enroll_ID, u.F_name, u.L_name, c.Course_Name, e.Enrollment_date
    -> FROM Enrollment e
    -> JOIN Student_Credentials sc ON e.Student_ID = sc.Student_ID
    -> JOIN Users u ON sc.User_ID = u.User_ID
    -> JOIN Course c ON e.Course_ID = c.Course_ID;
