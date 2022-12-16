Use soft_uni;

-- Problem 1.	Адрес на служител
Select employee_id,job_title,e.address_id,address_text from employees as e
join addresses as a on a.address_id = e.address_id;

-- Problem 2.	Служител по продажбите

Select employee_id,first_name,last_name,d.name as department_name from employees as e
Join departments as d on d.department_id=e.department_id
where d.name ='Sales'
order by e.employee_id desc;

-- Problem 3.	Служебни отдели
Select employee_id,first_name,salary, d.name as department_name from employees as e
Join departments as d on d.department_id= e.department_id
where salary>15000
order by d.department_id desc
limit 5;

-- Problem 4.	Служители без проект
Select employee_id ,first_name from employees 
where employee_id not in (Select distinct employee_id from employees_projects)
order  by employee_id desc
limit 3;

-- Problem 5.	Мениджър на служителите
Select e.employee_id,e.first_name,em.manager_id,em.first_name as manager_name from employees as e
Join employees as em on em.employee_id= e.employee_id
where em.manager_id = 7 or em.manager_id = 3
order by e.first_name asc;

-- Problem 6.	Минимална заплата
Select salary,d.name from employees as e
Join departments as d on d.department_id= e.department_id
order by salary asc
limit 1;

Use geography;

-- Problem 7.	Държави без планини
Select country_name from countries 
where country_code not in (Select distinct country_code from mountains_countries)
order by country_name;

Select * from mountains_countries;