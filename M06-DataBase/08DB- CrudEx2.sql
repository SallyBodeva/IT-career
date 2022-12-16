-- Problem 1.	Намерете всички служители със заплата над 50000
 Select first_name,last_name,salary 
 from employees
 where salary > 50000
 Order by salary desc;
 -- Problem 2 Намерете 5 най-добре платени служители.
 
 Select first_name, last_name from employees
 order by salary desc
 limit 5;
 
 -- Problem 3.	Сортирайте таблицата със служители
 
 Select * from employees
 order by salary desc,first_name asc,last_name desc,middle_name asc;
 
 -- Problem 4.	Намерете първите 10 започнати проекта
select * from projects
order by start_date asc,name
limit 10;

-- Problem 5.	 Последните 7 наети служителя
Select first_name,last_name, hire_date from employees
order  by hire_date desc
limit 7;

-- Problem 6.	Всички планински върхове
 Use geography;
 
 Select distinct  peak_name from peaks;
 
 -- Problem 7.	 Най-големи държави по население
 Select country_name, population from countries
 where continent_code in (select continent_code from continents where continent_name ='Europe')
 order by population desc,country_name asc
 limit 30;
 
 -- Problem 8.	 Държави и валути (Евро / Не евро)
SELECT country_name, country_code, 
	CASE 
		WHEN currency_code='EUR' THEN 'Euro' 
        ELSE 'Not Euro'  
	END AS Currency
FROM countries
ORDER BY country_name;