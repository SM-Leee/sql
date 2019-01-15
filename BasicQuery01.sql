-- Basic Query 연습
drop table pet;

create table pet(
	name varchar(20),
    owner varchar(20),
    species varchar(20),
    gender char(1),
    birth date,
    death date
);

desc pet;

insert into pet values('두부','이성민','dog','M','2015-2-27',NULL);

select * from pet;

-- load data 파일을 불러와서 database에 한번에 insert 하는 방법(\n은 null을 뜻한다)
load data local infile "D:\\duzon\\eclipse-workspace\\sql\\pet.txt" into table pet;

-- sql select
select * from pet; -- database의 모든 table을 다 가져올때;
select * from pet where name = 'Bowser'; -- Bowser라는 이름을 가진 data 만 가져오시오
select * from pet where birth >= '1998-01-01';	-- 출생년도가 1998년 이상인 data 만 가져오시오
select * from pet where species = 'dog' and gender = 'f';	-- 종이 강아지이고 성별이 암컷인 동물의 data를 가져오시오.
select * from pet where species='snake' or species ='bird'; -- 종이 뱀이거나 새인 data를 가져오시오.
select name, birth from pet;	-- name 과 birth의 data만 가져오시오.

select name, birth from pet order by birth desc;	-- order by 순서대로 정리하고 싶을때에 사용된다. (desc - 내림차순 / asc - 오름차순(default))
select name, gender, birth from pet order by gender asc, birth desc;

-- null 다루기
select * from pet where gender is null;

select * from pet where gender is not null;


