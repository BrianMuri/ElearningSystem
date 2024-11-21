<?php
include 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'] ?? null;
    $username = $_POST['username'] ?? null;
    $email = $_POST['email'] ?? null;
    $password = $_POST['password'] ?? null;
    $firstname = $_POST['firstname'] ?? null;
    $lastname = $_POST['lastname'] ?? null;
    $role = $_POST['role'] ?? null;
    $action = $_POST['action'] ?? null;

    if ($action === 'add') {
        // Add new user
        $sql = "INSERT INTO users (Username, Email, Password, F_name, L_name, Role) 
                VALUES ('$username', '$email', '$password', '$firstname', '$lastname', '$role')";
        if ($conn->query($sql) === TRUE) {
            echo "New user added successfully!";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    } elseif ($action === 'update') {
        // Update existing user
        if ($id) {
            $sql = "UPDATE users 
                    SET Username='$username', Email='$email', Password='$password', 
                        F_name='$firstname', L_name='$lastname', Role='$role'
                    WHERE USER_ID='$id'";
            if ($conn->query($sql) === TRUE) {
                echo "User updated successfully!";
            } else {
                echo "Error updating user: " . $conn->error;
            }
        } else {
            echo "ID is required for updating a user.";
        }
    } elseif ($action === 'delete') {
        // Delete user
        if ($id) {
            $sql = "DELETE FROM users WHERE USER_ID='$id'";
            if ($conn->query($sql) === TRUE) {
                echo "User deleted successfully!";
            } else {
                echo "Error deleting user: " . $conn->error;
            }
        } else {
            echo "ID is required for deleting a user.";
        }
    } else {
        echo "Invalid action.";
    }

    $conn->close();
}
?>
