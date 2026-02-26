/* aggregated functions()
1. avg()
2. sum()
3. count()
4. min()
5. max()
*/

use hr;

select * from employees;

select salary, count(*) from employees group by salary having count(*)>1 order by salary desc;

select max(salary) from employees where salary < (select max(salary) from employees); ---- employees highest salary 2nd ---

select avg(salary) from employees;

select sum(salary) from employees;

select count(salary) from employees;

select min(salary) from employees;

select max(salary) from employees;

/* COMPARISON FUNCTION:
1. <
2. <=
3. >
4. >=
5. ==
6. !=
*/