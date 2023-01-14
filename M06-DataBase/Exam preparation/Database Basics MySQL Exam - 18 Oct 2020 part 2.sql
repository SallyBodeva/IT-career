Create database StoreSystem;
Use StoreSystem;

create table pictures
(
	id int primary key auto_increment,
    url varchar(100) not null,
    added_on datetime not null
);

Create table categories
(
	id int primary key auto_increment,
    name varchar(40) unique not null
);

create table products
(
	id int primary key auto_increment,
	name varchar(40) unique not null,
    best_before date,
    price decimal(10,2) not null,
    description text,
    category_id int not null,
    picture_id int null,
    constraint fk_products_categories
		foreign key (category_id)
        references categories(id),
	constraint fk_products_pictures
		foreign key (picture_id)
        references pictures(id)
);

create table towns
(
	id int primary key auto_increment,
	name varchar(20) unique not null
);

create table addresses
(
	id int primary key auto_increment,
	name varchar(50) unique not null,
    town_id int not null,
    constraint fk_addresses_towns
		foreign key(town_id)
        references towns(id)
);

create table stores
(
	id int primary key auto_increment,
	name varchar(20) unique not null,
    rating float not null,
    has_parking tinyint default false,
    address_id int not null,
    constraint fk_stores_addresses
		foreign key(address_id)
        references addresses(id)
);

create table products_stores
(
	product_id int not null,
    store_id int not null,
    constraint pk_products_stores
		primary key(product_id,store_id),
    constraint fk_products_stores_products
		foreign key(product_id)
        references products(id),
	constraint fk_products_stores_stores
		foreign key(store_id)
        references stores(id)
);

create table employees
(
	id int primary key auto_increment,
    first_name varchar(15) not null,
    middle_name varchar(15),
    last_name varchar(20) not null,
    salary decimal(19,2) default 0,
    hire_date date not null,
    manager_id int,
    store_id int not null,
    constraint fk_employees_employees
		foreign key(manager_id)
        references employees(id),
	constraint fk_employees_stores
		foreign key(store_id)
        references stores(id)
);
-- Insert data
Insert into products_stores 
Select id as product_id, 1 as store_id from products
where id not in (Select distinct product_id from products_stores);

-- Querying

-- Problem 5 (Employees )
Select first_name,middle_name,last_name,salary,hire_date from employees
order by hire_date desc;

-- Problem 06 (Products with old pictures)
Select p.name,p.price, p.best_before, concat(Left(description,10),'...') as short_description,url from pictures as pi
Join products as p on p.picture_id=pi.id
where Length(description) > 100
and year(added_on) <=2019
and price > 20
order by price desc;

-- Problem 07 (Counts of products in stores and their average )
Select s.name, count(*) as product_count, round(avg(price),2) as avg from stores as s 
Left Join products_stores as ps on ps.store_id = s.id
Left Join products as p on p.id = ps.product_id
Group by s.name
order by product_count desc,avg desc,s.id;

--  Problem 08(Specific employee)
Select concat(e.first_name,' ',e.Last_name) as full_name,s.name as store_name,a.name as address,salary from employees as e 
Join stores as s on s.id= e.store_id
Join addresses as a on a.id= s.address_id
where salary<4000
and a.name like '%5%'
and Length(s.name )>8
and right(e.last_name,1)='n';

-- Problem 09 (Find all information of stores)
Select reverse(s.name) as reversed_name ,concat(Upper(t.name),'-',a.name) as full_address,Count(*) as employees_count from stores as s
Join employees as e on e.store_id=s.id
Join addresses as a on a.id=s.address_id
Join towns as t on t.id= a.town_id
Group by s.name
order by full_address asc;