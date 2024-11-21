-- Populate Users table
INSERT INTO Users (Username, Email, Password, F_name, L_name, Role)
VALUES('jmutai', 'john.mutai@gmail.com', 'password123', 'John', 'Mutai', 'Student'),
('mwaweru', 'mary.waweru@gmail.com', 'password123', 'Mary', 'Waweru', 'Student'),
('okothke', 'kevin.okoth@gmail.com', 'password123', 'Kevin', 'Okoth', 'Student'),
('nmwangi', 'nancy.mwangi@gmail.com', 'password123', 'Nancy', 'Mwangi', 'Student'),
('dchebet', 'diana.chebet@gmail.com', 'password123', 'Diana', 'Chebet', 'Student'),
('oscaromb', 'oscar.omboga@gmail.com', 'password123', 'Oscar', 'Omboga', 'Instructor'),
('kenmbugua', 'ken.mbugua@gmail.com', 'password123', 'Ken', 'Mbugua', 'Instructor'),
('susanm', 'susan.maina@gmail.com', 'password123', 'Susan', 'Maina', 'Instructor'),
('nicholask', 'nicholas.kariuki@gmail.com', 'password123', 'Nicholas', 'Kariuki', 'Instructor'),
('janelimo', 'jane.limo@gmail.com', 'password123', 'Jane', 'Limo', 'Instructor'),
('johnsmith', 'john.smith@gmail.com', 'password123', 'John', 'Smith', 'Instructor'),
('annemwangi', 'anne.mwangi@gmail.com', 'password123', 'Anne', 'Mwangi', 'Instructor');


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
(6, 'Data Structures and Algorithms'),
(7, 'Web Development'),
(8, 'Cybersecurity'),
(9, 'Artificial Intelligence'),
(10, 'Mobile Application Development'),
(11, 'Web Development'),
(12, 'Cybersecurity');

-- Populate Course table
INSERT INTO Course (Course_Name, Instructor_ID, Start_date, End_date, Course_Description)
VALUES
('Data Structures', 1, '2023-01-15', '2023-04-15', 'An introduction to data structures like arrays, linked lists, and trees.'),
('Web Development', 2, '2023-02-01', '2023-05-01', 'Learn HTML, CSS, and JavaScript for modern web design.'),
('Cybersecurity Essentials', 3, '2023-02-10', '2023-05-10', 'Understand the basics of cybersecurity and how to protect systems.'),
('AI Fundamentals', 4, '2023-03-01', '2023-06-01', 'Explore neural networks, machine learning, and AI algorithms.'),
('Mobile App Dev', 5, '2023-03-15', '2023-06-15', 'Develop apps using Kotlin and Flutter.'),
('Cloud Computing', 6, '2024-04-01', '2024-07-01', 'Learn the principles of cloud computing and deployment strategies.'),
('Web Development Advanced', 6, '2023-04-01', '2023-07-01', 'Advanced concepts in HTML, CSS, and JavaScript.'),
('Cybersecurity Advanced', 1, '2023-05-01', '2023-08-01', 'Advanced techniques in network and system security.'),
('Full Stack Web Development', 7, '2023-03-01', '2023-06-01', 'Comprehensive web development including frontend and backend development.');


-- Populate Assignment table
INSERT INTO Assignment (Course_ID, Due_Date, Assign_Description)
VALUES
(1, '2023-04-01', 'Create a binary search algorithm.'),
(2, '2023-05-01', 'Design a responsive website using CSS Grid.'),
(3, '2023-05-05', 'Analyze a case study on ransomware attacks.'),
(4, '2023-05-25', 'Develop a chatbot using NLP techniques.'),
(5, '2023-06-10', 'Build a mobile app for tracking expenses.'),
(6, '2024-06-30', 'Deploy a web application using cloud services.'),
(7, '2023-06-15', 'Implement a simple ecommerce application.'),
(8, '2023-06-25', 'Design a network security system.'),
(9, '2023-07-10', 'Implement an AI agent for games.');

-- Populate Submission table
INSERT INTO Submission (Assign_ID, Student_ID, Submission_date, Grade, Feedback)
VALUES
(1, 1, '2024-04-01', 95.00, 'Excellent work.'),
(1, 2, '2024-04-02', 69.00, 'Good effort.'),
(2, 3, '2024-05-01', 90.00, 'Well done.'),
(3, 4, '2024-05-06', 75.00, 'Nice analysis.'),
(4, 5, '2024-05-25', 92.00, 'Impressive chatbot.'),
(5, 1, '2024-06-10', 63.00, 'App works as expected.'),
(6, 2, '2024-06-25', 88.00, 'Cloud deployment completed.'),
(6, 1, '2023-06-15', 58.00, 'On time, but needs improvement.'),
(7, 2, '2023-06-20', 93.00, 'Good work.'),
(8, 3, '2023-07-15', 65.00, 'Needs more work on the backend.'),
(9, 4, '2023-07-18', 40.00, 'Late submission.'),
(3, 5, '2023-07-05', 77.00, 'Completed on time.');


-- Populate Lesson table
INSERT INTO Lesson (Course_ID, Lesson_title, Lesson_Content)
VALUES
(1, 'Introduction to Arrays', 'Understanding array structures and applications.'),
(1, 'Linked Lists', 'Introduction to linked lists and operations.'),
(2, 'HTML Basics', 'Learn the structure of an HTML document.'),
(2, 'CSS Grid', 'Create responsive layouts with CSS Grid.'),
(3, 'Network Security', 'Protecting networks against cyber attacks.'),
(4, 'Neural Networks', 'Understanding neural networks and their applications.'),
(5, 'Kotlin for Android', 'Introduction to mobile app development using Kotlin.'),
(6, 'Cloud Fundamentals', 'Understanding cloud architectures and providers.'),
(7, 'Frontend Basics', 'Learn the basics of HTML, CSS, and JavaScript for full-stack web development.'),
(7, 'Backend Development', 'Learn the backend aspects of full-stack development with Node.js and databases.');

-- Populate Enrollment table
INSERT INTO Enrollment (Course_ID, Student_ID, Enrollment_date)
VALUES
(1, 1, '2024-01-15'),
(2, 2, '2024-02-01'),
(3, 3, '2024-02-10'),
(4, 4, '2024-03-01'),
(5, 5, '2024-03-15'),
(6, 2, '2024-01-20'),
(7, 1, '2024-02-20'),
(8, 4, '2024-03-10'),
(9, 1, '2023-02-01'), 
(7, 2, '2023-01-15');
