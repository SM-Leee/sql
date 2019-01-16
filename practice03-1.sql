
-- 예제5. 현재 직책별로 평균 연봉과 인원수를 구하되 직책별로 인원이 100명 이상인 직책만 출력하세요.
select b.title as '직책', avg(a.salary) as '평균연봉', count(b.title) as '인원수'
	from salaries a, titles b, employees c
    where a.emp_no = b.emp_no and a.to_date = '9999-01-01' and b.to_date = '9999-01-01' and c.emp_no = a.emp_no
    group by b.title
    having count(b.title) >= 100;

-- 예제6. 현재 부서별로 현재 직책이 Engineer인 직원들에 대해서만 평균 급여를 구하세요.
select d.dept_name as '부서', avg(c.salary)
	from dept_emp a, titles b, salaries c, departments d, employees e
    where a.emp_no = b.emp_no and a.emp_no = e.emp_no and a.emp_no = c.emp_no and b.title = 'Engineer' and a.dept_no = d.dept_no and a.to_date='9999-01-01' and b.to_date ='9999-01-01' and c.to_date = '9999-01-01'
    group by a.dept_no;

-- 예제7. 현재 직책별로 급여의 총합을 구하되 Engineer직책은 제외하세요.
-- 		단, 총합이 2,000,000,000 이상인 직책만 나타내며 급여총합에 대해서 내림차순(desc)로 정렬하세요.
select c.title as '직책', sum(b.salary) as '급여의 총합'
	from employees a, salaries b, titles c
    where a.emp_no = b.emp_no and a.emp_no = c.emp_no and c.title != 'Engineer' and b.to_date = '9999-01-01' and c.to_date = '9999-01-01'
    group by c.title
    having sum(b.salary)>=2000000000
    order by sum(b.salary) desc;