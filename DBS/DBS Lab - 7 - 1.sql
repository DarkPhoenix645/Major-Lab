CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    gpa DECIMAL(3,2) CHECK (gpa >= 0 AND gpa <= 4)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    department VARCHAR(50),
    credits INT CHECK (credits > 0)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(20),
    grade DECIMAL(3,2) CHECK (grade >= 0 AND grade <= 4),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

INSERT INTO Students (student_id, first_name, last_name, age, department, gpa) VALUES
(1, 'Alice', 'Smith', 20, 'Computer Sci', 3.90),
(2, 'Bob', 'Johnson', 21, 'Mechanical', 3.50),
(3, 'Charlie', 'Brown', 22, 'Computer Sci', 3.80),
(4, 'Diana', 'Jones', 23, 'Electrical', 3.60),
(5, 'Eve', 'Davis', 21, 'Mechanical', 3.20),
(6, 'Frank', 'Wilson', 24, 'Electrical', 3.40),
(7, 'Grace', 'Thomas', 20, 'Computer Sci', 3.70),
(8, 'Henry', 'Walker', 22, 'Mechanical', 3.20),
(9, 'Ivy', 'Clark', 21, 'Computer Sci', 3.90),
(10, 'Jack', 'Lewis', 23, 'Mechanical', 3.30),
(11, 'Karen', 'Young', 24, 'Electrical', 3.60),
(12, 'Liam', 'Hall', 22, 'Computer Sci', 3.50),
(13, 'Mia', 'Allen', 21, 'Electrical', 3.80);

INSERT INTO Courses (course_id, course_name, department, credits) VALUES
(101, 'Database Systems', 'Computer Sci', 4),
(102, 'Thermodynamics', 'Mechanical', 3),
(103, 'Circuit Theory', 'Electrical', 4),
(104, 'Machine Learning', 'Computer Sci', 4),
(105, 'Fluid Mechanics', 'Mechanical', 3),
(106, 'Robotics', 'Mechanical', 4),
(107, 'Data Structures', 'Computer Sci', 3),
(108, 'Microprocessors', 'Electrical', 4),
(109, 'Artificial Intelligence', 'Computer Sci', 4),
(110, 'Heat Transfer', 'Mechanical', 3);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, semester, grade) VALUES
(1, 1, 101, 'Fall 2023', 3.80),
(2, 2, 102, 'Spring 2023', 3.30),
(3, 3, 101, 'Spring 2023', 3.70),
(4, 4, 103, 'Fall 2023', 3.60),
(5, 5, 104, 'Fall 2023', 3.20),
(6, 6, 103, 'Spring 2023', 3.50),
(7, 7, 107, 'Fall 2023', 3.80),
(8, 8, 102, 'Fall 2023', 3.10),
(9, 9, 109, 'Spring 2023', 4.00),
(10, 10, 106, 'Fall 2023', 3.40),
(11, 11, 108, 'Fall 2023', 3.70),
(12, 12, 107, 'Fall 2023', 3.40),
(13, 13, 108, 'Fall 2023', 3.90);

