drop table member;

drop table user;

create table user(
	no int unsigned not null auto_increment,
    email varchar(50) not null,
    passwd varchar(100) not null,
    name varchar(25),
    juminbunho char(13) not null,
    join_date date not null,
    dept_no int unsigned,
    primary key(no),
    
    foreign key(dept_no) references dept(no) on delete cascade -- set null / cascade
	
);

insert into dept(name) values('개발팀');
select * from dept;
insert into user values(null, 'a@a.com', password('1234'), '둘리', '',now(), 3);
select * from user;

-- on delete restrict
delete from user where no = 1;
delete from dept where no = 1;
-- set null
delete from dept where no = 2;
-- cascade
delete from dept where no = 3;
desc member;

-- table 수정 (colume 추가/삭제/변경)
-- 칼럼 추가 /삭제
alter table member add juminbunho char(13) not null;
alter table member drop juminbunho;
alter table member add juminbunho char(13) not null first;
alter table member add juminbunho char(13) not null after name;
alter table member add join_date date not null;
desc member;

-- 칼럼 변경
alter table member change no no int unsigned not null auto_increment;
alter table member change department_name dept_name varchar(20) not null default 'none';

alter table member rename user;

desc user;

-- foreign key ( 제약조건 constraint : 데이터의 생성, 삭제, 수정에 제약을 준다.)
create table dept(
	no int unsigned not null auto_increment,
    name varchar(50) not null,
    primary key(no)
);

alter table user drop column dept_name;

drop table user;





