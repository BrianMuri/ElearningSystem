<?php
include 'db_connect.php'; // Include the database connection script

// Check if the form was submitted using POST method
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    // Collect the form input values
    $id = $_POST['id'];
    $course_id = $_POST['course_id'];
    $lesson_title = $_POST['lesson_title'];
    $lesson_content = $_POST['lesson_content'];
    $action = $_POST['action'];

    // Add Lesson
    if ($action == 'add') {
        $sql = "INSERT INTO lesson (Course_ID, Lesson_title, Lesson_Content) 
                VALUES (?, ?, ?)";
        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("iss", $course_id, $lesson_title, $lesson_content);
            if ($stmt->execute()) {
                echo "New lesson added successfully!";
            } else {
                echo "Error: " . $stmt->error;
            }
            $stmt->close();
        }
    }
    // Update Lesson
    elseif ($action == 'update') {
        $sql = "UPDATE lesson 
                SET Course_ID = ?, Lesson_title = ?, Lesson_Content = ? 
                WHERE Lesson_ID = ?";
        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("issi", $course_id, $lesson_title, $lesson_content, $id);
            if ($stmt->execute()) {
                echo "Lesson updated successfully!";
            } else {
                echo "Error: " . $stmt->error;
            }
            $stmt->close();
        }
    }
    // Delete Lesson
    elseif ($action == 'delete') {
        $sql = "DELETE FROM lesson WHERE Lesson_ID = ?";
        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("i", $id);
            if ($stmt->execute()) {
                echo "Lesson deleted successfully!";
            } else {
                echo "Error: " . $stmt->error;
            }
            $stmt->close();
        }
    }

    // Close the connection
    $conn->close();
}
?>
