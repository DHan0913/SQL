-- 문제 1
SELECT
    employee_id,
    first_name,
    emp.department_id,
    dept.department_id,
    department_name
FROM
    employees   emp,
    departments dept
WHERE
    emp.department_id = dept.department_id
ORDER BY
    department_name ASC,
    employee_id DESC;
    
-- 문제2
SELECT
    employee_id,
    first_name,
    emp.job_id,
    j.job_id,
    job_title,
    salary,
    department_name
FROM
    employees   emp,
    jobs        j,
    departments dept
WHERE
    emp.job_id = j.job_id
    AND dept.department_id = emp.department_id
ORDER BY
    employee_id ASC;
   
-- 문제 2-1
SELECT
    employee_id,
    first_name,
    emp.job_id,
    j.job_id,
    job_title,
    salary,
    department_name
FROM
    employees   emp,
    jobs        j,
    departments dept
WHERE
    emp.job_id = j.job_id
    AND dept.department_id (+)= emp.department_id
ORDER BY
    employee_id ASC;
    
-- 문제 3 
SELECT
    dept.location_id,
    loc.location_id,
    city,
    department_name,
    department_id
FROM
    departments dept,
    locations   loc
WHERE
    dept.location_id = loc.location_id
ORDER BY
    dept.location_id ASC;
    
-- 문제 3-1
SELECT
    dept.location_id,
    loc.location_id,
    city,
    department_name,
    department_id
FROM
    departments dept,
    locations   loc
WHERE
    dept.location_id (+) = loc.location_id;
    
-- 문제 4
SELECT
    reg.region_id,
    coun.region_id,
    country_name,
    region_name
FROM
    regions   reg,
    countries coun
WHERE
    reg.region_id = coun.region_id
ORDER BY
    country_name DESC,
    region_name ASC;

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
    emp.hire_date > man.hire_date;
    
-- 문제 6
SELECT
    loc.city,
    loc.location_id,
    dept.location_id,
    dept.department_id,
    dept.department_name,
    coun.country_name,
    loc.country_id,
    coun.country_id
FROM
    locations   loc,
    departments dept,
    countries   coun
WHERE
    loc.location_id = dept.location_id
    AND coun.country_id = loc.country_id
ORDER BY
    country_name ASC;
    
-- 문제 7
SELECT
    first_name
    || ''
    || last_name name,
    emp.job_id,
    j.job_id,
    emp.employee_id,
    j.employee_id
FROM
    employees   emp,
    job_history j
WHERE
    emp.job_id = j.job_id
    AND emp.job_id LIKE 'AC_ACCOUNT%'
    AND j.job_id LIKE 'AC_ACCOUNT%';
    
-- 문제 8
SELECT
    emp.department_id,
    dept.department_id,
    department_name,
    dept.manager_id,
    emp.manager_id,
    first_name,
    city,
    country_name,
    region_name,
    loc.location_id,
    dept.location_id,
    reg.region_id,
    coun.region_id,
    loc.country_id,
    coun.country_id
FROM
    departments dept,
    employees   emp,
    locations   loc,
    countries   coun,
    regions     reg
WHERE
    dept.manager_id = emp.employee_id
    AND loc.location_id = dept.location_id
    AND coun.region_id = reg.region_id
    AND dept.department_id = emp.department_id
    AND loc.country_id = coun.country_id;
    
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