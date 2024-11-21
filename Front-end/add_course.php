<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Courses</title>
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
            padding: 15px; 
            border-radius: 8px; 
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); 
            max-width: 350px; 
            width: 100%; 
        }
        h2 { 
            margin-bottom: 10px; 
            font-size: 18px; 
            color: #333; 
        }
        label { 
            display: block; 
            margin-bottom: 5px; 
            font-size: 14px; 
            color: #555; 
        }
        input, textarea, button, select { 
            width: 100%; 
            padding: 8px; 
            margin-bottom: 8px; 
            border: 1px solid #ddd; 
            border-radius: 4px; 
            font-size: 14px; 
        }
        button { 
            background-color: #4CAF50; 
            color: #fff; 
            border: none; 
            cursor: pointer; 
            font-size: 14px; 
        }
        button:hover { 
            background-color: #45a049; 
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Manage Courses</h2>
        <form action="insert_course.php" method="POST">
            <!-- Course ID for Update/Delete -->
            <label for="course_id">Course ID (For Update/Delete):</label>
            <input type="number" id="course_id" name="course_id" placeholder="Enter Course ID">

            <!-- Form Fields for Adding/Updating -->
            <label for="course_name">Course Name:</label>
            <input type="text" id="course_name" name="course_name">

            <label for="instructor_id">Instructor ID:</label>
            <input type="number" id="instructor_id" name="instructor_id">

            <label for="start_date">Start Date:</label>
            <input type="date" id="start_date" name="start_date">

            <label for="end_date">End Date:</label>
            <input type="date" id="end_date" name="end_date">

            <label for="course_description">Course Description:</label>
            <textarea id="course_description" name="course_description" rows="3"></textarea>

            <!-- Action Buttons -->
            <button type="submit" name="action" value="add">Add Course</button>
            <button type="submit" name="action" value="update">Update Course</button>
            <button type="submit" name="action" value="delete">Delete Course</button>
        </form>
    </div>
</body>
</html>
