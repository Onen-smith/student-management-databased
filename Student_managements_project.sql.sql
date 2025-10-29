CREATE TABLE teachers (
    teacher_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    teacher_id INT REFERENCES teachers(teacher_id)
);

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id),
    enrollment_date DATE
);

CREATE TABLE project_owner (
    owner_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100),
    reg_number VARCHAR(50),
    project_title VARCHAR(150),
    submission_date DATE
);

INSERT INTO teachers (name) VALUES ('Mr. Okafor'), ('Dr. Johnson');

INSERT INTO courses (course_name, teacher_id)
VALUES ('Mathematics', 1), ('Physics', 2);

INSERT INTO students (name)
VALUES ('Onen Smith'), ('Joy Emmanuel');

INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES (1, 1, '2025-02-15'), (2, 2, '2025-03-10');

INSERT INTO project_owner (student_name, reg_number, project_title, submission_date)
VALUES ('Onen Emmanuel', '23/SEN/129', 'Student Management Database', '2025-10-27');

(
    SELECT 
        'Project Owner: ' || student_name AS col1,
        'Reg No: ' || reg_number AS col2,
        'Project Title: ' || project_title AS col3,
        'Submission Date: ' || submission_date AS col4
    FROM project_owner
)

UNION ALL

(
    SELECT
        'Student: ' || s.name AS col1,
        'Course: ' || c.course_name AS col2,
        'Teacher: ' || t.name AS col3,
        'Enrollment Date: ' || e.enrollment_date AS col4
    FROM enrollments e
    JOIN students s ON e.student_id = s.student_id
    JOIN courses c ON e.course_id = c.course_id
    JOIN teachers t ON c.teacher_id = t.teacher_id
)

ORDER BY col1;