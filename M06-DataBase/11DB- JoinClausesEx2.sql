Use soft_uni;

-- Problem 1.	Адреси с градове
Select first_name,last_name,t.name as town,address_text from employees as e
Join addresses as a on a.address_id= e.address_id
join towns as t on t.town_id = a.town_id
order by first_name,last_name
limit 5;

-- Problem 2.	Служители, наети по-късно
Select first_name, last_name,hire_date, d.name as dept_name from employees as e
Join departments as d on d.department_id=e.department_id
where hire_date> 1/1/1999 and  d.name = 'Finance' or d.name = 'Sales'
order by hire_date asc; 

-- Problem 3.	Служители с проект
Select e.employee_id,e.first_name,p.name as project_name from employees e
Join employees_projects as ep on ep.employee_id=e.employee_id
JOin projects as p on p.project_id = ep.project_id
where  p.start_date> 13/08/2002 and p.end_date is null
order by e.first_name, p.name
limit 5;

-- Problem 4.	Резюме на служителите
Select e.employee_id,e.first_name as employee_name,em.first_name as manager_name,d.name as department_name from employees as e
Join employees as em on e.manager_id = em.employee_id
Join departments as d on d.department_id = e.department_id
order by e.employee_id
limit 5;

Use geography;
-- Problem 5.	Най-високи върхове в България

Select c.country_code,m.mountain_range,p.peak_name,p.elevation from countries as c
join mountains_countries as mc on mc.country_code = c.country_code
join mountains as m on m.id= mc.mountain_id
join peaks as p on p.mountain_id = m.id
where p.elevation > 2835 and c.country_code='BG'
order by p.elevation desc;

-- Problem 6.	Планински вериги
Select c.country_code,c.country_name, m.mountain_range from countries as c
join mountains_countries as mc on mc.country_code = c.country_code
join  mountains as m on m.id= mc.mountain_id
where c.country_code in ('BG','RU','US') 
order by country_code, mountain_range;


