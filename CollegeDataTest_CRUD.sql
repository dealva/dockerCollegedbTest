-- Create students table
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birthday DATE NOT NULL,
    address VARCHAR(255) NOT NULL
);
-- create table faculties table
CREATE TABLE faculties (
    id INT AUTO_INCREMENT PRIMARY KEY,
    faculty_name VARCHAR(255) NOT NULL
);
-- create table departments table
CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL,
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES faculties(id)
);
-- Create academic_info table
CREATE TABLE academic_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    department_id INT NOT NULL,
    year_of_entry YEAR NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(id) ,
    FOREIGN KEY (department_id) REFERENCES departments(id) 
);

-- the idea is we connect student to academic info which also connect to deparments table and also connect to faculties table

-- Insert data into faculties table
ALTER TABLE faculties AUTO_INCREMENT = 1; -- this just for reset to make sure auto_increment = 1
INSERT INTO faculties (faculty_name)
VALUES 
('Engineering'),  -- Faculty ID 1
('Arts'),         -- Faculty ID 2
('Science'),      -- Faculty ID 3
('Business');     -- Faculty ID 4
SELECT * FROM faculties; -- check data table of faculties

ALTER TABLE departments AUTO_INCREMENT = 1;
INSERT INTO departments (department_name, faculty_id)
VALUES 
('Computer Science', 1), -- ComSci is part of engineering since it id 1
('Mechanical Engineering', 1),
('Electrical Engineering', 1),
('Literature', 2),
('Interior Design', 2),
('Biology', 3),
('Physics',3),
('Management', 4),
('Economics', 4);
SELECT * FROM departments;

--  data dummy to students table
ALTER TABLE students AUTO_INCREMENT = 1;
INSERT INTO students (name, birthday, address)
VALUES 
('John Doe', '2000-05-15', '123 Main Street'),
('Alice Smith', '1999-03-22', '456 Oak Avenue'),
('Bob Johnson', '2001-07-10', '789 Pine Road'),
('Charlie Brown', '1998-11-30', '101 Maple Drive'),
('David Clark', '2000-02-14', '202 Birch Lane'),
('Emma White', '1997-06-25', '303 Cedar Street'),
('Sophia Lewis', '2001-01-01', '404 Elm Drive'),
('Michael Turner', '2000-08-20', '505 Walnut Street'),
('Olivia Harris', '1999-09-12', '606 Fir Street'),
('Ethan Lee', '2002-05-18', '707 Ash Avenue'),
('Isabella Walker', '1998-12-30', '808 Spruce Lane'),
('Liam Scott', '2001-04-10', '909 Redwood Boulevard');
SELECT * FROM students;

-- Insert data into academic_info table
ALTER TABLE academic_info AUTO_INCREMENT = 1;
INSERT INTO academic_info (student_id, department_id, year_of_entry)
VALUES 
(1, 1, 2019),  -- John Doe in Computer Science (Engineering)
(2, 4, 2018),  -- Alice Smith in Literature (Arts)
(3, 2, 2020),  -- Bob Johnson in Mechanical Engineering (Engineering)
(4, 5, 2017),  -- Charlie Brown in Biology (Science)
(5, 3, 2021),  -- David Clark in Electrical Engineering (Engineering)
(6, 6, 2019),  -- Emma White in Management (Business)
(7, 1, 2022),  -- Sophia Lewis in Computer Science (Engineering)
(8, 2, 2020),  -- Michael Turner in Mechanical Engineering (Engineering)
(9, 4, 2019),  -- Olivia Harris in Literature (Arts)
(10, 3, 2021), -- Ethan Lee in Electrical Engineering (Engineering)
(11, 5, 2021), -- Isabella Walker in Biology (Science)
(12, 1, 2021); -- Liam Scott in Aerospace Engineering (Engineering)
SELECT * FROM academic_info;


-- select both data and join them if the student id match with student id in academic info which also match with department id and then match with facultie id as well
SELECT 
    s.id,
    s.name,
    s.birthday,
    s.address,
    f.faculty_name AS faculty,
    d.department_name AS department,
    a.year_of_entry
FROM students s
JOIN academic_info a ON s.id = a.student_id
JOIN departments d ON a.department_id = d.id
JOIN faculties f ON d.faculty_id = f.id;

-- delete all data
DELETE FROM academic_info;
DELETE FROM students;
DELETE FROM faculties;
DELETE FROM departments;

-- testing update where replace id 1
UPDATE students
SET name = 'Alfian', address = 'Bandung'
WHERE id = 1;

UPDATE academic_info
SET department_id = 3, year_of_entry = 2022
WHERE student_id = 1;

-- testing add new person
INSERT INTO students (name, birthday, address)
VALUES ('Willy', '2003-07-21', 'Tangerang');

INSERT INTO academic_info (student_id, department_id, year_of_entry)
VALUES (13, 1, 2023);

SELECT * FROM students;


-- delete table
DROP TABLE `college_db`.`academic_info`;

DROP TABLE `college_db`.`departments`;

DROP TABLE `college_db`.`faculties`;

DROP TABLE `college_db`.`students`;