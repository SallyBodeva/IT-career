Create database Cinema;
Use Cinema;

Create table Countries
(
	id int primary key auto_increment,
    name varchar(30) unique not null,
    continent varchar(30) not null,
    currency varchar(5) not null
);
Create table Genres
(
	id int primary key auto_increment,
    name varchar(50) unique not null
);

Create table Actors
(
	id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    birthdate date not null,
    height int,
    awards int,
    country_id int not null,
    constraint fk_actors_countries
    foreign key (country_id)
    references countries(id)
);

 Create table movies_additional_info
 (
	id int primary key auto_increment,
    rating decimal(10,2) not null,
    runtime int not null,
    picture_url varchar(80) not null,
    budget decimal(10,2),
    release_date date not null,
    has_subtitles tinyint,
    description text
 );
 Create table movies
 (
	id int primary key auto_increment,
    title varchar(70) not null,
    country_id int not null,
    movie_info_id int not null,
    constraint fk_movies_countries
		foreign key (country_id)
		references countries(id),
    constraint fk_movies_movies_additional_info
		foreign key (movie_info_id)
        references movies_additional_info(id)
 );
 create table movies_actors
 (
	movie_id int not null,
    actor_id int not null,
	constraint fk_movies_actors_movies
		foreign key(movie_id)
        references movies(id),
	constraint fk_movies_actors_actors
		foreign key (actor_id)
        references actors(id)
 );

 Create table genres_movies
 (
	genre_id int not null,
    movie_id int not null,
	constraint fk_genres_movies_genres
		foreign key (genre_id)
        references genres(id),
	constraint fk_genres_movies_movies
		foreign key (movie_id)
        references movies(id)
 );
 -- Querying - Problem 5 
Select * from countries
order  by currency desc, id;

 -- Querying - Problem 6 
 Select m.id, title,runtime,budget, release_date  from movies_additional_info as ma
 join movies as m on m.movie_info_id= ma.id
 where Year(release_date) between 1996 and 1999
 order by runtime,id
 limit 20;
 
  -- Querying - Problem 7
  Select concat(first_name,' ',last_name) as full_name, concat(Reverse(last_name),Length(last_name),'@cast.com')as email,2022-Year(birthdate) as age,height from actors
  where id not in (Select actor_id from movies_actors)
  order by height asc;
  
    -- Querying - Problem 8
    
    Select name, Count(*) as movies_count from countries as c
    Join movies as m on m.country_id= c.id
    Group by name
    having movies_count >=7
    order by name desc;
    
    -- Querying - Problem 9
SET SQL_SAFE_UPDATES=0;

ALTER TABLE movies_additional_info
Modify COLUMN rating varchar(30) ;

Update movies_additional_info
Set rating = 'poor'
where rating <='4'; 

Update movies_additional_info
Set rating = 'good'
where rating >'4' and rating <='7';      

Update movies_additional_info
Set rating = 'excellent'
where rating > '7';    

ALTER TABLE movies_additional_info
Modify COLUMN has_subtitles varchar(30) ;

Update movies_additional_info
Set has_subtitles = 'english'
where has_subtitles= '1';

Update movies_additional_info
Set has_subtitles = '-'
where has_subtitles= '0';

Select title, rating , has_subtitles as subtitles,budget from movies_additional_info as ma
Join movies as m on m.movie_info_id = ma.id
order by budget desc;

  