<?php
include 'db_connect.php'; // Include the database connection script

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Get the action from the form
    $action = $_POST['action'];

    // Common variables
    $course_id = $_POST['course_id'];
    $course_name = $_POST['course_name'];
    $instructor_id = $_POST['instructor_id'];
    $start_date = $_POST['start_date'];
    $end_date = $_POST['end_date'];
    $course_description = $_POST['course_description'];

    // Add Course
    if ($action == 'add') {
        $sql = "INSERT INTO course (Course_Name, Instructor_ID, Start_date, End_date, Course_Description) 
                VALUES ('$course_name', '$instructor_id', '$start_date', '$end_date', '$course_description')";

        if ($conn->query($sql) === TRUE) {
            echo "New course added successfully!";
        } else {
            echo "Error adding course: " . $conn->error;
        }
    }

    // Update Course
    elseif ($action == 'update') {
        if (empty($course_id)) {
            echo "Course ID is required for updating a course.";
        } else {
            $sql = "UPDATE course SET 
                    Course_Name = '$course_name', 
                    Instructor_ID = '$instructor_id', 
                    Start_date = '$start_date', 
                    End_date = '$end_date', 
                    Course_Description = '$course_description' 
                    WHERE Course_ID = $course_id";

            if ($conn->query($sql) === TRUE) {
                echo "Course updated successfully!";
            } else {
                echo "Error updating course: " . $conn->error;
            }
        }
    }

    // Delete Course
    elseif ($action == 'delete') {
        if (empty($course_id)) {
            echo "Course ID is required for deleting a course.";
        } else {
            $sql = "DELETE FROM course WHERE Course_ID = $course_id";

            if ($conn->query($sql) === TRUE) {
                echo "Course deleted successfully!";
            } else {
                echo "Error deleting course: " . $conn->error;
            }
        }
    }

    // Close the database connection
    $conn->close();
}
?>
