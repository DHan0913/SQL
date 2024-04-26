-- 문제 1
SELECT
    COUNT(manager_id) havaMngCnt
FROM
    employees;
    
-- 문제 2
SELECT
    MAX(salary) - MIN(salary) "최고임금-최저임금"
FROM
    employees;
    
-- 문제 3
SELECT
    TO_CHAR(
        MAX(hire_date), 'YYYY"년" MM"월" DD"일"'
    ) "마지막 입사일"
FROM
    employees;
    
-- 문제 4
SELECT
    department_id 부서,
    AVG(salary)   평균임금,
    MAX(salary)   최고임금,
    MIN(salary)   최저임금
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id DESC;
    
-- 문제 5
SELECT
    job_id      업무,
    ROUND(
        AVG(salary)
    )           평균임금,
    MAX(salary) 최고임금,
    MIN(salary) 최저임금
FROM
    employees
GROUP BY
    job_id
ORDER BY
    job_id ASC;
    
-- 문제 6
SELECT
    TO_CHAR(
        MIN(hire_date), 'YYYY-MM-DD day'
    )
FROM
    employees;
    
-- 문제 7
SELECT
    department_id             부서,
    AVG(salary)               평균임금,
    MIN(salary)               최저임금,
    AVG(salary) - MIN(salary) "평균임금-최저임금"
FROM
    employees
HAVING
    AVG(salary) - MIN(salary) < 2000
GROUP BY
    department_id
ORDER BY
    AVG(salary) - MIN(salary) DESC;
    
-- 문제 8
SELECT
    job_id,
    max_salary - min_salary
FROM
    jobs
ORDER BY
    max_salary - min_salary DESC;
    
-- 문제 9
SELECT
    manager_id,
    ROUND(
        AVG(salary)
    ),
    MIN(salary),
    MAX(salary)
FROM
    employees
WHERE
    hire_date > TO_DATE('2015-01-01', 'YYYY-MM-DD')
GROUP BY
    manager_id
ORDER BY
    AVG(salary) DESC;
    
-- 문제 10
SELECT
    first_name,
    hire_date,
    CASE
    WHEN hire_date < TO_DATE(12, 'YY') THEN
    '창립멤버'
    WHEN hire_date < TO_DATE(13, 'YY') THEN
    '13년 입사'
    WHEN hire_date < TO_DATE(14, 'YY') THEN
    '14년 입사'
    ELSE
    '상장이후입사'
    END optDate
FROM
    employees
ORDER BY
    hire_date ASC;