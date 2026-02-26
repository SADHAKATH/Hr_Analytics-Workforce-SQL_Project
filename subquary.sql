/* ----- SUB QUARY -----

1. single row ----> ( using by operator condition comparing  =,<,>,<=,>=,==,!=)
2. multi row -----> ( IN,ANY,ALL )
3. co-related -----> 

*/



use hr;
select * from employees order by salary desc;

select first_name,salary from employees order by salary desc limit 1;

select max(salary) as higher_salary from employees;

/* ---- need to fetch how many there are getting max salary ----*/

/* ==== 1.SINGLE ROW ==== */
select * from employees where salary=(select max(salary) from employees);  #----> subquary ,(outer quary,inner quary). 

select * from employees where salary>(select avg(salary) from employees where department_id="50"); 

/* ==== 2.MULTI ROW ==== */
select * from employees where salary in (select salary from employees where department_id="50"); 

select * from employees where salary < any (select salary from employees where department_id="50"); 

select * from employees where salary > all (select salary from employees where department_id="50");  

/* ==== 3.co-related ==== */

select * from employees e1
where salary > (select avg(salary) from employees e2 where e1.department_id = e2.department_id); --- who earn more than employees avg salary ==corelated subquary ---


select * from employees e1
where salary = (select sum (salary) from employees e2 where e1.department_id = e2.department_id); 


