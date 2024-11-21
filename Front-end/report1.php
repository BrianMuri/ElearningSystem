<?php
include 'db_connect.php';

$sql = "SELECT * FROM USERS"; 
$result = $conn->query($sql);

echo "<h1>HTML Report</h1>";

if ($result->num_rows > 0) {
    echo "<table border='1'><tr><th>ID</th><th>Name</th><th>Email</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["USER_ID"] . "</td><td>" . $row["USERNAME"] . "</td><td>" . $row["EMAIL"] . "</td><td>" . $row["PASSWORD"] . "</td><td>" . $row["F_NAME"] . "</td><td>" . $row["L_NAME"] . "</td><td>" . $row["ROLE"] . "</td><td>" . "</td></tr>";
    }
    echo "</table>";
} else {
    echo "No records found.";
}

$conn->close();
?>
