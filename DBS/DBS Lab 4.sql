CREATE TABLE Departments (
	DepartmentID INTEGER PRIMARY KEY,
    DepartmentName VARCHAR(100),
    Location VARCHAR(50)
);

CREATE TABLE Projects (
	ProjectID INTEGER PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    StartDate DATE
);

ALTER TABLE Departments
ADD ManagerID INTEGER;

ALTER TABLE Departments
DROP COLUMN ManagerID;

DROP TABLE Projects;

CREATE TABLE Employees (
	EmployeeID INTEGER PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INTEGER,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);