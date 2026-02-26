SHOW DATABASES;
USE HR;
-- PRINT EMPLOYEES TABLE:
SELECT * FROM EMPLOYEES;
-- WINDOWS FUNCTION:

/* SYNTAX FOR WINDOWS FUNCTION
SELECT COL1_NAME, COL2_NAME
WINDOW_FUNCTION()
OVER(PARTITION BY COL_NAME ORDER BY COL_NAME)
FROM TABLE_NAME
*/

-- RANKING FUNCTION:CATEGORE
/*
1.Ranking Functions 
ROW_NUMBER()-Assigns unique sequential numbers
*/

SELECT EMPLOYEE_ID,FIRST_NAME,SALARY,
ROW_NUMBER()OVER(ORDER BY SALARY DESC)FROM EMPLOYEES;

SELECT EMPLOYEE_ID,FIRST_NAME,SALARY,
ROW_NUMBER()OVER(ORDER BY SALARY DESC) RANK1 FROM EMPLOYEES;

SELECT EMPLOYEE_ID,FIRST_NAME,SALARY,DEPARTMENT_ID,
ROW_NUMBER()OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) FROM EMPLOYEES;

-- DENSE_RANK()

SELECT EMPLOYEE_ID,FIRST_NAME,SALARY,DEPARTMENT_ID,
ROW_NUMBER()OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) FROM EMPLOYEES WHERE DEPARTMENT_ID IS NOT NULL;

/*2.Aggreegate  Window Function:
-- Running totals and averages:*/
USE HR;

SELECT first_name,last_name,department_id,hire_date,salary,
SUM(salary) OVER (ORDER BY hire_date)
as running_total
FROM employees
ORDER BY hire_date;
-- partition by:
SELECT first_name,last_name,department_id,hire_date,salary,
SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_date)
as running_total
FROM employees
where department_id is not null;
-- RUNNING TOTAL AND AVERAGE
SELECT first_name,last_name,department_id,salary,HIRE_DATE,
SUM(salary) OVER (PARTITION BY
department_id ORDER BY hire_date DESC)
as running_total,
round(AVG(salary) OVER (PARTITION BY
department_id ORDER BY hire_date DESC),2) as dept_avg_salary
FROM employees;
/*
3.value functions
LAG() and LEAD()
Access previous/next row values
*/
-- lag()
SELECT first_name,department_id,salary,
LAG(salary,2) OVER (ORDER BY salary)
as prev_salary
FROM employees
ORDER BY salary;
-- LAG PARTITIN() 
SELECT first_name,department_id,salary,
LAG(salary,1) OVER (PARTITION BY department_id ORDER BY salary)
as prev_salary
FROM employees
ORDER BY salary;

-- lead()
SELECT first_name,department_id,salary,
LEAD(salary,1) OVER (ORDER BY salary)
as prev_salary
FROM employees
ORDER BY salary;
-- LEAD PARTITION()
SELECT first_name,department_id,salary,
LEAD(salary,1) OVER (PARTITION BY department_id ORDER BY salary)
as prev_salary
FROM employees
where department_id is not null;

-- sal difference using lag
SELECT first_name,department_id,salary,
LAG(salary,1)
OVER(ORDER BY salary) as lag_sal,
salary - LAG(salary,1)
OVER(ORDER BY salary) as salary_jump
FROM employees
ORDER BY salary;


-- sal difference using lEAD
SELECT first_name,department_id,salary,
LEAD(salary,1)
OVER(ORDER BY salary) as lag_sal,
salary - LEAD(salary,1)
OVER(ORDER BY salary) as salary_jump
FROM employees
ORDER BY salary;


SELECT first_name,department_id,salary,
LAG(salary,1)OVER (ORDER BY salary) as prev_salary,
LEAD(salary,1)OVER (ORDER BY salary) as next_salary,
salary - LAG(salary,1)OVER (ORDER BY salary) as salary_jump,
LEAD(salary,1)OVER (ORDER BY salary) - salary
as gap_to_next
FROM employees ORDER BY salary;

-- first_value():
/*find the first employee hired in each department based on hire_date*/
select employee_id,department_id,first_name,last_name,hire_date,
first_value(first_name)over(partition by department_id order by hire_date)
as first_hired_in_dept 
from employees;

-- " Range between unbounded preceding and current rows "

/*find the last employee in each department based on hire_date*/
select employee_id,department_id,first_name,last_name,hire_date,
last_value(first_name)over(partition by department_id order by hire_date rows between unbounded preceding and unbounded following)
as last_hired_in_dept 
from employees;


-- NTILE() - Divide into groups:
SELECT first_name,department_id,salary,
NTILE(6) OVER (ORDER BY salary DESC)as salary_quartile
FROM employees;

-- VIEW IN MYSQL:
CREATE VIEW HIGH_SALARY AS 
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY
FROM EMPLOYEES
WHERE SALARY>10000;

DROP VIEW HIGH_SALARY; -- TO DROP THE VIEW

SELECT * FROM HIGH_SALARY;