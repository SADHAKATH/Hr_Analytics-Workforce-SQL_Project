/* ---- JOINS ----
	Types of joins
1. INNER JOIN ---> a^b ---> common rows
2. LEFT JOIN ----> left table + a^b
3. RIGHT JOIN ----> right + a^b
4. FULL JOIN ---> left + right
5. SELF JOIN ----> table1 vs table1

*/
 ----- 1.INNER JOIN -----
select E.employee_id,E.first_name,D.department_name
from employees E
inner join
departments D
on E.department_id=D.department_id;


/* ---- 3.RIGHT JOIN ----- */
select d.department_id,l.location_id,l.city
from departments d
right join
locations l
on d.location_id=l.location_id
where l.city="tokyo";

/* ----- 2.Left join ----- */
select e.employee_id,e.first_name,d.department_name
from employees e
left join
departments d
on e.department_id=d.department_id;

/* ----- 4.full join -----*/
select d.department_id,l.location_id,l.city
from hr.departments d
left join hr.locations l
on d.location_id=l.location_id
union select d.department_id,l.location_id,l.city
from hr.departments d
right join hr.locations l
on d.location_id=l.location_id order by department_id;


/* ------ 5.self join ----- */
select e.employee_id,e.first_name,m.first_name as manager
from hr.employees e
join hr.employees m
on e.manager_id=m.employee_id;

/* joins three tables */
select e.employee_id,e.first_name,d.department_id,l.location_id,l.city
from hr.employees e
join hr.departments d
on e.department_id=d.department_id
join hr.locations l
on d.location_id=l.location_id where city="london";



