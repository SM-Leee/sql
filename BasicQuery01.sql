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