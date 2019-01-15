-- 집계함수(통계) : 집계함수가 들어가면 다른 colume은 올수가 없다.
-- salaries 테이블에서 사번이 10060인 직원의 급여 평균과 총합계를 출력
select * from salaries where emp_no like '10060';

select avg(salary), sum(salary) from salaries where emp_no like '10060';

select emp_no, avg(salary), sum(salary) from salaries group by emp_no;

select salary, from_date from salaries where emp_no = 10060;

select *
from(select max(salary) as max_salary, min(salary) as min_salary from salaries where emp_no = 10060) a;

-- 사원별 몇 번의 직책 변경이 있었는지 조회
select emp_no, count(*) from titles group by emp_no;

-- 각 사원별로 평균연봉 출력하되 50000불 이상인 직원만 출력
select emp_no, avg(salary) from salaries group by emp_no having avg(salary)>=50000;