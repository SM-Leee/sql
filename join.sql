-- inner join : 조인조건을 만족하는 행에 대해서만 겨롸값이 나오는 조인 - 가능하면 Alias를 붙여서 사용한다.

-- equijoin : equal 연산자를 사용하는 조인
select * from employees, titles where employees.emp_no = titles.emp_no;
select * from employees a, titles b where a.emp_no = b.emp_no;
-- select emp_no from employees, titles where employees.emp_no = titles.emp_no;

-- 예제 : 현재 근무중인 직원의 이름과 직책을 출력하세요.
select a.emp_no, concat(a.first_name,' ',a.last_name) as '이름', b.title as'직책' 
	from employees a, titles b 
	where a.emp_no = b.emp_no and b.to_date = '9999-01-01';
    
select a.emp_no, concat(a.first_name,' ',a.last_name) as '이름', b.title as'직책' 
	from employees a
    join titles b on a.emp_no = b.emp_no
	where b.to_date = '9999-01-01';
    
-- 예제 : 현재 근무중인 직책이 Senior Emginner인 직원의 이름을 출력하세요.
select a.emp_no, concat(a.first_name,' ',a.last_name) as '이름' 
	from employees a, titles b 
	where a.emp_no = b.emp_no and b.to_date = '9999-01-01' and b.title = 'Senior Engineer';
 
-- 예제 : 현재 근무중인 직책이 Senior Emginner인 여성직원의 이름을 출력하세요.
select a.emp_no, concat(a.first_name,' ',a.last_name) as '이름' 
	from employees a, titles b 
	where a.emp_no = b.emp_no and b.to_date = '9999-01-01' and b.title = 'Senior Engineer' and a.gender = 'f';
    
-- ANSI / ISO SQL의 JOIN

-- 1. natural join : 두 테이블에 공통 칼럼이 있는 경우 별다은 조인 조건없이 공통칼럼처럼 묵시적으로 조인이 되는 유형
-- 문제점 : 조인하고자 하는 두 테이블에 같은 이름의 카럼이 많을때
select a.emp_no, concat(a.first_name,' ',a.last_name) as '이름', b.title as'직책' 
	from employees a
    natural join titles b
	where b.to_date = '9999-01-01';
    
-- 2. join ~using : 특정한 칼럼으로만 조인하고 싶다면 using절을 사용해서 기술한다.
select a.emp_no, concat(a.first_name,' ',a.last_name) as '이름', b.title as'직책' 
	from employees a
    join titles b using(emp_no)
	where b.to_date = '9999-01-01';
    
-- 3. join ~on : 공통된 이름의 칼럼이 없는 경우 가장 보편적으로 사용할 수 있는 유형
select a.emp_no, concat(a.first_name,' ',a.last_name) as '이름', b.title as'직책' 
	from employees a
    join titles b on a.emp_no = b.emp_no
	where b.to_date = '9999-01-01';
    
-- 실습문제 1. 현재 회사 상황을 반영한 직월별 근무부서를 사번, 직원 전체이름, 근무부서 형태로 출력해보세요.
select a.emp_no as '사번', concat(a.first_name,' ',a.last_name) as '이름', c.dept_name as '근무부서'
	from employees a, dept_emp b, departments c
	where a.emp_no = b.emp_no and b.dept_no = c.dept_no and b.to_date = '9999-01-01' 
    order by concat(a.first_name,' ',a.last_name) asc;

-- 실습문제 2. 현재 회사에서 지급되고 잇는 급여체계를 반영한 결과를 출력하세요. 사번, 전체이름, 연봉 이런형태로 출력하세요.
select a.emp_no as '사번', concat(a.first_name,' ',last_name) as '이름', b.salary as '연봉'
	from employees a, salaries b
    where a.emp_no = b.emp_no and b.to_date = '9999-01-01'
    order by concat(a.first_name,' ',a.last_name) asc;

