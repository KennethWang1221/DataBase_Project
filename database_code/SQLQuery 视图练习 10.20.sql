--新建视图student_MA(数学系学生视图)，内容为student表中，专业为MA的学生记录。
create view student_MA
as
select *
from student
where sdept='ma'

--查询视图student_MA的内容
select *
from student_ma

--查询视图student_MA的内容,并按照报名人数将序排列
select *
from student_ma
order by sage

--向视图student_MA中插入以下3行元组
--（’200215128’,’付玲’,’女’,20,’MA’）
--（’200215129’,’李萌’,’女’,21,’MA’）
--（’200215130’,’张臣’,’男’,’CS’）
insert
into student_MA
values --('200215128','付玲','女',20,'MA')
      -- ('200215129','李萌','女',21,'MA')
       ('200215130','张臣','男','22','CS')
       
select *
from student

--设计一个视图student_CS（计算机系学生视图），防止上述情况的发生
create view student_cs 
as
select *
from student
where sdept='cs'
with check option

select *
from student

--向视图student_CS，插入学生信息（’200215131’,’李静’,’女’,22,’MA’）
insert
into student_cs
values 
       ('200215131','李静','女','22','ma')
       
--将student_MA视图中付玲的年龄由20岁改为21岁
update student_ma
set sage='21'
where sname='付玲'

select *
from student_ma

--将student表ss中李萌的年龄由21改为25岁
update 