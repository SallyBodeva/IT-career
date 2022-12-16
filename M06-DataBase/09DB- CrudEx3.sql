Use soft_uni;
-- Problem 1.	Най-ниско платени служители
Select first_name,last_name, salary from employees
where salary = (select salary  from employees 
		order by salary asc	
		 	limit 1 );
-- Problem 2.	Служители с близки до най-ниските заплати

SELECT first_name, last_name, salary 
FROM employees
WHERE salary <= 
	(
		SELECT salary FROM employees
		ORDER BY salary LIMIT 1
    ) * 1.1;
    
-- Problem 3.	Всички мениджъри

Select first_name,last_name, job_title from employees
where employee_id  in (Select manager_id from employees)
order by first_name asc, last_name asc;

-- Problem 4.	Служителите от San Francisco
Select first_name,last_name from employees
where address_id in
(
	select address_id from addresses where town_id = (Select town_id from towns where name='San Francisco')
);
