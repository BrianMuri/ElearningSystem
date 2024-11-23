# Database Schema for E-Learning System

## **Overview**
This schema defines the database structure for an e-learning system. It includes tables, relationships, and constraints necessary for managing courses, users, assignments, lessons, and student progress.

---

## **Tables**

### 1. **Users**
Stores general user information, including both students and instructors.

| **Column**    | **Data Type**         | **Constraints**                        |
|---------------|-----------------------|----------------------------------------|
| User_ID       | INT                  | Primary Key, Auto-Increment            |
| Username      | VARCHAR(50)          | Unique, Not Null                       |
| Email         | VARCHAR(100)         | Unique, Not Null                       |
| Password      | VARCHAR(100)         | Not Null                               |
| F_name        | VARCHAR(50)          | Not Null                               |
| L_name        | VARCHAR(50)          | Not Null                               |
| Role          | ENUM('Student', 'Instructor') | Not Null                        |

---

### 2. **Student_Credentials**
Stores information specific to students.

| **Column**    | **Data Type** | **Constraints**                        |
|---------------|---------------|----------------------------------------|
| Student_ID    | INT           | Primary Key, Auto-Increment            |
| User_ID       | INT           | Foreign Key (References `Users.User_ID`), Not Null |
| Enrollment_date | DATE        |                                        |

---

### 3. **Instructor_Credentials**
Stores information specific to instructors.

| **Column**    | **Data Type** | **Constraints**                        |
|---------------|---------------|----------------------------------------|
| Instructor_ID | INT           | Primary Key, Auto-Increment            |
| User_ID       | INT           | Foreign Key (References `Users.User_ID`), Not Null |
| Expertise     | VARCHAR(100)  |                                        |

---

### 4. **Course**
Stores information about courses.

| **Column**         | **Data Type** | **Constraints**                        |
|--------------------|---------------|----------------------------------------|
| Course_ID          | INT           | Primary Key, Auto-Increment            |
| Course_Name        | VARCHAR(100)  | Not Null                               |
| Instructor_ID      | INT           | Foreign Key (References `Instructor_Credentials.Instructor_ID`), Not Null |
| Start_date         | DATE          | Not Null                               |
| End_date           | DATE          | Not Null                               |
| Course_Description | TEXT          |                                        |

---

### 5. **Assignment**
Stores assignment details for courses.

| **Column**          | **Data Type** | **Constraints**                        |
|---------------------|---------------|----------------------------------------|
| Assign_ID           | INT           | Primary Key, Auto-Increment            |
| Course_ID           | INT           | Foreign Key (References `Course.Course_ID`), Not Null |
| Due_Date            | DATE          | Not Null                               |
| Assign_Description  | TEXT          |                                        |

---

### 6. **Submission**
Stores information about student submissions for assignments.

| **Column**          | **Data Type** | **Constraints**                        |
|---------------------|---------------|----------------------------------------|
| Sub_ID              | INT           | Primary Key, Auto-Increment            |
| Assign_ID           | INT           | Foreign Key (References `Assignment.Assign_ID`), Not Null |
| Student_ID          | INT           | Foreign Key (References `Student_Credentials.Student_ID`), Not Null |
| Submission_date     | DATE          |                                        |
| Grade               | DECIMAL(3, 2) |                                        |
| Feedback            | TEXT          |                                        |

---

### 7. **Lesson**
Stores lesson details linked to courses.

| **Column**          | **Data Type** | **Constraints**                        |
|---------------------|---------------|----------------------------------------|
| Lesson_ID           | INT           | Primary Key, Auto-Increment            |
| Course_ID           | INT           | Foreign Key (References `Course.Course_ID`), Not Null |
| Lesson_Title        | VARCHAR(100)  | Not Null                               |
| Lesson_Content      | TEXT          |                                        |

---

### 8. **Enrollment**
Tracks student enrollment in courses.

| **Column**          | **Data Type** | **Constraints**                        |
|---------------------|---------------|----------------------------------------|
| Enroll_ID           | INT           | Primary Key, Auto-Increment            |
| Course_ID           | INT           | Foreign Key (References `Course.Course_ID`), Not Null |
| Student_ID          | INT           | Foreign Key (References `Student_Credentials.Student_ID`), Not Null |
| Enrollment_date     | DATE          |                                        |

---

## **Relationships**
1. **Users**:
   - A `User` can either be a `Student` or an `Instructor`.
   - Links to `Student_Credentials` and `Instructor_Credentials`.

2. **Courses**:
   - Each `Course` is taught by one `Instructor`.
   - Each `Course` can have multiple `Assignments`, `Lessons`, and `Enrollments`.

3. **Assignments**:
   - Each `Assignment` belongs to a single `Course`.
   - Students can submit multiple `Submissions` for different `Assignments`.

4. **Enrollments**:
   - Tracks which `Students` are enrolled in which `Courses`.

---

## **Schema Diagram**
Include a link or an image of your ER diagram here.  
For example:
```markdown
![ER Diagram](ElearningSystem/documentation/CMT302Correction.png)
```

---

## **Constraints and Business Logic**
1. **Triggers**:
   - Prevent duplicate enrollments (`before_enrollment_insert`).
   - Ensure valid assignment due dates (`prevent_past_due_date`).

2. **Stored Procedures**:
   - Simplify adding users, courses, assignments, submissions, and lessons.
   - Automate population of related tables based on user roles.

3. **Views**:
   - `ActiveCourses`: Lists courses currently in session.
   - `StudentPerformance`: Summarizes student grades and progress.

---
