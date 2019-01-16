desc department;

insert into departnononamement values(null, '총무팀');
insert into department values(null, '개발팀');
insert into department values(null, '인사팀');
insert into department values(null, '영업팀');

select * from department;

desc employee;

insert into employee values(null, '둘리',2);
insert into employee values(null, '마이콜',1);
insert into employee values(null, '또치',3);
insert into employee values(null, '길동',null);

select * from employee;
select * from department;

select * from employee, department;
select *
	from employee a, department b
	where b.no = a.department_no;

-- left join ( outer join )
select a.name, ifnull(b.name, '소속없음')
	from employee a
    left outer join department b
    on b.no = a.department_no;

-- right join ( outer join )
select *
	from employee a
    right outer join department b
    on b.no = a.department_no;

-- full join ( outer join , mysql 지원하지 않는다 union으로 묶어서 써야된다.)
select *
	from employee a
    right outer join department b
    on b.no = a.department_no
union
select *
	from employee a
    left outer join department b
    on b.no = a.department_no;
    
-- join ~on ( inner join )
select *
	from employee a
    join department b
    on b.no = a.department_no;    
    
    
    
    
    
    