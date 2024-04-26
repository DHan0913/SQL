-----------
-- JOIN
-----------

-- employees와 departments
DESC employees;
DESC departments;

SELECT
    *
FROM
    employees;     -- 107
SELECT
    *
FROM
    departments;   -- 27

SELECT
    *
FROM
    employees,
    departments;
-- 카티전 프로덕트 (Cross Join)

SELECT
    *
FROM
    employees,
    departments
WHERE
    employees.department_id = departments.department_id;  
-- INNER JOIN, EQUI-JOIN 


-- alias를 이용한 원하는 필드의 Projection
-----------------------------
-- Simple Join or Equi-Join
-----------------------------

SELECT
    first_name,
    emp.department_id,
    dept.department_id,
    department_name
FROM
    employees   emp,
    departments dept
WHERE
    emp.department_id = dept.department_id;

SELECT
    *
FROM
    employees
WHERE
    department_id IS NULL;

SELECT
    emp.first_name,
    dept.department_name
FROM
    employees emp
    JOIN departments dept USING ( department_id );