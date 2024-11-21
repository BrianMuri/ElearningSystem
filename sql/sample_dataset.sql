-- Populate Users table
INSERT INTO Users (Username, Email, Password, F_name, L_name, Role)
VALUES
('jmutai', 'john.mutai@gmail.com', 'password123', 'John', 'Mutai', 'Student'),
('mwaweru', 'mary.waweru@gmail.com', 'password123', 'Mary', 'Waweru', 'Student'),
('okothke', 'kevin.okoth@gmail.com', 'password123', 'Kevin', 'Okoth', 'Student'),
('nmwangi', 'nancy.mwangi@gmail.com', 'password123', 'Nancy', 'Mwangi', 'Student'),
('dchebet', 'diana.chebet@gmail.com', 'password123', 'Diana', 'Chebet', 'Student'),
('oomboga', 'oscar.omboga@gmail.com', 'password123', 'Oscar', 'Omboga', 'Instructor'),
('kmbugua', 'ken.mbugua@gmail.com', 'password123', 'Ken', 'Mbugua', 'Instructor'),
('smaina', 'susan.maina@gmail.com', 'password123', 'Susan', 'Maina', 'Instructor'),
('nkariuki', 'nicholas.kariuki@gmail.com', 'password123', 'Nicholas', 'Kariuki', 'Instructor'),
('jlimo', 'jane.limo@gmail.com', 'password123', 'Jane', 'Limo', 'Instructor');

-- Populate Student_Credentials table
INSERT INTO Student_Credentials (User_ID, Enrollment_date)
VALUES
(1, '2023-01-10'),
(2, '2023-01-15'),
(3, '2023-02-01'),
(4, '2023-02-12'),
(5, '2023-03-01');

-- Populate Instructor_Credentials table
INSERT INTO Instructor_Credentials (User_ID, Expertise)
VALUES
(6, 'Data Structures'),
(7, 'Web Development'),
(8, 'Cybersecurity'),
(9, 'Artificial Intelligence'),
(10, 'Mobile Application Development');

-- Populate Course table
INSERT INTO Course (Course_Name, Instructor_ID, Start_date, End_date, Course_Description)
VALUES
('Data Structures', 1, '2023-01-15', '2023-04-15', 'An introduction to data structures like arrays, linked lists, and trees.'),
('Web Development', 2, '2023-02-01', '2023-05-01', 'Learn HTML, CSS, and JavaScript for modern web design.'),
('Cybersecurity Essentials', 3, '2023-02-10', '2023-05-10', 'Understand the basics of cybersecurity and how to protect systems.'),
('AI Fundamentals', 4, '2023-03-01', '2023-06-01', 'Explore neural networks, machine learning, and AI algorithms.'),
('Mobile App Dev', 5, '2023-03-15', '2023-06-15', 'Develop apps using Kotlin and Flutter.');

-- Populate Assignment table
INSERT INTO Assignment (Course_ID, Due_Date, Assign_Description)
VALUES
(1, '2023-04-01', 'Create a binary search algorithm.'),
(2, '2023-05-01', 'Design a responsive website using CSS Grid.'),
(3, '2023-05-05', 'Analyze a case study on ransomware attacks.'),
(4, '2023-05-25', 'Develop a chatbot using NLP techniques.'),
(5, '2023-06-10', 'Build a mobile app for tracking expenses.');

-- Populate Submission table
INSERT INTO Submission (Assign_ID, Student_ID, Submission_date, Grade, Feedback)
VALUES
(1, 1, '2023-04-01', 95.00, 'Excellent work.'),
(1, 2, '2023-04-02', 89.00, 'Good effort.'),
(2, 3, '2023-05-01', 90.00, 'Well done.'),
(3, 4, '2023-05-06', 85.00, 'Nice analysis.'),
(4, 5, '2023-05-25', 92.00, 'Impressive chatbot.');

-- Populate Lesson table
INSERT INTO Lesson (Course_ID, Lesson_title, Lesson_Content)
VALUES
(1, 'Introduction to Arrays', 'Understanding array structures and applications.'),
(1, 'Linked Lists', 'Introduction to linked lists and operations.'),
(2, 'HTML Basics', 'Learn the structure of an HTML document.'),
(2, 'CSS Grid', 'Create responsive layouts with CSS Grid.'),
(3, 'Network Security', 'Protecting networks against cyber attacks.');

-- Populate Enrollment table
INSERT INTO Enrollment (Course_ID, Student_ID, Enrollment_date)
VALUES
(1, 1, '2023-01-15'),
(2, 2, '2023-02-01'),
(3, 3, '2023-02-10'),
(4, 4, '2023-03-01'),
(5, 5, '2023-03-15');
