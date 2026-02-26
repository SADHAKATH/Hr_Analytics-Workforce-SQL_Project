--  COMMON TECHNIQUIES TO OPTIMIZE QUARY PERFORMANCE --
-- 1.USE INDEXES:
-- EXAMPLE:
create index idx_salary on employees(salary);

-- 2.DONT USE SELECT *

select * from employees;   ---- AVOID USING * 
select employee_id from employees;
-- USE SPECIFIC COL --

-- 3.USE WHERE CLAUSE AND LIMIT:(condition)
select first_name from employees where department_id=90 limit 10;
use hr;

-- 4.USE EXPLAIN TO CHECK QUARY PLAN:
explain select * from employees where salary>7500;

-- 5.USE JOINS OVER SUBQUARY: (joins work faster than subquaries)
-- 6.NORMALIZATION OF DATA:
-- follow
-- 1.normal form ( 1NF )
-- 2.normal form ( 2NF )
-- 3.normal form ( 3NF )

