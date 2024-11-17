--Stored Procedure to add a user and their credentials
CREATE PROCEDURE AddUser(
    IN p_username VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_password VARCHAR(100),
    IN p_f_name VARCHAR(50),
    IN p_l_name VARCHAR(50),
    IN p_role ENUM('Student', 'Instructor'),
    IN p_enrollment_date DATE,
    IN p_expertise VARCHAR(100)
)
BEGIN
    DECLARE new_user_id INT;
    INSERT INTO Users (Username, Email, Password, F_name, L_name, Role)
    VALUES (p_username, p_email, p_password, p_f_name, p_l_name, p_role);

    --Get the ID of the new user
    SET new_user_id = LAST_INSERT_ID();

    --insert into either Student_Credentials or Instructor_Credentials
    IF p_role = 'Student' THEN
        INSERT INTO Student_Credentials (User_ID, Enrollment_date)
        VALUES (new_user_id, p_enrollment_date);
    ELSEIF p_role = 'Instructor' THEN
        INSERT INTO Instructor_Credentials (User_ID, Expertise)
        VALUES (new_user_id, p_expertise);
    END IF;
END //
 


--Stored Procedure to add a new course
DELIMITER //
CREATE PROCEDURE AddNewCourse(
    IN p_course_name VARCHAR(100),
    IN p_instructor_id INT,
    IN p_start_date DATE,
    IN p_end_date DATE,
    IN p_description TEXT
)
BEGIN
    INSERT INTO Course (Course_Name, Instructor_ID, Start_date, End_date, Course_Description)
    VALUES (p_course_name, p_instructor_id, p_start_date, p_end_date, p_description);
END //
DELIMITER ;

--Stored Procedure to add a new assignment
DELIMITER //
CREATE PROCEDURE AddAssi(
    IN p_course_id INT,
    IN p_due_date DATE,
    IN p_assign_description TEXT
)
BEGIN
    INSERT INTO Assignment (Course_ID, Due_Date, Assign_Description)
    VALUES (p_course_id, p_due_date, p_assign_description);
END //
DELIMITER ;

--Stored Procedure to add a new submission
DELIMITER //
CREATE PROCEDURE AddSubmit(
    IN p_assign_id VARCHAR(45),
    IN p_student_id VARCHAR(45),
    IN p_submission_date DATE,
    IN p_grade DECIMAL(3, 2),
    IN p_feedback TEXT
)
BEGIN
    INSERT INTO Submission (Assign_ID, Student_ID, Submission_Date, Grade, Feedback)
    VALUES (p_assign_id, p_student_id, p_submission_date, p_grade, p_feedback);
END //
DELIMITER ;

--Stored Procedure to add a new lesson
DELIMITER //
CREATE PROCEDURE AddLecture(
    IN p_course_id INT NOT NULL,
    IN p_lesson_title TEXT,
    IN p_lesson_content LONGTEXT
)
BEGIN
    INSERT INTO Lesson (Course_ID, Lesson_Title, Lesson_Content)
    VALUES (p_course_id, p_lesson_title, p_lesson_content);
END //
DELIMITER ;
