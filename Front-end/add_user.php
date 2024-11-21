<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
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
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 250px;
            width: 100%;
        }
        h2 {
            margin-bottom: 8px;
            color: #333;
            text-align: center;
            font-size: 16px;
        }
        label {
            display: block;
            margin-bottom: 2px;
            color: #555;
            font-size: 12px;
        }
        input, select, button {
            width: 100%;
            padding: 6px;
            margin-bottom: 6px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 12px;
        }
        input:focus, select:focus {
            border-color: #4CAF50;
            outline: none;
        }
        button {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
            padding: 8px;
            font-size: 12px;
        }
        button:hover {
            background-color: #45a049;
        }
        button[type="submit"]:not(:last-child) {
            margin-bottom: 4px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Manage Users</h2>
        <form action="insert_user.php" method="POST">
            <label for="id">User ID:</label>
            <input type="text" id="id" name="id" placeholder="For Update/Delete">

            <label for="username">User Name:</label>
            <input type="text" id="username" name="username" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="firstname">First Name:</label>
            <input type="text" id="firstname" name="firstname" required>

            <label for="lastname">Last Name:</label>
            <input type="text" id="lastname" name="lastname" required>

            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="student">Student</option>
                <option value="instructor">Instructor</option>
            </select>

            <!-- Action buttons -->
            <button type="submit" name="action" value="add">Add User</button>
            <button type="submit" name="action" value="update">Update User</button>
            <button type="submit" name="action" value="delete">Delete User</button>
        </form>
    </div>
</body>
</html>
