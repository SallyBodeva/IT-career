Create database ElectricStore;
Use ElectricStore;

Create table brands
(
	id int primary key auto_increment,
    name varchar(40) unique not null
);

Create table categories
(
	id int primary key auto_increment,
    name varchar(40) unique not null
);

Create table Reviews
(
	id int primary key auto_increment,
    content text not null,
    rating decimal(10,2) not null,
    picture_url varchar(80) not null,
    published_at datetime not null
);

Create table products
(
	id int primary key auto_increment,
    name varchar(40) not null,
    price decimal(19,2) not null,
    quantity_in_stock int,
    description text,
    brand_id int not null,
    category_id int not null,
    review_id int,
    constraint fk_products_brands
		foreign key(brand_id)
        references brands(id),
	constraint fk_products_categories
		foreign key (category_id)
		references categories(id),
	constraint fk_products_reviews
		foreign key (review_id)
        references reviews(id)
);

Create table Customers
(
	id int primary key auto_increment,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    phone varchar(30) unique not null,
    address varchar(60) not null,
    discount_card bit default (false) not null
);

Create table Orders
(
	id int primary key auto_increment,
    order_datetime datetime not null,
    customer_id int not null,
    constraint fk_orders_customers
		foreign key (customer_id)
        references customers(id)
);

Create table orders_products
(
	order_id int not null,
    product_id int not null,
    constraint fk_orders_products_orders
		foreign key (order_id)
        references orders(id),
	constraint fk_order_products_products
		foreign key (product_id)
        references products(id)
);
-- Querying – Problem 5
Select * from categories
order by name desc ;

-- Querying – Problem 6
Select id,brand_id,name,quantity_in_stock from products
where price>1000 and quantity_in_stock < 30
order by quantity_in_stock,id;

-- Querying – Problem 7

Select id,content,rating,picture_url,published_at from reviews
where SUBSTRING(content, 1, 2) ='My' and LENGTH(content)>61
order by rating desc;

-- Querying – Problem 8
Select concat(first_name,' ',last_name) as full_name,address,order_datetime from customers as c
Join orders as o on o.customer_id= c.id
where Year(order_datetime) <=2018
order by full_name desc;

-- Querying – Problem 9
Select Count(*) as items_count,c.name,Sum(quantity_in_stock) as total_quantity from categories as c
join products as p on p.category_id=c.id
group by c.name
order by items_count desc, total_quantity asc
limit 5;
