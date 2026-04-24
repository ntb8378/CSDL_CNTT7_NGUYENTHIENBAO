-- Hệ thống học trực tuyến
CREATE DATABASE course_online;
USE course_online;

-- Sinh viên (Student) 
CREATE TABLE student(
	student_id int primary key auto_increment,
    fullname varchar(255) not null,
    birthday date,
    email varchar(255) not null unique
);

-- Giảng viên (Teacher)
CREATE TABLE teacher(
	teacher_id int primary key auto_increment,
    fullname varchar(255) not null,
    email varchar(255) not null unique
   -- Một giảng viên có thể dạy nhiều khóa học
);

-- Khóa học (Course)
CREATE TABLE course(
	course_id int primary key auto_increment,
    course_name varchar(100) not null,
    description varchar(255) not null,
    number_of_lesson int not null,
    teacher_id int,

    foreign key(teacher_id) references teacher(teacher_id)
);

-- Đăng ký học (Enrollment)
CREATE TABLE enrollment(
	enrollment_id int primary key auto_increment,
    student_id int, 
    course_id int,
    created_at timestamp default current_timestamp,
    unique(student_id, course_id),

	foreign key(student_id) references student(student_id),
    foreign key(course_id) references course(course_id)
);

-- Kết quả học tập (Score)
CREATE TABLE score(
	score_id int primary key auto_increment,
    student_id int, 
    course_id int,
    middle_score int check(middle_score >= 0 AND middle_score <= 10) not null,
    final_score int check(final_score >= 0 AND final_score <= 10) not null,
	unique(student_id, course_id),

    foreign key(student_id) references student(student_id),
    foreign key(course_id) references course(course_id)
);


INSERT INTO teacher(fullname, email) VALUES
('Nguyen Van A', 'nguyenvana@gmail.com'),
('Tran Thi B', 'tranthib@gmail.com'),
('Le Van C', 'levanc@gmail.com'),
('Pham Thi D', 'phamthid@gmail.com'),
('Hoang Van E', 'hoangvane@gmail.com');
INSERT INTO student(fullname, birthday, email) VALUES
('Nguyen Minh Anh', '2004-05-10', 'minhanh@gmail.com'),
('Tran Bao Chau', '2003-08-15', 'baochau@gmail.com'),
('Le Hoang Nam', '2004-01-20', 'hoangnam@gmail.com'),
('Pham Gia Huy', '2003-11-02', 'giahuy@gmail.com'),
('Vo Thi Mai', '2004-07-25', 'thimai@gmail.com');
INSERT INTO course(course_name, description, number_of_lesson, teacher_id) VALUES
('Lap trinh C', 'Hoc lap trinh C co ban', 30, 1),
('Lap trinh Java', 'Hoc Java tu co ban den nang cao', 40, 2),
('Co so du lieu', 'Hoc SQL va Database', 35, 3),
('Lap trinh Web', 'HTML CSS JavaScript', 45, 4),
('Mang may tinh', 'Kien thuc mang co ban', 30, 5);
INSERT INTO enrollment(student_id, course_id) VALUES
(1,1),
(1,2),
(2,3),
(3,4),
(4,5),
(5,1),
(2,2),
(3,3);
INSERT INTO score(student_id, course_id, middle_score, final_score) VALUES
(1,1,7,8),
(1,2,6,7),
(2,3,8,9),
(3,4,5,6),
(4,5,9,9),
(5,1,7,8),
(2,2,6,7),
(3,3,8,8);



UPDATE student
SET email = 'newemail@gmail.com'
WHERE student_id = 1;
UPDATE student
SET email = 'minhanh_new@gmail.com'
WHERE student_id = 1;
UPDATE course
SET description = 'Khoa hoc Java nang cao va thuc hanh'
WHERE course_id = 2;
UPDATE score
SET final_score = 9
WHERE student_id = 1 
AND course_id = 1;


DELETE FROM enrollment
WHERE student_id = 3 
AND course_id = 4;
DELETE FROM score
WHERE student_id = 3 
AND course_id = 4;
DELETE FROM score
WHERE student_id = 3 
AND course_id = 4;
DELETE FROM enrollment
WHERE student_id = 3 
AND course_id = 4;
DELETE FROM score
WHERE student_id = 2 
AND course_id = 2;
DELETE FROM enrollment
WHERE student_id = 2 
AND course_id = 2;


SELECT * 
FROM student;
SELECT * 
FROM teacher;
SELECT * 
FROM course;
SELECT * 
FROM enrollment;
SELECT * 
FROM score;