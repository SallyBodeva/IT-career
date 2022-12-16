Create database MinionsSociety;
Use MinionsSociety;

Create table minions
(
	id int primary key auto_increment,
    name nvarchar(50) not null,
    age int not null
);

Create table towns
(
	town_id int primary key auto_increment,
    name nvarchar(50) not null
);

Insert into Minions(name,age)
values 
('Kvein',22),
('Bob',15),
('Steward',14);

Insert into Towns(name)
values
('Sofia'),
('Plovdiv'),
('Varna');