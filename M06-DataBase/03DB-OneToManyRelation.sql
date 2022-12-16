create database People;

Use People;

Create table Persons
(
	person_id int primary key auto_increment,
    first_name nvarchar(30) not null,
    salary decimal(8,2),
    passport_id int unique not null,
       constraint fk_persons_passports
     foreign key (passport_id)
     references Passports(passport_id)
    
);
Create table Passports
(
	 passport_id int  primary key auto_increment,
     passport_number nvarchar(10) unique not null
);