USE class2;

-- Step 1: Create the student table with a computed column
DROP TABLE IF EXISTS student;
CREATE TABLE student
(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    classes INT,
    tuition_per_class DECIMAL(10, 2),
    total_tuition AS (classes * tuition_per_class)  -- Computed column
);

-- Step 2: Insert sample data
INSERT INTO student (student_id, student_name, classes, tuition_per_class)
VALUES 
(1, 'Alice', 5, 200.00),
(2, 'Bob', 3, 150.00),
(3, 'Charlie', 4, 180.00);

-- Step 3: Retrieve all data to check if the computed column works correctly
SELECT * FROM student;
