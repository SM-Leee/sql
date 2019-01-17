-- subquery

-- 현재 Fai Bale이 근무하는 부서에서 근무하는 직원의 사번, 전체 이름을 출력해보세요.
select a.emp_no, b.dept_no
	from employees a, dept_emp b
    where a.emp_no = b.emp_no and concat(a.first_name,' ',a.last_name) = 'Fai Bale' and b.to_date = '9999-01-01';
    
select a.emp_no, concat(a.first_name,' ', a.last_name)
	from employees a, dept_emp b
    where a.emp_no = b.emp_no and b.dept_no = 'd004';

-- where에서 =로 줄때에는 비교하는 것 하나만 select에서 나와야 되는것이 좋다.
select a.emp_no, concat(a.first_name,' ', a.last_name), b.dept_no
	from employees a, dept_emp b
    where a.emp_no = b.emp_no and b.dept_no = (select b.dept_no
													from employees a, dept_emp b
													where a.emp_no = b.emp_no and concat(a.first_name,' ',a.last_name) = 'Fai Bale' and b.to_date = '9999-01-01');
-- 단일행인 경우 <, >, =, !=, <=, >=
                                                    
-- 실습문제 1. 현재 전체사원의 평균 연봉보다 적은 급여를 받는 사원의 이름, 급여를 나타내세요.
select concat(a.first_name,' ',a.last_name), b.salary
	from employees a, salaries b
    where a.emp_no = b.emp_no and b.salary<(select avg(salary) from salaries where to_date = '9999-01-01') 
    order by b.salary desc;
    
-- 실습문제 2. 현재 가장적은 평균 급여를 받고 있는 직책에서 평균 급여를 구하세요.
select min(avg_salary)
from (select c.title, avg(b.salary) as avg_salary
		from employees a, salaries b, titles c
		where b.emp_no = c.emp_no and b.to_date = '9999-01-01' and c.to_date = '9999-01-01'
		group by c.title) a;

-- 다중행
-- in / any / all 
-- any
-- =any : 이 중에 한개라도 맞으면 된다 (in이랑 완전 동일하다)(or의 뜻이다)
-- >=any : 이 중에 한개라도 크면 된다.
-- >any, <any, <>any, >=any

-- all ( 논리적으로 단일행 이여야만 성립한다 )
-- =all ,>all, <all, <>all : 한개라도 같지 않아야된다, >=all, <=all
-- 모든 것과 조건이 같아야지 된다.

-- ex) 현재 급여가 50000 이상인 직원 이름 출력
select concat(a.first_name,' ',a.last_name), b.salary
	from employees a, salaries b
    where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
    and a.emp_no = any(select emp_no
						from salaries
						where salary >= 50000 and to_date = '9999-01-01');
                        
select concat(a.first_name,' ',a.last_name), b.salary
	from employees a,
		(select emp_no, salary
			from salaries
			where salary >= 50000 and to_date = '9999-01-01') b
	where a.emp_no = b.emp_no and b.salary>=50000;
