<?php
// db_connect.php
$servername = "localhost";  // The server where your database is hosted (in this case, localhost).
$username = "root";         // The username used to connect to the database.
$password = "RangeR7.";      // The password for the MySQL user.
$dbname = "ELEARNINGSYSTEM1"; // The name of the database to connect to.

$conn = new mysqli($servername, $username, $password, $dbname);  // Creates a new connection to the database.

// Check connection
if ($conn->connect_error) {  // If the connection fails, display an error message.
    die("Connection failed: " . $conn->connect_error);  // Stops further execution and displays the error message.
}
?>
