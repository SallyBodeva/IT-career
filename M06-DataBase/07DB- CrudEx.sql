USE soft_uni;

-- Problem 2.	Намерете цялата информация за отделите
Select * from departments;
-- Problem 3.	Намерете всички имена на отдели
Select distinct name from departments;
-- Problem 4.	Намерете заплатата на всеки служител
Select first_name,last_name, salary from employees;
-- Problem 5.	Намерете пълното име на всеки служител
Select first_name,middle_name,last_name from employees;
-- Problem 6.	Намерете имейл адреса на всеки служител
Select concat(first_name,'.',last_name,'@softuni.bg') as 'full_ email_address' from employees;
-- Problem 7.	Намерете всички различни работни заплати
Select distinct salary 
from employees
Order by salary asc;
-- Problem 8.	Намерете цялата информация за служителиe
Select * 
from employees
where job_title='Sales Representative';
-- Problem 9.	Намерете имената на всички служители със заплата в диапазон
Select first_name,last_name,job_title
from employees
where salary between 20000 and 30000;
-- Problem 10 Намерете имената на всички служители 25000, 14000, 12500 или 23600. 
Select concat_ws(' ',first_name,middle_name,last_name) as 'full name' 
from employees
where salary = 25000 or salary=14000 or salary=12500 or salary = 23600 or salary;
-- Problem 11 Намерете всички служители без мениджър
Select first_name,last_name from employees 
 where employee_id not in (Select distinct manager_id from employees where manager_id is not null);
 -- Problem 12 Намерете всички служители със заплата повече от 50000
 Select first_name,last_name ,salary 
 from employees
 where salary>50000;
 
 -- Problem 13 Намете 5 най-добре платени служителя
Select first_name,last_name
from employees
order by salary desc
limit 5;
-- Problem 14.	Намерете всички служители, които не са от отдел Marketing 
Select first_name,last_name from employees
where  department_id <>4;
-- Problem 15.	Различни длъжности
Select distinct job_title from employees;
-- Problem 16.	Намерете първите 10 започнати проекти
Select * from projects
order by start_date asc
limit  10;

-- Problem 17 Последните 7 наети служители
Select first_name,last_name,hire_date
from employees
order by hire_date desc
limit 7;

-- Problem 18.	Увеличаване на заплати 
Select department_id from departments where(name = 'Engineering' or name = 'Tool Design' or name = 'Marketing'or name = 'Information Services ');
Update employees
Set salary = salary*1.12
where department_id in (Select department_id from departments where name = 'Engineering' or name = ' Tool Design' or name = 'Marketing'or name = 'Information Services ');

Select salary from employees;

Use geography;

-- Problem 19 Всички планински върхове
Select peak_name 
from peaks
order by peak_name; 

-- Problem 20.	 Най-големи по население страни
Select country_name, population from countries
where continent_code ='EU'
order by population desc
limit 30;

-- Problem 21 Страни и валута  (Euro / Not Euro)
Select country_name, country_code, 
	Case
		When currency_code='EUR' Then 'Euro' 
        Else 'Not Euro'  
	End As Currency
From countries
Order By country_name;
