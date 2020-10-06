
create database sjlx
go
use sjlx
go
create table student
(	sno char(10) primary key,
	sname char(20),
	ssex char(2),
	sage smallint,
	sdept char(6)
);

insert into Student values('200215121','李勇','男',20,'CS');
insert into Student values('200215122','刘晨','女',19,'CS');
insert into Student values('200215123','王敏','女',18,'MA');
insert into Student values('200215124','张立','男',19,'IS');

create table course
(	cno char(3) primary key,
	cname char(20),
	cpno char(3),
	ccredit smallint	
);
insert into course values('1','数据库','5',4);
insert into course values('2','数学',null,2);
insert into course values('3','信息系统','1',4);
insert into course values('4','操作系统','6',3);
insert into course values('5','数据结构','7',4);
insert into course values('6','数据处理',null,2);
insert into course values('7','PASCAL语言','6',4);

create table sc
(	sno char(10),
	cno char(3),
	grade numeric(5,1),
	primary key(sno,cno),
	foreign key(sno) references student(sno),
	foreign key(cno) references course(cno),
);

insert into sc values('200215121','1',92);
insert into sc values('200215121','2',85);
insert into sc values('200215121','3',88);
insert into sc values('200215122','2',90);
insert into sc values('200215122','3',80);



