Create database Films;
Use films;
Create table directors
(
	id int primary key auto_increment,
    director_name nvarchar(50) not null,
    notes nvarchar(200)
);
Create table Genres
(
	id int primary key auto_increment,
    genre_name nvarchar(30) not null,
    notes nvarchar(200)
);
Create table Categories
(
	id int primary key auto_increment,
    category_name nvarchar(30) not null,
	notes nvarchar(200)
);
Create table Films
(
	id int primary key auto_increment,
    title nvarchar(30) not null,
    director_id int not null,
    constraint fk_directors_films
	   Foreign key(director_id)
       references directors(id),
    copyright_year int not null,
    length int,
    genre_id int not null,
       constraint fk_films_Genres
          foreign key (genre_id)
          references Genres(id),
     category_id int not null,
       constraint fk_films_Categories
          foreign key (category_id)
          references Categories(id),
    rating decimal(4,2),
    notes nvarchar(200)
);
