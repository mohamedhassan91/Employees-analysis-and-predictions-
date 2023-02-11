use employees;
show tables;
select * from employees;
select * from departments;
-- selecting random name and specific gender 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'denis' AND gender = 'm';
-- Retrieve a list with all employees whose first name is either Kellie or Aruna.
SELECT 
    *
FROM
    employees
WHERE
    (first_name = 'kellie'
        OR first_name = 'aruna');
-- Retrieve a list with all employees whose first name is either Kellie or Aruna and their gender male 
SELECT 
    *
FROM
    employees
WHERE
    (first_name = 'kellie'
        OR first_name = 'aruna')
        AND gender = 'm';
-- Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('aruna' , 'mark', 'jacob');
/*
 use the LIKE operator to select the data about all individuals, whose first
name starts with “Mark”; specify that the name can be succeeded by any sequence of characters.
*/
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('mar_');
-- Extract all individuals from the ‘employees’ table whose first name contains “Jack”.
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%jack%');
-- Once you have done that, extract another list containing the names of employees that do not contain “Jack”.
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%jack%');
-- Retrieve a list with all employees who have been hired in the year 2000.
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');
-- Retrieve a list with all employees whose employee number is written with 5 characters, and starts with 1000
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');
-- Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;
-- Select the names of all departments with numbers between ‘d003’ and ‘d006’.
SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
-- Retrieve a list with data about all female employees who were hired in the year 2000 or after.
SELECT 
    *
FROM
    employees
WHERE
    gender = 'f'
        AND hire_date >= '2000-01-01';
-- Extract a list with all employees’ salaries higher than $150,000 per annum.
SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;
-- average salary of all employees
SELECT 
    AVG(salary) AS average_salary
FROM
    salaries;
-- How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table? 
SELECT 
    COUNT(salary) AS count_of_salaries
FROM
    salaries
WHERE
    salary >= 100000;
-- How many managers do we have in the “employees” database? Use the star symbol (*) in your code to solve this exercise.
select * from emp_manager;
-- Select all data from the “employees” table, ordering it by “hire date” in descending order.
select * from employees order by hire_date desc;
/*
Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000
dollars.The second column, renamed to “emps_with_same_salary”
, must show the number of employees
contracted to that salary. Lastly, sort the output by the first column.
*/
set sql_mode = '';
select * from salaries;
SELECT 
    salary, COUNT(emp_no) AS emp_with_same_salary
FROM
    salaries
GROUP BY emp_no
HAVING salary > 80000
order by salary asc;
-- Select all employees whose average salary is higher than $120,000 per annum.
select emp_no , avg(salary) as average_salary from salaries where salary > 120000 group by emp_no order by average_salary;
-- Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000
select * from dept_emp;
select emp_no , count(from_date) from dept_emp where from_date > '2000-01-01' group by emp_no having count(from_date) > 1;
select * from departments;
commit;
select * from employees where emp_no like('9999%');
DELETE FROM employees 
WHERE
    emp_no IN (999901 , 999902, 999903); -- deleting records added before for testing 
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;
SELECT 
    MIN(salary)
FROM
    salaries;
select max(salary) from salaries;
-- Select the department number and name from the ‘departments_dup’ table and add a third column where you
-- name the department number (‘dept_no’) as ‘dept_info’. If ‘dept_no’ does not have a value, use ‘dept_name’.
SELECT 
    dept_no, dept_name, IFNULL(dept_no, dept_name) AS dept_inf
FROM
    departments_dup; 
SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name, 'N/A') AS dept_ino
FROM
    departments_dup;
SELECT 
    first_name,
    last_name,
    CASE
        WHEN gender = 'm' THEN 'male'
        WHEN gender = 'f' THEN 'female'
    END AS gender
FROM
    employees;
use employees;  
-- getting department name for each manager 
SELECT 
    dm.emp_no, dm.dept_no, d.dept_name
FROM
    dept_manager dm
        JOIN
    departments d ON d.dept_no = dm.dept_no
ORDER BY dept_no;   
select * from employees;
select * from salaries;
-- will use this in my python file all active employees now with their info and salary
SELECT 
    e.*, s.salary, t.title, d.dept_no
FROM
    employees e
        LEFT JOIN
    salaries s ON e.emp_no = s.emp_no
        JOIN
    titles t ON e.emp_no = t.emp_no
        JOIN
    dept_emp d ON e.emp_no = d.emp_no
where salary is not null    
GROUP BY emp_no
ORDER BY emp_no;
select * from dept_emp;
select distinct title from titles;
-- getting numbers of employees per each department
SELECT 
    dept_no, COUNT(emp_no) AS count_per_department
FROM
    dept_emp
GROUP BY dept_no
ORDER BY dept_no;
# use a CROSS JOIN to return a list with all possible combinations  between managers from dept_manager table and depatment number 9
SELECT 
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_name;
-- selecting employees 
SELECT 
    *
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);
select * from salaries;
select * from dept_emp;
select e.* , s.salary
from employees e left join salaries s on e.emp_no = s.emp_no
where e.emp_no = 253602
;
select max(to_date) from salaries;
select * from salaries;