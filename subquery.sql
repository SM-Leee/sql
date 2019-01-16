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
                                                    
-- 실습문제 1. 현재 전체사원의 평균 연봉보다 적은 급여를 받는 사원의 이름, 급여를 나타내세요.
select concat(a.first_name,' ',a.last_name), b.salary
	from employees a, salaries b
    where a.emp_no = b.emp_no and b.salary<(select avg(salary) from salaries where to_date = '9999-01-01') 
    order by b.salary desc;
    
-- 실습문제 2. 현재 가장적은 평균 급여를 받고 있는 직책에서 평균 급여를 구하세요.
select b.title, avg(a.salary) as avg_salary
	from salaries a, titles b
    where a.emp_no = b.emp_no and a.to_date = '9999-01-01' and b.to_date = '9999-01-01' 
    group by b.title
    
    having avg(a.salary) = (select min(avg_salary)
	from (select b.title, avg(a.salary) as avg_salary
			from salaries a, titles b
			where a.emp_no = b.emp_no and a.to_date = '9999-01-01' and b.to_date = '9999-01-01' group by b.title) a);
    
select min(avg_salary)
	from (select b.title, avg(a.salary) as avg_salary
			from salaries a, titles b
			where a.emp_no = b.emp_no and a.to_date = '9999-01-01' and b.to_date = '9999-01-01' group by b.title) a;

select title, min(avg_salary)
	from (select b.title as title, avg(a.salary) as avg_salary
			from salaries a, titles b
			where a.emp_no = b.emp_no and a.to_date = '9999-01-01' and b.to_date = '9999-01-01' 
			group by b.title) a;

 


