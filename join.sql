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



