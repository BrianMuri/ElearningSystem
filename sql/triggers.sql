DELIMITER //

-- Trigger to ensure only 'Student' users can be added to Student_Credentials
CREATE TRIGGER before_student_insert
BEFORE INSERT ON Student_Credentials
FOR EACH ROW
BEGIN
    DECLARE user_role VARCHAR(20);

    -- Check the role of the user being added to Student_Credentials
    SELECT Role INTO user_role FROM Users WHERE User_ID = NEW.User_ID;

    -- Raise an error if the role is not 'Student'
    IF user_role != 'Student' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Only users with the role "Student" can be added to Student_Credentials.';
    END IF;
END //

-- Trigger to ensure only 'Instructor' users can be added to Instructor_Credentials
CREATE TRIGGER before_instructor_insert
BEFORE INSERT ON Instructor_Credentials
FOR EACH ROW
BEGIN
    DECLARE user_role VARCHAR(20);

    -- Check the role of the user being added to Instructor_Credentials
    SELECT Role INTO user_role FROM Users WHERE User_ID = NEW.User_ID;

    -- Raise an error if the role is not 'Instructor'
    IF user_role != 'Instructor' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Only users with the role "Instructor" can be added to Instructor_Credentials.';
    END IF;
END //

-- Trigger to check course dates before insertion
CREATE TRIGGER before_course_insert
BEFORE INSERT ON Course
FOR EACH ROW
BEGIN
    IF NEW.Start_date > NEW.End_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Start date cannot be after end date.';
    END IF;
END //

-- Trigger to prevent duplicate enrollment
CREATE TRIGGER before_enrollment_insert
BEFORE INSERT ON Enrollment
FOR EACH ROW
BEGIN
    DECLARE enrollment_exists INT;

    SELECT COUNT(*) INTO enrollment_exists
    FROM Enrollment
    WHERE Student_ID = NEW.Student_ID 
      AND Course_ID = NEW.Course_ID;

    IF enrollment_exists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Student is already enrolled in this course.';
    END IF;
END //

-- Trigger to prevent assignments with past due dates
CREATE TRIGGER prevent_past_due_date
BEFORE INSERT ON Assignment
FOR EACH ROW
BEGIN
    IF NEW.Due_Date < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Due date cannot be in the past.';
    END IF;
END //

-- Trigger to ensure students only submit once per assignment
CREATE TRIGGER prevent_duplicate_submission
BEFORE INSERT ON Submission
FOR EACH ROW
BEGIN
    DECLARE existing_submission INT;

    SELECT COUNT(*) INTO existing_submission
    FROM Submission
    WHERE Assign_ID = NEW.Assign_ID 
      AND Student_ID = NEW.Student_ID;

    IF existing_submission > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Duplicate submission: This student has already submitted for the assignment.';
    END IF;
END //

-- Trigger to auto-set default feedback on submission
CREATE TRIGGER default_feedback_on_submission
BEFORE INSERT ON Submission
FOR EACH ROW
BEGIN
    IF NEW.Feedback IS NULL OR NEW.Feedback = '' THEN
        SET NEW.Feedback = 'No feedback provided.';
    END IF;
END //

-- Trigger to ensure lessons belong to valid courses
CREATE TRIGGER ensure_valid_course_for_lesson
BEFORE INSERT ON Lesson
FOR EACH ROW
BEGIN
    DECLARE course_exists INT;

    SELECT COUNT(*) INTO course_exists
    FROM Course
    WHERE Course_ID = NEW.Course_ID;

    IF course_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid Course_ID: The referenced course does not exist.';
    END IF;
END //

DELIMITER ;
