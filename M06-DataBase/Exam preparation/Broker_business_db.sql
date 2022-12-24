Create database broker_business_db;
Use broker_business_db;

Create table Cities
(
	id int primary key auto_increment,
    name varchar(45) not null,
    country_name varchar(60) not null
);

Create table Companies
(
	id int primary key auto_increment,
	name varchar(45) not null,
	rate int not null,
    created_on date not null
);

Create table building_types
(
	id int primary key auto_increment,
	name varchar(30) not null
);

Create table persons
(
	id int primary key auto_increment,
    username varchar(30) unique not null,
    company_id int,
    city_id int not null,
    constraint fk_persons_companies
		foreign key (company_id)
        references companies(id),
	constraint fk_persons_cities
		foreign key (city_id)
        references cities(id)
);

Create table person_info
(
	id int primary key auto_increment,
	first_name varchar(30) not null,
    last_name varchar(30),
    money decimal(15,2),
    person_id int not null,
    constraint fk_person_info_persons
		foreign key (person_id)
        references persons(id)
);

Create table buildings
(
	id int primary key auto_increment,
    name varchar(80) not null,
    rent_amount decimal (17,2) not null,
    height decimal(15,2) not null,
    floors int,
    finished_year int,
    status varchar(50) not null,
    city_id int not null,
    type_id int not null,
    company_id int not null,
     constraint fk_buildins_cities
		foreign key (city_id)
        references cities(id),
	 constraint fk_building_building_type
		foreign key (type_id)
        references building_types(id),
	constraint fk_buildings_comapanies
		foreign key (company_id)
        references companies(id)
);

Create table persons_buildings
(
	person_id int not null,
    building_id int not null,
    constraint pk_person_building
		Primary key (person_id,building_id),
    constraint fk_persons_buildings_persons
		foreign key (person_id)
        references persons(id),
	constraint fk_persons_buildings_buildings
		foreign key (building_id)
        references buildings(id)
);

-- Заявка 1: Хора
Select id, username, company_id from persons 
where city_id =10
and company_id is not null
order by username asc, id asc;

-- Заявка 2: Заети сгради

Select id, name as building_name, rent_amount,height, status  from buildings
where rent_amount > 5000 and height > 500
order by rent_amount desc, name asc;

-- Заявка 3: Компания West

Select p.id,username,first_name,last_name, c.name as company_name from persons as p 
Join companies as c on c.id = p.company_id
Join person_info as pf on pf.person_id = p.id
where c.name = 'West'
Order by pf.first_name, pf.last_name;

-- Заявка 4: Първите 15

Select p.username,co.name as company_name, c.name as city_name, c.country_name from persons as p
Left Join cities as c on c.id= p.city_id
Left Join companies as co on co.id= p.company_id
where p.id<15
order by co.id, p.username;

-- Заявка 5: Типове сгради

Select bt.name,Count(*) as building_count,Max(rent_amount) as max_rent_amount, Min(rent_amount) as min_rent_amount from buildings as b
Join building_types as bt on bt.id = b.type_id
Group by bt.name 
order by building_count desc;

-- Заявка 6: Поръчки по държави
Select b.name as building_name,bt.name as building_type,status,c.name as city_name,Count(*) as persons_count from persons_buildings as pb
LEFT Join buildings as b on b.id= pb.building_id
Left Join building_types as bt on bt.id = b.type_id
LEFT Join cities as c on c.id= b.city_id
Group by b.name
order by persons_count desc,building_name desc
limit 20;

-- Заявка 7: Поръчки от род
Select c.name as company_name,status,Sum(rent_amount) as sum,Count(*) as building_count from buildings as b
Join companies as c on c.id= company_id
Group by c.name,status
Having sum>15000
order by sum desc, building_count desc;