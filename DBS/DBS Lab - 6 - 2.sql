SELECT course_name FROM 
enrollments INNER JOIN courses ON courses.course_id
GROUP BY course_name HAVING COUNT(DISTINCT enrollments.student_id) > 2 
ORDER BY course_name;

SELECT students.student_id, students.first_name, students.last_name, students.gpa FROM 
(students JOIN enrollments ON students.student_id) JOIN courses ON courses.course_id
WHERE students.department = "Computer Sci"
ORDER BY students.gpa DESC, students.last_name;

SELECT students.first_name, students.last_name, students.gpa FROM students
ORDER BY students.gpa DESC, students.last_name
LIMIT 3;

SELECT DISTINCT department FROM
students ORDER BY department;

SELECT courses.course_name, COUNT(enrollments.student_id) AS total_students FROM
courses JOIN enrollments ON courses.course_id
GROUP BY courses.course_name ORDER BY total_students DESC, courses.course_name;

SELECT student_id, first_name, last_name, age FROM
students ORDER BY age DESC, last_name
LIMIT 5; 