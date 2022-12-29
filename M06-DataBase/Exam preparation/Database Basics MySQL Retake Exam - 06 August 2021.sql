Create database Games;
Use Games;

CREATE TABLE Addresses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL
);

CREATE TABLE Offices (
    id INT PRIMARY KEY AUTO_INCREMENT,
    workspace_capacity INT NOT NULL,
    website VARCHAR(50),
    address_id INT NOT NULL,
    CONSTRAINT fk_offices_addresses FOREIGN KEY (address_id)
        REFERENCES addresses (id)
);
CREATE TABLE Employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    age INT NOT NULL,
    salary DECIMAL(10 , 2 ) NOT NULL,
    job_title VARCHAR(20) NOT NULL,
    happiness_level CHAR NOT NULL
);

CREATE TABLE teams (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    office_id INT NOT NULL,
    leader_id INT UNIQUE NOT NULL,
    CONSTRAINT fk_teams_offices FOREIGN KEY (office_id)
        REFERENCES offices (id),
    CONSTRAINT fk_teams_employees FOREIGN KEY (leader_id)
        REFERENCES employees (id)
);

CREATE TABLE Games (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    rating FLOAT NOT NULL DEFAULT 5.5,
    budget DECIMAL(10 , 2 ) NOT NULL,
    release_date DATE,
    team_id INT NOT NULL,
    CONSTRAINT fk_games_teams FOREIGN KEY (team_id)
        REFERENCES teams (id)
);

CREATE TABLE Games_categories (
    game_id INT NOT NULL,
    category_id INT NOT NULL,
    CONSTRAINT fk_Games_categories_games FOREIGN KEY (game_id)
        REFERENCES games (id),
    CONSTRAINT fk_Games_categories_categoriees FOREIGN KEY (category_id)
        REFERENCES categories (id)
);

-- Querying 

SELECT 
    first_name, last_name, age, salary, happiness_level
FROM
    employees
ORDER BY salary , id;

-- 06. Addresses of the teams
SELECT 
    t.name AS team_name,
    a.name AS address_name,
    LENGTH(a.name) AS count_of_characters
FROM
    teams AS t
        JOIN
    offices AS o ON o.id = t.office_id
        JOIN
    addresses AS a ON a.id = o.address_id
WHERE
    o.website IS NOT NULL
ORDER BY team_name , address_name;

-- 07. Categories Info
SELECT 
    c.name,
    COUNT(*) AS games_count,
    ROUND(AVG(budget), 2) AS avg_budget,
    MAX(rating) AS max_rating
FROM
    categories AS c
        JOIN
    games_categories AS gc ON gc.category_id = c.id
        JOIN
    games AS g ON g.id = gc.game_id
GROUP BY c.name
HAVING max_rating >= 9.5
ORDER BY games_count DESC , name;

-- 08. Games of 2022
SELECT 
    g.name,
    release_date,
    CONCAT(SUBSTRING(description, 1,10), '...') AS summary,
    CASE
        WHEN MONTH(release_date) = '1'
				THEN'Q1' 
		WHEN MONTH(release_date) = '2'
				THEN'Q1' 
	     WHEN MONTH(release_date) ='3'
				THEN'Q1' 
        WHEN MONTH(release_date) = '4' 
			THEN 'Q2' 
		WHEN MONTH(release_date) = '5'
			THEN'Q2' 
		WHEN MONTH(release_date) = '6'
			THEN 'Q2'
        WHEN MONTH(release_date) = '7' 
             THEN'Q3'
		WHEN  MONTH(release_date) = '8'
			THEN 'Q3'
		 WHEN MONTH(release_date) = '9'
			THEN'Q3'
        ELSE 'Q4'
    END AS quarter,
    t.name
FROM
    games AS g
JOIN teams AS t ON t.id = g.team_id
WHERE
    g.name LIKE '%2'
        AND MONTH(release_date) % 2 = 0
        AND Year(release_date) =2022
ORDER BY quarter;

-- 09. Full info for games
SELECT 
    g.name,
    CASE
        WHEN g.budget < 50000 THEN 'Normal budget'
        ELSE 'Insufficient budget'
    END AS budget_level,
    t.name AS team_name,
    a.name AS address_name
FROM
    games AS g
        JOIN teams AS t ON t.id = g.team_id
        JOIN offices AS o ON o.id = t.office_id
        JOIN addresses AS a ON a.id = o.address_id
WHERE
    release_date IS NULL
        AND g.id NOT IN (SELECT DISTINCT
            game_id
        FROM
            games_categories)
ORDER BY g.name;
