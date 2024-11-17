# Testing & Validation for E-Learning System Database Schema
## 1. **Test Plan Overview**

The testing process will focus on validating the integrity, correctness, and efficiency of the database schema. The tests will cover the following areas:

- **Functional Testing**: Ensuring that all tables, relationships, and constraints work as intended.
- **Data Integrity**: Verifying that foreign key constraints, unique constraints, and other integrity rules are respected.
- **Performance**: Ensuring the database performs well under various load conditions.
- **Edge Case Testing**: Testing the schema with edge cases, such as null values or extreme data inputs.
- **Security Testing**: Ensuring that the schema enforces security rules and protects sensitive data.

## 2. **Testing Scope**

### 2.1 **Core Database Functions**

- **User Creation and Role Assignment**:
  - Ensure that users can be created with valid roles (Student, Instructor).
  - Test that the system prevents duplicate usernames and emails (unique constraints).

- **Student and Instructor Information**:
  - Test that `Student_Credentials` and `Instructor_Credentials` correctly reference the `Users` table.
  - Ensure that students and instructors are correctly linked to their respective credentials tables.

- **Course Management**:
  - Verify that each `Course` is correctly linked to an `Instructor`.
  - Ensure courses are correctly created with valid `start_date` and `end_date`.

- **Assignment and Submission**:
  - Ensure assignments are linked to their respective courses and that due dates are properly enforced.
  - Verify that submissions are linked to both assignments and students, and that grades and feedback are correctly stored.

- **Lesson Management**:
  - Ensure each `Lesson` is correctly linked to a course and that lesson content is properly stored.

- **Enrollment**:
  - Ensure that students can be enrolled in multiple courses and that enrollment records are properly linked to both students and courses.

### 2.2 **Constraints and Validation**

- **Foreign Key Constraints**:
  - Test that all foreign key relationships (e.g., between `Course` and `Instructor`, `Submission` and `Assignment`) are respected.
  - Verify that orphaned records (e.g., assignments without courses) cannot be created.

- **Unique Constraints**:
  - Ensure that the `Users.Username` and `Users.Email` fields are unique across the system.
  
- **Trigger and Stored Procedure Testing**:
  - Test triggers for preventing duplicate enrollments and invalid assignment due dates.
  - Verify stored procedures for adding users, courses, assignments, and submissions work as intended.

## 3. **Test Cases**

### 3.1 **User Creation**

| Test Case ID | Test Case Description                    | Expected Outcome                         | Status  |
|--------------|------------------------------------------|------------------------------------------|---------|
| TC_01        | Create a new student user                | User is created with role 'Student'      | Pass    |
| TC_02        | Create a new instructor user             | User is created with role 'Instructor'   | Pass    |
| TC_03        | Create user with duplicate username      | Error: "Username already exists"         | Pass    |
| TC_04        | Create user with duplicate email         | Error: "Email already exists"            | Pass    |

### 3.2 **Course Management**

| Test Case ID | Test Case Description                    | Expected Outcome                         | Status  |
|--------------|------------------------------------------|------------------------------------------|---------|
| TC_05        | Create a new course with valid dates     | Course is created and linked to an instructor | Pass    |
| TC_06        | Create a course with an invalid date range | Error: "End date must be after start date" | Pass    |
| TC_07        | Create a course without an instructor    | Error: "Instructor is required"          | Pass    |

### 3.3 **Assignment and Submission**

| Test Case ID | Test Case Description                    | Expected Outcome                         | Status  |
|--------------|------------------------------------------|------------------------------------------|---------|
| TC_08        | Create an assignment linked to a course  | Assignment is created with a valid due date | Pass    |
| TC_09        | Submit an assignment with valid student data | Submission is recorded with grade and feedback | Pass    |
| TC_10        | Submit an assignment after due date     | Submission is recorded but flagged as late | Pass    |
| TC_11        | Grade an assignment                      | Grade is stored in the `Submission` table | Pass    |

### 3.4 **Enrollment**

| Test Case ID | Test Case Description                    | Expected Outcome                         | Status  |
|--------------|------------------------------------------|------------------------------------------|---------|
| TC_12        | Enroll a student in a course             | Enrollment is recorded in the `Enrollment` table | Pass    |
| TC_13        | Prevent duplicate enrollment for the same course | Error: "Student is already enrolled"    | Pass    |

### 3.5 **Edge Case Testing**

| Test Case ID | Test Case Description                    | Expected Outcome                         | Status  |
|--------------|------------------------------------------|------------------------------------------|---------|
| TC_14        | Add a student with null name fields      | Error: "Name fields cannot be null"      | Pass    |
| TC_15        | Add an assignment with a past due date   | Error: "Assignment due date must be in the future" | Pass    |

## 4. **Validation Process**

Validation will focus on ensuring the schema matches the requirements and specifications:

- **Schema Integrity Validation**: Validate that all foreign keys, unique constraints, and other constraints are functioning correctly.
- **Data Consistency Checks**: Ensure data is correctly populated across related tables (e.g., a course should not exist without an instructor).
- **Data Retrieval Validation**: Test that all queries (such as retrieving courses for a student) return the correct results.

## 5. **Performance Testing**

- **Load Testing**: Test the schema with multiple users creating and enrolling in courses simultaneously.
- **Query Performance**: Verify that queries retrieving course information or student performance remain efficient as the number of records grows.

## 6. **Test Conclusion**

The test results will be documented, and any failed test cases will be reviewed. Adjustments will be made to the schema, constraints, or triggers to fix any issues found during the validation process. Further testing will be conducted after any necessary changes to ensure continued stability and accuracy of the schema.
