<?php
include 'db_connect.php'; // Include the database connection script

// Check if the form was submitted using POST method
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    // Collect the form input values
    $id = $_POST['id'];
    $user_id = $_POST['user_id'];
    $enrollment_date = $_POST['enrollment_date'];
    $action = $_POST['action'];

    // Add Student
    if ($action == 'add') {
        $sql = "INSERT INTO student_credentials (User_ID, Enrollment_Date) 
                VALUES (?, ?)";
        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("is", $user_id, $enrollment_date);
            if ($stmt->execute()) {
                echo "New student added successfully!";
            } else {
                echo "Error: " . $stmt->error;
            }
            $stmt->close();
        }
    }
    // Update Student
    elseif ($action == 'update') {
        $sql = "UPDATE student_credentials 
                SET User_ID = ?, Enrollment_Date = ? 
                WHERE Student_ID = ?";
        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("isi", $user_id, $enrollment_date, $id);
            if ($stmt->execute()) {
                echo "Student updated successfully!";
            } else {
                echo "Error: " . $stmt->error;
            }
            $stmt->close();
        }
    }
    // Delete Student
    elseif ($action == 'delete') {
        $sql = "DELETE FROM student_credentials WHERE Student_ID = ?";
        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("i", $id);
            if ($stmt->execute()) {
                echo "Student deleted successfully!";
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
