-- CURDATE(), CURRENT_DATE : 오늘 날짜를 YYYY--MM--DD나 YYYYMMDD 형태식으로 반환한다.
select curdate(), current_date;

-- CURTIME(), CURRENT_TIME : 현재 시각을 HH:MM:SS나 HHMMSS 형식으로 반환한다.
select curtime(), current_time;

-- NOW(), SYSDATE(), CURRENT_TIMESTAMP : 오늘 현 시각을 YYYY-MM-DD HH:MM:SS나 YYYYMMDDHHMMSS 형식으로 반환한다.
-- now()와 sysdate()의 차이점 : now()는 쿼리가 실행 될때 시간이 계속 유지 / sysdate() 는 출력될째때마다 현재 시간으로 세팅
select now(), sysdate(), current_timestamp;

select emp_no, now() from employees;
select emp_no, sysdate() from employees;

-- DATE_DORMAT(date, format) : 입력된 date를 format 형식으로 반환한다.
select first_name, date_format(hire_date,"%Y-%m-%d %h:%i:%s") from employees;

-- PERIOD_DIEF(p1, p2) : YYMM이나 YYYYMM으로 표기되는 p1과 p2의 차이 개월을 반환한다.
-- ex : 각 직원들에 대해 직원이름과 근무개월수 출력
select concat(first_name,' ',last_name) as '이름', concat(cast(period_diff(date_format(curdate(), '%y%m'), date_format(hire_date, '%y%m')) as char),'개월') from employees;

-- DATE_ADD(date, INTERVAL expr type)
-- DATE_SUB(date, INTERVAL expr type)
-- ADDDATE(date, INTERVAL expr type)
-- SUBDATE(date, INTERVAL expr type)
-- ex : 입사 후, 6개월 뒤에 정규직으로 발령이 된다. 발령날은 언제인가?
-- month, week, year, day
select concat(first_name,' ', last_name) as '이름', hire_date, date_add(hire_date, interval 6 month) from employees;

select date_add(cast('1994-02-28' as date), interval 10000 day) from dual;

-- 형변환 (cast(expression as type) or convert(expression, type))