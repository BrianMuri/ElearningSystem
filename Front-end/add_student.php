<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 350px;
            width: 100%;
        }
        h2 {
            margin-bottom: 15px;
            color: #333;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        input, button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Manage Student</h2>
        <form action="insert_student.php" method="POST">
            <label for="id">Student ID (For Update/Delete):</label>
            <input type="number" id="id" name="id" placeholder="Enter Student ID">

            <label for="user_id">User ID:</label>
            <input type="number" id="user_id" name="user_id" required>

            <label for="enrollment_date">Enrollment Date:</label>
            <input type="date" id="enrollment_date" name="enrollment_date" required>

            <!-- Action buttons -->
            <button type="submit" name="action" value="add">Add Student</button>
            <button type="submit" name="action" value="update">Update Student</button>
            <button type="submit" name="action" value="delete">Delete Student</button>
        </form>
    </div>
</body>
</html>
