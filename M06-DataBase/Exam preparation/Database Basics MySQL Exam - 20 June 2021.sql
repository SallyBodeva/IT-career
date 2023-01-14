Create database TaxiCompany;
Use TaxiCompany;
Create table addresses
(
	id int primary key auto_increment,
    name varchar(100) not null
);

Create table categories
(
	id int primary key auto_increment,
    name varchar(10) not null
);

Create table clients
(
	id int primary key auto_increment,
    full_name varchar(50) not null,
    phone_number varchar(20) not null
);

Create table drivers
(
	id int primary key auto_increment,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    age int not null,
    rating float default 5.5
);

Create table cars
(
	id int primary key auto_increment,
    make varchar(20) not null,
    model varchar(20),
    year int not null default 0,
    mileage int  default 0,
    conditio char(1) not null,
    category_id int not null,
	constraint fk_cars_categories
		foreign key (category_id)
        references categories(id)
);

create table courses
(
	id int primary key auto_increment,
    from_address_id int not null,
    start datetime not null,
    bill decimal(10,2) default 10,
    car_id int not null,
    client_id int not null,
    constraint fk_courses_addresses
		foreign key (from_address_id)
        references addresses(id),
	constraint fk_courses_cars
		foreign key(car_id)
        references cars(id),
	constraint fk_courses_clients
		foreign key(client_id)
        references clients(id)
);

Create table cars_drivers
(
	car_id int not null,
    driver_id int not  null,
    constraint fk_cars_drivers_cars
		foreign key(car_id)
		references cars(id),
	constraint fk_cars_drivers_drivers
		foreign key(driver_id)
        references drivers(id)
);

insert into clients (full_name,phone_number)
select concat(first_name,' ',last_name) as full_name,
concat('(088) 9999',id*2) as phone_number
from drivers
where id between 10 and 20;
-- Querying 

-- Problem 5
Select make,model,conditio from cars
order by id;
-- Problem 6
Select first_name,last_name,make,model,mileage from drivers as d
Join cars_drivers as cd on cd.driver_id= d.id
Join cars as c on c.id=cd.car_id
where mileage is not null
order by mileage desc, first_name;

-- Problem 7
 Select c.id,make,mileage,Count(*) as count_of_courses, Round(Avg(bill),2) as avg_bill from courses
 Join cars as c on c.id= courses.car_id
 group by model
 having count_of_courses<>2
 order by count_of_courses desc,c.id;
 