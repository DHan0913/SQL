-- 문제1
SELECT
    first_name,
    manager_id,
    commission_pct,
    salary
FROM
    employees
WHERE
    manager_id IS NOT NULL
    AND commission_pct IS NULL
    AND salary > 3000;
    
-- 문제2
SELECT
    emp.employee_id,
    emp.first_name,
    emp.salary,
    to_char(
        emp.hire_date, 'yyyy-mm-dd day'
    ),
    SUBSTR(
        replace(
            emp.phone_number, '.', '-'
        ), 3
    ) 전화번호,
    emp.department_id
FROM
    employees emp,
    (
        SELECT
            MAX(salary) salary,
            department_id
        FROM
            employees
        GROUP BY
            department_id
    )         emp2
WHERE
    emp.department_id = emp2.department_id
    AND emp.salary = emp2.salary
ORDER BY
    salary DESC;
    
-- 문제8
SELECT
    department_name
FROM
    departments dept,
    (
        SELECT
            department_id
        FROM
            employees
        GROUP BY
            department_id
        HAVING
            AVG(salary) = (
                SELECT
                    MAX(avg_salary)
                FROM
                    (
                        SELECT
                            AVG(salary) AS avg_salary
                        FROM
                            employees
                        GROUP BY
                            department_id
                    )
            )
    )           dep
WHERE
    dept.department_id = dep.department_id;
    
-- 문제9
SELECT r.region_name
FROM regions r
JOIN countries c ON r.region_id = c.region_id
JOIN locations l ON c.country_id = l.country_id
JOIN departments d ON l.location_id = d.location_id
JOIN employees e ON d.department_id = e.department_id
GROUP BY r.region_name
HAVING AVG(e.salary) = (
    SELECT MAX(avg_salary)
    FROM (
        SELECT AVG(e.salary) AS avg_salary
        FROM regions r
        JOIN countries c ON r.region_id = c.region_id
        JOIN locations l ON c.country_id = l.country_id
        JOIN departments d ON l.location_id = d.location_id
        JOIN employees e ON d.department_id = e.department_id
        GROUP BY r.region_name
    )
);


-- 문제10
SELECT
    job_title
FROM
    jobs j,
    (
        SELECT
            job_id
        FROM
            employees
        GROUP BY
            job_id
        HAVING
            AVG(salary) = (
                SELECT
                    MAX(avg_salary)
                FROM
                    (
                        SELECT
                            AVG(salary) AS avg_salary
                        FROM
                            employees
                        GROUP BY
                            job_id
                    )
            )
    )           emp
WHERE
    j.job_id = emp.job_id;
    