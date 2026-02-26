/*
What is a CTE in MySQL?
A Common Table Expression (CTE) in MySQL is a temporary, 
named result set that exists only within the scope 
of a single SQL statement. CTEs are defined using 
the WITH clause and can be referenced multiple 
times within the same query, making complex 
queries easier to read, maintain, and debug
*/

/*
SYNTAX:

WITH cte_name AS (
    SELECT ...
)
SELECT ...
FROM cte_name;

*/

use hr;
-- COMMON TABLE EXPRESSION:(CTE)
WITH dept_avg_salary AS (
    SELECT department_id, AVG(salary) AS avg_sal
    FROM employees
    GROUP BY department_id
)
SELECT department_id, avg_sal
FROM dept_avg_salary
WHERE avg_sal > 10000;

-- fetch employees with their managers
WITH emp_mgr_cte AS (
    SELECT 
        e.employee_id,
        e.first_name AS employee_name,
        e.manager_id,
        m.first_name AS manager_name
    FROM employees e
    LEFT JOIN employees m ON e.manager_id = m.employee_id
)
SELECT * FROM emp_mgr_cte;

use hr;
EXPLAIN SELECT * FROM employees WHERE salary > 10000;


