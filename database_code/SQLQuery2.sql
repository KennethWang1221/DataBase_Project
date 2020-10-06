--select * from course 

--select couno 课程编号,teacher 教师,schooltime 上课时间,limitnum 限制选课人数,willnum 报名人数
--from course;

--select  distinct kind from course

--select *from student

--select * 
--from Student
--where stuno<=6;
--和上边结果相同 法2 select top 6 * from student

--select couname 课程名称, couno 课程编号
--from course
--where couno='001'

select stuname 学生姓名,classno 班级编号
from student
where stuno='00000001'

select * 
from course
where willnum between 15and 25

select *
from course
where willnum>25 or willnum<15

select *
from course
where couno in(004,007,013)

select *
from course
where couno not in(004,007,013)

select *,willnum/limitnum 比值
from course

select *,willnum/limitnum 比值
from course 
order by willnum asc

select teacher 教师名, couno 课程编号, couname 课程名
from course
order by teacher desc ,couno asc

select *
from course
where schooltime like '%周二%'
order by schooltime desc

select   count(couname)
from course

select sum(limitnum) 课程表中能提供多少人选修课程
from course

select kind,count(couname) 
from course
group by kind

select kind 课程类别,count(couname) 各类课程的数目 
from course
group by kind
having count(couname)>3

--查看报名人数大于15的各类课程的最少报名人数和最多报名人数
select  kind 课程类别,count(couname) 各类课程的数目 ,max(willnum) 最大报名数,min(willnum) 最小报名数
from course
where willnum>15
group by kind
