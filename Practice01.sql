-- 문제 1
SELECT
    first_name   이름,
    salary       월급,
    phone_number 전화번호,
    hire_date    입사일
FROM
    employees
ORDER BY
    hire_date ASC;
    
-- 문제 2
SELECT
    job_title,
    max_salary
FROM
    jobs
ORDER BY
    max_salary DESC;
    
-- 문제 3
SELECT
    first_name,
    manager_id,
    commission_pct,
    salary
FROM
    employees
WHERE
    manager_id IS NOT NULL
    AND salary > 3000
    AND commission_pct IS NULL;
    
-- 문제 4
SELECT
    job_title,
    max_salary
FROM
    jobs
WHERE
    max_salary >= 10000
ORDER BY
    max_salary DESC;

-- 문제 5
SELECT
    first_name,
    salary,
    nvl(
        commission_pct, 0
    )
FROM
    employees
ORDER BY
    salary DESC;

-- 문제 6 
SELECT
    first_name,
    salary,
    TO_CHAR(
        hire_date, 'YYYY-MM'
    ) hire_date,
    department_id
FROM
    employees
WHERE
    department_id IN ( 10, 9, 100 );

-- 문제 7
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    lower(first_name) LIKE '%s%';

-- 문제 8 
SELECT
    department_name
FROM
    departments
ORDER BY
    LENGTH(department_name) DESC;

-- 문제 9 
SELECT
    UPPER(country_name)
FROM
    countries
ORDER BY
    country_name ASC;

-- 문제 10 
SELECT
    first_name,
    REPLACE(
        SUBSTR(
            phone_number, 3
        ), '.', '-'
    ) phone_number,
    salary,
    hire_date
FROM
    employees
WHERE
    hire_date < '13/12/31';