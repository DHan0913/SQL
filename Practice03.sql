-- 문제 1
SELECT
    employee_id,
    first_name,
    last_name,
    department_name
FROM
    employees   emp,
    departments dept
WHERE
    emp.department_id = dept.department_id
ORDER BY
    department_name ASC,
    employee_id DESC;
    
-- ANSI  
SELECT
    employee_id,
    first_name,
    last_name,
    department_name
FROM
    employees emp
    JOIN departments dept ON emp.department_id = dept.department_id
ORDER BY
    department_name ASC,
    employee_id DESC;
    
-- 문제2
SELECT
    employee_id,
    first_name,
    salary,
    department_name,
    job_title
FROM
    employees   emp,
    jobs        j,
    departments dept
WHERE
    emp.job_id = j.job_id
    AND dept.department_id = emp.department_id
ORDER BY
    emp.employee_id ASC;
    
-- ANSI
SELECT
    employee_id,
    first_name,
    salary,
    department_name,
    job_title
FROM
    employees emp
    JOIN jobs        j ON emp.job_id = j.job_id
    JOIN departments dept ON emp.department_id = dept.department_id
ORDER BY
    emp.employee_id ASC;
   
-- 문제 2-1
SELECT
    employee_id,
    first_name,
    salary,
    department_name,
    job_title
FROM
    employees   emp,
    jobs        j,
    departments dept
WHERE
    emp.job_id = j.job_id
    AND dept.department_id (+) = emp.department_id
ORDER BY
    employee_id ASC;
    
-- ANSI
SELECT
    employee_id,
    first_name,
    salary,
    department_name,
    job_title
FROM
    employees emp
    JOIN jobs        j ON emp.job_id = j.job_id
    LEFT OUTER JOIN departments dept ON emp.department_id = dept.department_id
ORDER BY
    employee_id ASC;
    
-- 문제 3 
SELECT
    loc.location_id,
    city,
    department_name,
    department_id
FROM
    departments dept,
    locations   loc
WHERE
    loc.location_id = dept.location_id
ORDER BY
    dept.location_id ASC;
    
-- ANSI
SELECT
    loc.location_id,
    city,
    department_name,
    department_id
FROM
    departments dept
    JOIN locations loc ON loc.location_id = dept.location_id
ORDER BY
    dept.location_id ASC;
    
-- 문제 3-1
SELECT
    loc.location_id,
    city,
    department_name,
    department_id
FROM
    departments dept,
    locations   loc
WHERE
    dept.location_id (+) = loc.location_id
ORDER BY
    dept.location_id ASC;
    
-- ANSI
SELECT
    loc.location_id,
    city,
    department_name,
    department_id
FROM
    departments dept
    RIGHT OUTER JOIN locations   loc ON dept.location_id = loc.location_id
ORDER BY
    dept.location_id ASC;

-- 문제 4
SELECT
    country_name,
    region_name
FROM
    regions reg
    JOIN countries coun ON reg.region_id = coun.region_id
ORDER BY
    reg.region_name ASC,
    coun.country_name DESC;


-- 문제 5
SELECT
    emp.employee_id,
    emp.first_name,
    emp.hire_date,
    man.first_name,
    man.hire_date
FROM
    employees emp,
    employees man
WHERE
    emp.manager_id = man.employee_id
    AND emp.hire_date < man.hire_date; 
    
-- ANSI
SELECT
    emp.employee_id,
    emp.first_name,
    emp.hire_date,
    man.first_name,
    man.hire_date
FROM
    employees emp
    JOIN employees man ON emp.manager_id = man.employee_id
                          AND emp.hire_date < man.hire_date; 
    
-- 문제 6
SELECT
    coun.country_name,
    coun.country_id,
    loc.city,
    loc.location_id,
    dept.department_name,
    dept.department_id
FROM
    locations   loc,
    departments dept,
    countries   coun
WHERE
    loc.location_id = dept.location_id
    AND coun.country_id = loc.country_id
ORDER BY
    coun.country_name ASC;
    
-- ANSI
SELECT
    coun.country_name,
    coun.country_id,
    loc.city,
    loc.location_id,
    dept.department_name,
    dept.department_id
FROM
    locations loc
    JOIN departments dept ON loc.location_id = dept.location_id
    JOIN countries   coun ON coun.country_id = loc.country_id
ORDER BY
    coun.country_name ASC;
    
-- 문제 7
SELECT
    first_name
    || ' '
    || last_name name,
    j.job_id,
    j.employee_id,
    start_date,
    end_date
FROM
    employees   emp,
    job_history j
WHERE
    emp.job_id = j.job_id
    AND emp.job_id LIKE 'AC_ACCOUNT%'
    AND j.job_id LIKE 'AC_ACCOUNT%';

-- ANSI 
SELECT
    first_name
    || ' '
    || last_name name,
    j.job_id,
    j.employee_id,
    start_date,
    end_date
FROM
    job_history j
    JOIN employees emp ON emp.job_id = j.job_id
                          AND emp.job_id LIKE 'AC_ACCOUNT%'
                          AND j.job_id LIKE 'AC_ACCOUNT%';
    
-- 문제 8
SELECT
    dept.department_id,
    department_name,
    first_name,
    city,
    country_name,
    region_name
FROM
    departments dept,
    employees   man,
    locations   loc,
    countries   coun,
    regions     reg
WHERE
    dept.manager_id = man.employee_id
    AND dept.department_id = man.department_id
    AND loc.location_id = dept.location_id
    AND coun.region_id = reg.region_id
    AND loc.country_id = coun.country_id;
    
-- ANSI
SELECT
    dept.department_id,
    department_name,
    man.first_name,
    city,
    country_name,
    region_name
FROM
    departments dept
    JOIN employees man ON dept.manager_id = man.employee_id
    JOIN locations loc ON loc.location_id = dept.location_id
    JOIN countries coun ON loc.country_id = coun.country_id
    JOIN regions   reg ON coun.region_id = reg.region_id;
     
    
-- 문제9
SELECT
    emp.first_name,
    emp.employee_id,
    department_name,
    man.first_name,
    emp.manager_id
FROM
    employees   emp,
    employees   man,
    departments dept
WHERE
    emp.manager_id = man.employee_id
    AND emp.department_id = dept.department_id (+);
    
-- ANSI
SELECT
    emp.first_name,
    emp.employee_id,
    department_name,
    man.first_name,
    emp.manager_id
FROM
    employees emp
    JOIN employees   man ON emp.manager_id = man.employee_id
    LEFT OUTER JOIN departments dept ON emp.department_id = dept.department_id;