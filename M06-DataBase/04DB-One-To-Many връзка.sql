Create database Factory;
Use Factory;

create table manufacturers
(
	manifactuter_id int primary key auto_increment,
    name nvarchar(50) not null,
    established_on datetime
);
Create table models
(
	model_id int primary key auto_increment,
    name nvarchar(50) not null,
    manifacturer_id int,
    constraint fk_models_manifacturers
    foreign key (manifacturer_id)
    references manufacturers(manifactuter_id)
)AUTO_INCREMENT = 101;

