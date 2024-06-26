-- 문제 1
SELECT
    COUNT(manager_id) havaMngCnt
FROM
    employees;
    
-- 문제 2
SELECT
    MAX(salary)               최고임금,
    MIN(salary)               최저임금,
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
    ROUND(
        AVG(salary)
    )           평균임금,
    MAX(salary) 최고임금,
    MIN(salary) 최저임금,
    job_id      업무아이디
FROM
    employees
GROUP BY
    job_id
ORDER BY
    MIN(salary) DESC,
    ROUND(
        AVG(salary)
    ) ASC;
    
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
GROUP BY
    department_id
HAVING
    AVG(salary) - MIN(salary) < 2000
ORDER BY
    "평균임금-최저임금" DESC;
    
-- 문제 8
SELECT
    job_title,
    max_salary - min_salary
FROM
    jobs
ORDER BY
    max_salary - min_salary DESC;

SELECT
    job_id,
    MAX(salary) - MIN(salary) diff
FROM
    employees
GROUP BY
    job_id
ORDER BY
    diff DESC;
    
-- 문제 9
SELECT
    manager_id,
    ROUND(
        AVG(salary), 1
    ),
    MIN(salary),
    MAX(salary)
FROM
    employees
WHERE
    hire_date >= '15/01/01'
GROUP BY
    manager_id
HAVING
    AVG(salary) >= 5000
ORDER BY
    AVG(salary) DESC;
      
-- 문제 10
SELECT
    first_name,
    hire_date,
    CASE
    WHEN hire_date <= '12/12/31' THEN
    '창립멤버'
    WHEN hire_date <= '13/12/31' THEN
    '13년 입사'
    WHEN hire_date <= '14/12/31' THEN
    '14년 입사'
    ELSE
    '상장이후입사'
    END optDate
FROM
    employees
ORDER BY
    hire_date ASC;