-- 문제 1

SELECT
    COUNT(salary)
FROM
    employees
WHERE
    salary < (
        SELECT
            AVG(salary)
        FROM
            employees
    );
    
-- 문제 2
SELECT
    employee_id,
    first_name,
    salary,
    (
        SELECT
            AVG(salary)
        FROM
            employees
    ) 평균급여,
    (
        SELECT
            MAX(salary)
        FROM
            employees
    ) 최대급여
FROM
    employees
WHERE
    salary >= (
        SELECT
            AVG(salary)
        FROM
            employees
    )
    AND salary <= (
        SELECT
            MAX(salary)
        FROM
            employees
    )
ORDER BY
    salary;
    
-- 문제 3
SELECT
    location_id,
    street_address,
    postal_code,
    city,
    state_province,
    country_id
FROM
    locations
WHERE
    location_id = (
        SELECT
            location_id
        FROM
            departments
        WHERE
            department_id = (
                SELECT
                    department_id
                FROM
                    employees
                WHERE
                    first_name LIKE 'Steven'
                    AND last_name LIKE 'King'
            )
    );
    
-- 문제 4
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary < ANY (
        SELECT
            salary
        FROM
            employees
        WHERE
            job_id = 'ST_MAN'
    )
ORDER BY
    salary DESC;
    
-- 문제 5
SELECT
    emp.department_id,
    emp.employee_id,
    emp.first_name,
    emp.salary
FROM
    employees emp,
    (
        SELECT
            department_id,
            MAX(salary) salary
        FROM
            employees
        GROUP BY
            department_id
    )         sal
WHERE
    emp.department_id = sal.department_id
    AND emp.salary = sal.salary
ORDER BY
    emp.salary DESC;
    
-- 문제6
SELECT
    job_title,
    (
        SELECT
            SUM(salary)
        FROM
            employees emp
        WHERE
            emp.job_id = j.job_id
    ) AS sumSalary
FROM
    jobs j
ORDER BY
    sumSalary DESC;
    
-- 문제7

SELECT
    emp.employee_id,
    emp.first_name,
    emp.salary
FROM
    employees emp,
    (
        SELECT
            department_id,
            AVG(salary) salary
        FROM
            employees
        GROUP BY
            department_id
    )         sal
WHERE
    emp.department_id = sal.department_id
    AND emp.salary > sal.salary
ORDER BY
    emp.salary DESC;
    
-- 문제 8 *** 확인 ******* 잘모르겠음
SELECT
    *
FROM
    (
        SELECT
            employee_id,
            first_name,
            salary,
            hire_date,
            RANK()
            OVER(
                ORDER BY
                    hire_date DESC
            ) AS rank
        FROM
            employees
    )
WHERE
    rank BETWEEN 11 AND 15;

SELECT
    *
FROM
    (
        SELECT
            employee_id,
            first_name,
            salary,
            hire_date,
            ROWNUM rank
        FROM
            (
                SELECT
                    employee_id,
                    first_name,
                    salary,
                    hire_date
                FROM
                    employees
                ORDER BY
                    hire_date DESC
            )
    )
WHERE
    rank BETWEEN 11 AND 15;

-- ***********************