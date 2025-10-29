-- ===========================================
-- STUDENT MANAGEMENT DATABASE PROJECT
-- Developer: Onen Smith
-- Reg. No: CSC/2025/1234
-- ===========================================

-- Combine project owner info and student-course-teacher list
(
    -- 🧾 Project Owner section
    SELECT 
        'Project Owner: ' || student_name AS col1,
        'Reg No: ' || reg_number AS col2,
        'Project Title: ' || project_title AS col3,
        'Submission Date: ' || submission_date AS col4
    FROM project_owner
)

UNION ALL

(
    -- 🎓 Students, Courses, and Teachers section
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

ORDER BY col1;  -- optional: remove this line if you want to keep your info always first
