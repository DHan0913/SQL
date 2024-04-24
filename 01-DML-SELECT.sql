-- SQL 문장의 주석 '--'
-- 마지막에 세미콜론으로 끝난다.
-- 키워드들은 테이블명, 컬럼 등은 대소문자를 구분하지 않는다.
-- 실제 데이터의 경우 대소문자를 구분

-- 테이블 구조 확인 (DESCRIBE)
DESCRIBE employees;
--describe EMPLOYEES;
Describe Departments;
Describe Locations;


-- DML (Data Manipulation Language)
-- SELECT 

-- * : 테이블 내 모든 컬럼 Projection, 테이블 설계시에 정의한 순서대로 
SELECT * FROM employees;

-- 특정 컬럼만 Projection하고자 하면 열 목록을 명시

-- employees 테이블의 First_name, phone_number, hire_date, salary 만 보고 싶다면
SELECT first_name, phone_number, hire_date, salary FROM employees;

-- 사원의 이름, 성, 급여, 전화번호, 입사일 정보 출력 
SELECT first_name, last_name, salary, phone_number, hire_date From employees;

-- 사원 정보로부터 사번, 이름, 성 정보 출력
SELECT employee_id, first_name, last_name FROM employees;

-- 산술연산 : 기본적인 산술연산을 수행할 수 있다.
-- 특정 테이블의 값이 아닌 시스템으로부터 데이터를 받아오고자 할때 : dual (가상테이블)
SELECT 3.14159 * 10 * 10 FROM dual;

-- 특정 컬럼의 값을 산술 연산에 포함
SELECT first_name, salary, salary * 12 FROM employees;

-- 다음 문장을 싱행해 봅시다.
SELECT first_name, job_id, job_id*12 FROM employees; 
-- 오류의 원인 : job_id는 문자열 VARCHAR2 
DESC employees;

-- NULL
-- 이름, 급여, 커미션 비율을 출력
SELECT first_name, salary, commission_pct FROM employees;

-- 이름, 커미션까지 포함한 급여를 출력
SELECT first_name, salary, commission_pct, salary+salary*commission_pct 
FROM employees;
-- NULL이 포함된 연산식의 결과는 NULL
-- NULL을 처리하기 위한 함수 NVL이 필요 NVL (값, 값이 null일때 대체 값)

-- NVL활용 대체값 계산
SELECT first_name, salary, commission_pct, salary+salary * NVL (commission_pct, 0) 
FROM employees;


-- NULL은 0이나 "" 와 다르게 빈 값이다.
-- NULL은 산술연산 결과, 통계 결과를 왜곡 -> NULL에 대한 처리는 철저하게 


-- 별칭 Alias 
-- Projection 단계에서 출력용으로 표시되는 임시 컬럼 제목 

-- 컬럼형 뒤에 별칭
-- 컬럼명 뒤에 as 별칭 
-- 표시명에 특수문자 포함된 경우 "" 로 묶어서 부여

-- 직원 아이디, 이름, 급여 출력
-- 직원 아이디는 empNo, 이름은 f-name, 급여는 월급으로 표시 
SELECT employee_id empNo -- 컬럼명 뒤에 별칭
, first_name as "f-name" -- as 별칭, 특수문자 포함되면 ""로 묶음
, salary "급 여"  -- 공백문자도 특수문자 
FROM employees;


-- 직원 이름(first_name last_name 합쳐서) name
-- 급여(커미션이 포함된 급여), 급여 * 12 연봉 별칭으로 표기
SELECT first_name || ' ' || last_name "Full Name" 
, salary + salary * nvl(commission_pct, 0) "급여(커미션포함)" 
, salary * 12 연봉
FROM employees;

-- 연습 Alias 붙이기 
SELECT first_name || ' ' || last_name 이름, 
hire_date 입사일, 
phone_number 전화번호, 
salary 급여, 
salary * 12 연봉
FROM employees;


--------
--where
--------
-- 특정 조건을 기준으로 레코드를 선택 (SELECTION)

-- 비교연산 : =, <>, >, >=, <, <=

-- 사원들 중, 급여가 15000 이상인 직원의 이름과 급여 
SELECT  first_name, salary
FROM employees
WHERE salary > 15000;
    
-- 입사일이 07/01/01 이후인 직원들의 이름과 입사일 
SELECT first_name, hire_date
FROM employees
WHERE hire_date >= '15/01/01';
    
-- 급여가 14000 이하이거나, 17000 이상인 사원의 이름과 급여
SELECT first_name, salary
FROM employees
WHERE salary <= 4000 OR salary >= 17000;
    
-- 급여가 14000 이상이고, 17000 이하인 사원의 이름과 급여
SELECT first_name, salary
FROM employees
WHERE salary <= 17000 AND salary >= 14000;
    
-- BETWEEN : 범위 비교
SELECT first_name, salary
FROM employees
WHERE salary BETWEEN 14000 and 17000;

-- NULL 체크 =, <> 사용하면 안됨
-- IS NULL, IS NOT NULL

-- commission을 받지 않는 사람들 (-> commission_pct 가 null인 레코드)
SELECT first_name, commission_pct
FROM employees
WHERE commission_pct IS NULL;   -- NULL 체크

-- commission을 받는 사람들 (-> commission_pct가 널이 아닌 레코드) IS NOT NULL
SELECT first_name, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;   -- NULL 체크

-- IN 연산자 : 특정 집합의 요소와 비교 
-- 사원들 중 10, 20, 40번 부서에서 근무하는 직원들의 이름과 부서 아이디
SELECT first_name, department_id 
FROM employees
WHERE department_id = 10 OR department_id = 20 OR department_id = 40;

-- IN 연산자 : 특정 집합의 요소와 비교
SELECT first_name, department_id 
FROM employees
WHERE department_id IN (10, 20, 40);

-- LIKE 연산자 
-- ename LIKE 'KOR%' : KOR로 시작하는 모든 문자열 (KOR 포함)
-- ename LIKE 'KOR_' : KOR 뒤에 하나의 문자가 오는 모든 문자열
-- ename LIKE 'KOR/%%' ESCAPE '/' : 'KOR%'로 시작하는 모든 문자열

-------------
-- LIke 연산
-------------
-- 와일드카드(%,_)를 이용한 부분 문자열 매핑
-- % : 0개 이상의 정해지지 않은 문자열
-- _ : 1개의 정해지지 않은 문자

-- 이름에 am을 포함하고 있는 사원의 이름과 급여 
SELECT first_name, salary
FROM employees
WHERE LOWER(first_name) LIKE '%am%';

-- 이름의 두번째 글자가 a인 사원의 이름과 급여
SELECT first_name, salary
FROM employees
WHERE LOWER(first_name) LIKE '_a%';

-- 이름의 네번째 글자가 a인 사원의 이름과 급여
SELECT first_name, salary
FROM employees
WHERE LOWER(first_name) LIKE '___a%';

-- 이름이 네글자인 사원들 중에서 두번째 글자가 a인 사원의 이름과 급여
SELECT first_name, salary
FROM employees
WHERE LOWER(first_name) LIKE '_a__';