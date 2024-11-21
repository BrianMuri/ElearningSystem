<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Lesson</title>
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
        input, textarea, button, select {
            width: 100%;
            padding: 8px;
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
        <h2>Manage Lesson</h2>
        <form action="insert_lesson.php" method="POST">
            <label for="id">Lesson ID (For Update/Delete):</label>
            <input type="number" id="id" name="id" placeholder="Enter Lesson ID">

            <label for="course_id">Course ID:</label>
            <input type="number" id="course_id" name="course_id" required>

            <label for="lesson_title">Lesson Title:</label>
            <input type="text" id="lesson_title" name="lesson_title" required>

            <label for="lesson_content">Lesson Content:</label>
            <textarea id="lesson_content" name="lesson_content" rows="3"></textarea>

            <!-- Action buttons -->
            <button type="submit" name="action" value="add">Add Lesson</button>
            <button type="submit" name="action" value="update">Update Lesson</button>
            <button type="submit" name="action" value="delete">Delete Lesson</button>
        </form>
    </div>
</body>
</html>
