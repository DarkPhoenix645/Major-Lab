SELECT DISTINCT s.first_name, s.last_name FROM students s 
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.department = "Computer Sci";

SELECT first_name, last_name, gpa
FROM students 
WHERE department = 'Computer Sci'
AND gpa = (
	SELECT MAX(gpa)
	FROM students
    WHERE department = 'Computer Sci'
);

SELECT DISTINCT s.first_name, s.last_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name, e.semester
HAVING COUNT(e.course_id) > 3;

SELECT s.first_name, s.last_name, COUNT(e.course_id) AS number_of_courses, SUM(c.credits) AS total_credits
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
GROUP BY s.student_id, s.first_name, s.last_name
ORDER BY total_credits DESC;

SELECT AVG(s.gpa) AS average_gpa
FROM students s
WHERE s.student_id IN (
    SELECT e.student_id
    FROM enrollments e
    JOIN courses c ON e.course_id = c.course_id
    WHERE c.department = "Computer Sci" AND c.department = "Electrical"
    GROUP BY e.student_id
    HAVING COUNT(DISTINCT c.department) = 2
);