-- mysql 함수
-- UCASE, UPPER 문자형 함수 예시(소문자 -> 대문자)
select ucase('Seoul'), upper('seoul');

-- LCASE, LOWER 문자형 함수 예시 (대문자 -> 소문자)
select lcase('Seoul'), lower('seoul');

-- substring 예제(3번째부터 2개를 뽑아오시오) - index가 1부터 시작한다.
select substring('Happy Day',3,2);
select substring('Happy Day',3,2) from employees;
select substring('Happy Day',3,2) from dual;

-- substring 예제 : employees 테이블에서 1989년에 입사한 직원의 이름, 입사일을 출력하세요.
select concat(first_name, ' ', last_name) as '이름', hire_date as '입사일' from employees where substring(hire_date,1,4);

-- LPAD, RPAD : 자릿수를 정해서 그 자리를 채워지지않으면 자신이 지정한 문자나 수로 채워진다.
select lpad('hi',5,'?') from dual;
select rpad('hi',5,'?') from dual;

-- LPAD, RPAD 예시 : salaries 테이블에서 2001년 급여가 70000불 이하의 직원만 사번, 급여로 출력하되 급여는 10자리로 부족한 자리수는 *로 표시
select emp_no, lpad(cast(salary as char),10,'*') from salaries where from_date like '2001%' and salary <= 70000;

-- TRIM, LTRIM, RTRIM ( 공백을 삭제하는 함수 )
select concat('---', ltrim('   hello   '),'---'), concat('---', rtrim('   hello   '),'---'), concat('---', trim('   hello   '),'---') from dual;

select trim(both 'x' from 'xxxhixxx'), trim(leading 'x' from 'xxxhixxx'), trim(trailing 'x' from 'xxxhixxx');

-- TRIM, LTRIM, RTRIM 예제 : salaries 테이블에 대한 LPAD 예제의 결과를 * 생락하여 표시