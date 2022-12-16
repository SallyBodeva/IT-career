Create database Exams;
Use Exams;
 
 Create table students
 (
	student_id int primary key auto_increment,
    name nvarchar(50) not null
 );
 
 Create table exams
 (
	exam_id int primary key auto_increment,
     name nvarchar(50) not null
 );
 
 Create table students_exam
 (
	student_id int ,
    exam_id int,
    constraint fk_students_exams_students
		primary key (student_id,exam_id),
    constraint fk_students_exam_students
		foreign key (student_id)
		references students(student_id),
    constraint fk_students_exams_exams
		foreign key (exam_id)
		references exams(exam_id)
 );
 
 
INSERT INTO Students (name)
VALUES
	('Mila'),
    ('Toni'),
    ('Ron');
    
    INSERT INTO Exams (name)
VALUES 
	('Spring MVC'),
    ('Neo4j'),
    ('Oracle 11g');
    
    INSERT INTO Students_exam(student_id,exam_id)
VALUES 
	(1,1),
    (1,2),
    (2,1),
    (3,3),
    (2,2),
    (2,3);
