-- Create the database
CREATE DATABASE ELearningSystem;
USE ELearningSystem;

-- Table: Users
CREATE TABLE Users (
    User_ID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL,
    F_name VARCHAR(50) NOT NULL,
    L_name VARCHAR(50) NOT NULL,
    Role ENUM('Student', 'Instructor') NOT NULL
);

-- Table: Student_Credentials (inherits from Users)
CREATE TABLE Student_Credentials (
    Student_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT NOT NULL,
    Enrollment_date DATE,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE
);

-- Table: Instructor_Credentials (inherits from Users)
CREATE TABLE Instructor_Credentials (
    Instructor_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT NOT NULL,
    Expertise VARCHAR(100),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE
);

-- Table: Course
CREATE TABLE Course (
    Course_ID INT PRIMARY KEY AUTO_INCREMENT,
    Course_Name VARCHAR(100) NOT NULL,
    Instructor_ID INT NOT NULL,
    Start_date DATE NOT NULL,
    End_date DATE NOT NULL,
    Course_Description TEXT,
    FOREIGN KEY (Instructor_ID) REFERENCES Instructor_Credentials(Instructor_ID) ON DELETE CASCADE
);

-- Table: Assignment
CREATE TABLE Assignment (
    Assign_ID INT PRIMARY KEY AUTO_INCREMENT,
    Course_ID INT NOT NULL,
    Due_Date DATE NOT NULL,
    Assign_Description TEXT,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID) ON DELETE CASCADE
);

-- Table: Submission
CREATE TABLE Submission (
    Sub_ID INT PRIMARY KEY AUTO_INCREMENT,
    Assign_ID INT NOT NULL,
    Student_ID INT NOT NULL,
    Submission_date DATE,
    Grade DECIMAL(3, 2),
    Feedback TEXT,
    FOREIGN KEY (Assign_ID) REFERENCES Assignment(Assign_ID) ON DELETE CASCADE,
    FOREIGN KEY (Student_ID) REFERENCES Student_Credentials(Student_ID) ON DELETE CASCADE
);

-- Table: Lesson
CREATE TABLE Lesson (
    Lesson_ID INT PRIMARY KEY AUTO_INCREMENT,
    Course_ID INT NOT NULL,
    Lesson_title VARCHAR(100) NOT NULL,
    Lesson_Content TEXT,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID) ON DELETE CASCADE
);

-- Table: Enrollment
CREATE TABLE Enrollment (
    Enroll_ID INT PRIMARY KEY AUTO_INCREMENT,
    Course_ID INT NOT NULL,
    Student_ID INT NOT NULL,
    Enrollment_date DATE,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID) ON DELETE CASCADE,
    FOREIGN KEY (Student_ID) REFERENCES Student_Credentials(Student_ID) ON DELETE CASCADE
);