Create database teachers;
Use teachers;

Create table teachers
(
	teacher_id int primary key auto_increment,
    name nvarchar(50) not null,
    manager_id int,
    constraint fk_teachers_teacher
		foreign key (manager_id)
		references teachers(teacher_id)
)auto_increment=101;