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

-- null 다루기 (is null, is not null)
select * from pet where gender is null;

select * from pet where gender is not null;

-- 패턴매칭(Like 검색) (like, not like)
select * from pet where name like "b%";	-- name이 b로 시작하는 모든 문자열
select * from pet where name like "b____"; -- name이 b로 시작하고 문자열이 5개로 이루어진 data를 가져오시오.
select * from pet where name like "%fy";
select * from pet where name like "%w%";
select * from pet where name like "_____"; -- name에서 문자열의 갯수가 5인 data를 가져오시오
select * from pet where length(name)=5; -- name에서 문자열의 갯수가 5인 data를 가져오시오

-- count()
select count(*) as '총 애완동물 수' from pet;

select owner, count(*) from pet group by owner; -- 각 주인들이 몇마리의 애완동물을 가지고 있는가를 알고싶을때

select owner, count(*) from pet where death is null or death ='0000-00-00' group by owner having count(*)>1; 

