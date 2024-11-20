-- Create the reqd table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    position VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- For checking the state of the table
SELECT * FROM employees;
TRUNCATE employees;

-- PROBLEM 1
START TRANSACTION;
INSERT INTO employees (employee_id, name, position, salary)
VALUES (101, 'Alice', 'Analyst', 60000);
COMMIT;
-- If transaction fails:
ROLLBACK;

-- PROBLEM 2
START TRANSACTION;
INSERT INTO employees (employee_id, name, position, salary)
VALUES (102, 'Bob', 'Developer', 70000);

SAVEPOINT first_insert;

INSERT INTO employees (employee_id, name, position, salary)
VALUES (103, 'Charlie', 'Designer', 65000);

ROLLBACK TO first_insert;
COMMIT;

-- PROBLEM 3
START TRANSACTION;
-- Lock the row for employee_id = 101
SELECT * FROM employees WHERE employee_id = 101 FOR UPDATE;

UPDATE employees
SET position = 'Senior Analyst'
WHERE employee_id = 101;

COMMIT;

-- PROBLEM 4
START TRANSACTION;
LOCK TABLE employees WRITE;

INSERT INTO employees (employee_id, name, position, salary)
VALUES (104, 'David', 'HR', 55000);

UNLOCK TABLES;
COMMIT;

-- PROBLEM 5
SET autocommit = 0;

START TRANSACTION;
INSERT INTO employees (employee_id, name, position, salary)
VALUES (105, 'Emma', 'Marketing', 58000);

ROLLBACK;