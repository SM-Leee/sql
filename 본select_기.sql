show tables;

select count(*) from employees;

select * from employees;
select * from employees limit 1000, 1000; -- 1000번부터 1000개를 가져오시오.

select * from dept_emp;
select * from dept_manager;

-- 예제 : deaprtments 테이블의 모든 데이터를 출력.
select * from departments;

-- 특정칼럼검색 예제 : employees 테이블에서 직원의 이름,  성별, 입사일을 출력
select first_name, gender, hire_date from employees;

-- ALIAS 예제 : employees 테이블에서 직원의 이름,  성별, 입사일을 출력
select emp_no as '번호', first_name as '이름', gender as '성별', hire_date as '입사일' from employees;

-- Concatenation 예제 : employees 테이블에서 직원의 전체이름,  성별, 입사일을 출력
SELECT concat( first_name, ' ', last_name) AS '이름', gender AS '성별',  hire_date AS '입사일' FROM employees;

-- 중복행의 제거(DISTINCT) 예제 1:  titles 테이블에서 모든 직급의 이름 출력
select title from titles;

-- 중복행의 제거(DISTINCT) 예제 2: titles 테이블에서 직급은 어떤 것들이 있는지 직급이름을 한 번씩만 출력
select distinct title from titles;

-- order by(정렬) 예시 : employees 테이블에서 직원의 전체이름, 성별, 입사일을 입사일 순으로 출력
select concat(first_name,' ',last_name) as '이름', gender as '성별', hire_date as '입사일' from employees order by hire_date asc;

-- order by(정렬) 예시 : salaries 테이블에서 2001년 월급을 가장 높은순으로 사번, 월급순으로 출력
select emp_no, salary from salaries where '2000-12-31' < from_date <= '2001-12-31' order by salary desc;
select emp_no, salary from salaries where from_date like '2001-%' order by salary desc;

-- where 예시 : employees 테이블에서 1991년 이전에 입사한 직원의 이름, 성별, 입사일을 출력
select concat(first_name,' ',last_name) as '이름', gender as '성별', hire_date as '입사일' from employees where hire_date <'1991-01-01';

-- where 예시 : employees 테이블에서 1989년 이전에 입사한 여직원의 이름 입사일을 출력
select concat(first_name,' ',last_name) as '이름', hire_date as '입사일' from employees where hire_date <'1989-01-01' and gender ='f';

-- IN 비교연산자 예시 : dept_emp 테이블에서 부서 번호가 d005나 d009에 속한 사원 사번, 부서번호 출력
select emp_no, dept_no from dept_emp where dept_no = 'd005' or dept_no ='d009';
select emp_no, dept_no from dept_emp where dept_no in('d005','d009');

-- LIKE 비교연산자 예시 : employees 테이블에서 1989년에 입사한 직원의 이름, 입사일을 출력
select  concat(first_name,' ', last_name) as '이름', hire_date from employees where hire_date like '1989%';


