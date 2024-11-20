SELECT department, COUNT(course_id) AS number_of_courses FROM courses
GROUP BY department
HAVING number_of_courses > 2
ORDER BY number_of_courses DESC;

SELECT * FROM students
WHERE department="Mechanical" 
ORDER BY gpa ASC, last_name
LIMIT 3;

SELECT student_id, first_name, last_name, age, gpa, IF(gpa >= 3.7, "High GPA", "Average GPA") AS gpa_range FROM students;

SELECT student_id, first_name, last_name, gpa, age,
CASE
	WHEN age < 21 THEN "Under 21"
	WHEN age > 21 AND age < 23 THEN "21 - 23"
    ELSE "Above 23"
END AS gpa_range FROM students;

SELECT CONCAT(first_name, " ", last_name, 
CASE
	WHEN gpa = 4.0 THEN " (Top Student)"
    ELSE ""
END) AS full_name, department
FROM students
ORDER BY full_name;

SELECT department, AVG(gpa) AS dept_avg, (SELECT AVG(gpa) FROM students) AS overall_avg 
FROM students GROUP BY department
HAVING dept_avg > overall_avg 
ORDER BY dept_avg DESC;