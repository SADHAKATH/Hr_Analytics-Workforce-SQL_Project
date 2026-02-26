/* DATA QUARY LANGUAGE(DQL):
SELECT ----> columns to fetch from data
FROM ----> from which table
WHERE ----> conditin before grouping data
GROUP ----> segment the data into groups
HAVING ----> condition after grouping data
ORDER BY ----> sort the data either ascending and descending.

*/
use hr;
select * from employees;     			------ all rows and column from table ----

select employee_id,first_name,department_id
from employees
where department_id=50;


select employee_id,first_name,department_id
from employees
where salary>5000;

select employee_id,first_name,department_id,salary
from employees
where salary between 5000 and 10000;

select * from employees where salary between 5000 and 10000;

select employee_id,first_name,department_id,salary
from employees where first_name="steven";


select employee_id,first_name,department_id,salary from employees where salary>5000 and department_id=50;

select employee_id,first_name,department_id,salary from employees where salary>5000 or department_id=50;

select * from employees;

select employee_id,first_name,department_id,salary from employees where commission_pct is not null;

select employee_id,first_name,department_id,salary from employees where commission_pct is null;


/* pattern matching function are using----like---- */

select * from employees where first_name like "j%";    /*----- place holder ------*/

select * from employees where first_name like "%j";

select * from employees where first_name like "%an%";

select count(employee_id)as employee_id,department_id from employees group by department_id;

select count(employee_id)as employee_id,department_id from employees where department_id is not null group by department_id;

select count(employee_id)as count, department_id from employees where department_id is not null group by department_id having count(*)>4;

select salary from employees order by salary desc;

select count(employee_id)as count, department_id from employees where department_id is not null group by department_id having count(*)>4 order by department_id desc;

select count(employee_id)as count, department_id from employees where department_id is not null group by department_id having count(*)>4 order by department_id limit 3;


/* LIMIT 2 is used by how many rows to print */
/* OFFSET 2 is used by  no.of.step to skip the row */
select count(employee_id)as count, department_id from employees where department_id is not null group by department_id having count(*)>4 order by department_id limit 3 offset 2;

select * from employees order by department_id limit 5 offset 15;



