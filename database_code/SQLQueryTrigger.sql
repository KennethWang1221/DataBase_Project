create table classinfo(
classno varchar(10),
classname varchar(10),
teachername varchar (20),
totalsum int
)

create table studentinfo(
stuname varchar(10),
stuno varchar(10),
stuclass varchar (20),
gender char(4)
)

create table teacherinfo(
teano varchar(10),
teaname varchar(10),
gender char (20),
age varchar (4),
telephone varchar(20),
)


select *from classinfo
select *from studentinfo

insert into classinfo values ('002','计算机一班','陈平',1)
insert into studentinfo values('李勇','101','002','男')


create trigger T_addstudent
on studentinfo
for insert
as 
  update classinfo set totalsum=totalsum+1
  where classno =(select stuclass from inserted)
  
  
insert into studentinfo values('张三','102','002','男')
  
--回显 已经或者刚才 删除的数据 
create trigger T_deletestudent
on studentinfo
for delete
as
	select *from deleted
	
delete from studentinfo 
where stuname='李勇' 

delete from studentinfo 
where stuname='张三' 


exec sp_helptext T_addstudent


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

select *from course


create trigger T_addCredit
on course
for insert
as
	update course
	       set ccredit=ccredit+50
	where cno=(select cpno
			   from inserted)

insert into course values('8','uml','4',3)

