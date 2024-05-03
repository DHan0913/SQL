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
    
-- 문제3
SELECT
    emp.manager_id,
    man.first_name,
    ROUND(
        AVG(emp.salary), 1
    ) avg_salary,
    MIN(emp.salary),
    MAX(emp.salary)
FROM
    employees emp
    JOIN employees man ON emp.manager_id = man.employee_id
WHERE
    emp.hire_date >= '2015-01-01'
GROUP BY
    emp.manager_id,
    man.first_name
HAVING
    AVG(emp.salary) >= 5000
ORDER BY
    avg_salary DESC; 
    
-- 문제4
SELECT
    emp.employee_id,
    emp.first_name,
    department_name,
    man.first_name
FROM
    employees emp
    JOIN employees   man ON emp.manager_id = man.employee_id
    LEFT OUTER JOIN departments dept ON dept.department_id = emp.department_id;

-- 문제5
SELECT
    *
FROM
    (
        SELECT
            employee_id,
            first_name,
            department_id,
            hire_date,
            RANK()
            OVER(
                ORDER BY
                    hire_date ASC
            ) AS rank
        FROM
            employees
    ) ab
    JOIN departments d ON ab.department_id = d.department_id
WHERE
    rank BETWEEN 11 AND 20
ORDER BY
    hire_date;

-- 문제6
SELECT
    first_name
    || ' '
    || last_name    AS name,
    salary          연봉,
    department_name 부서명,
    hire_date
FROM
    employees e
    JOIN departments d ON d.department_id = e.department_id
WHERE
    hire_date = (
        SELECT
            MAX(hire_date)
        FROM
            employees
    );

-- 문제7
SELECT
    employee_id,
    first_name,
    last_name,
    job_title,
    sal.a
FROM
    employees emp
    JOIN jobs j ON emp.job_id = j.job_id
    JOIN (
        SELECT
            AVG(salary) a,
            department_id
        FROM
            employees emp
            JOIN jobs j ON emp.job_id = j.job_id
        GROUP BY
            department_id
    )    sal ON sal.department_id = emp.department_id
WHERE
    sal.a = (
        SELECT
            MAX(AVG(salary))
        FROM
            employees
        GROUP BY
            department_id
    );





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
SELECT
    r.region_name
FROM
    regions r
    JOIN countries   c ON r.region_id = c.region_id
    JOIN locations   l ON c.country_id = l.country_id
    JOIN departments d ON l.location_id = d.location_id
    JOIN employees   e ON d.department_id = e.department_id
GROUP BY
    r.region_name
HAVING
    AVG(e.salary) = (
        SELECT
            MAX(avg_salary)
        FROM
            (
                SELECT
                    AVG(e.salary) AS avg_salary
                FROM
                    regions r
                    JOIN countries   c ON r.region_id = c.region_id
                    JOIN locations   l ON c.country_id = l.country_id
                    JOIN departments d ON l.location_id = d.location_id
                    JOIN employees   e ON d.department_id = e.department_id
                GROUP BY
                    r.region_name
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
    )    emp
WHERE
    j.job_id = emp.job_id;