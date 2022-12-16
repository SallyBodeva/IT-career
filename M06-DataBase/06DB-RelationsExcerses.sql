-- Problem 1.	База данни за онлайн магазин
Create database OnlineStore;
Use OnlineStore;

Create table cities
(
	id int primary key auto_increment,
    name nvarchar(30) not null
);
Create table customers
(
	id int primary key auto_increment,
    name nvarchar(50) not null,
    birthday_date datetime,
    city_id int,
    constraint fk_customers_cities
		foreign key (city_id)
		references cities(id)
);

Create table Orders
(
	id int primary key auto_increment,
    customer_id int,
    constraint fk_orders_customers
		foreign key (customer_id)
		references customers(id)
);

Create table Item_types
(
	item_type_id int primary key auto_increment,
    name nvarchar(100) not null
);

Create table items
(
	item_id int primary key auto_increment,
    name nvarchar(50) not null,
    item_type_id int,
    constraint fk_items_item_types
		foreign key(item_type_id)
        references item_types(item_type_id)
);

Create table order_items
(
	order_id int,
    item_id int,
    constraint pk_orders_items
    primary key (order_id,item_id),
    constraint fk_order_items_orders
		foreign key (order_id)
        references orders(id),
        constraint fk_order_items
        foreign key (item_id)
        references items(item_id)
);

-- Problem 2.	Университетска база данни

Create database Uni;
Use Uni;

Create table majors
(
	id int primary key auto_increment,
    name nvarchar(50) not null
);

Create table subjects
(
	id int primary key auto_increment,
    name nvarchar(50) not null
);

Create table students
(
	id int primary key auto_increment,
    number nvarchar(10) not null,
    name nvarchar(50) not null,
    major_id int,
		constraint fk_students_majors
        foreign key (major_id)
        references majors(id)
    
);

Create table payments
(
	id int primary key auto_increment,
    date datetime not null,
    amount decimal(8,2) not null,
    student_id int not null,
		constraint fk_payments_students
        foreign key (student_id)
        references students(id)
);

Create table agenda
(
	student_id int not null,
    subject_id int not null,
		constraint pk_students_subjects
			primary key (student_id,subject_id),
		constraint fk_agenda_students
            foreign key (student_id)
            references students(id),
		constraint fk_agenda_subjects
			foreign key (subject_id)
            references subjects(id)
);