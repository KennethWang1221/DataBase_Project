-- show tables;
-- 1.从课程表中查询所有课程的信息
select * from Course;
-- 2.查询课程表(Course)中的课程编号、
-- 教师、上课时间、限制选课人数和报名人数
-- ，要求显示汉字标题。

select 课程编号=couno,教师=teacher,上课时间=schooltime,
限制选课人数=limitnum,报名人数=willnum
from Course;

-- 3.从课程表（Course）中查询课程类别的信息
select distinct 课程类别=kind
from Course;

-- 4.从学生表（Student）中查询所有的信息
-- ，要求只显示查询结果的前6行数据。
select   top 6 *
from Student;

-- 5.查询课程表的信息，要求给出查询结果为：
-- 课程名次		课程编号
-- SQL Server实用技术    课程编号为：001
select 课程名称=couname,课程编号=couno
from course;
select * from Student;
-- 6.查询学号为“00000001”同学的姓名和班级编号
select StuName,ClassNo 
from Student
where stuno='00000001';
select * from Course;
-- 7.查询报名人数少于等于25并且多于等于15人的课程信息。
select * 
from Course
where WillNum between 15 and 25;

--8.查询报名人数多于25人或者少于15人的课程信息
select * 
from Course
where WillNum>25 or WillNum<15;

-- 9.查询课程编号为“004”、“007”、“013”的课程信息。
select * 
from Course
where CouNo in(004,007,013);

-- 10.查询课程编号不为“004”、“007”、“013”的课程信息。
select *
from Course
where CouNo not in (004,007,013);

-- 11.查询课程表的课程信息、报名人数与限选人数之比。
select *,willnum/limitnum 比值
from Course;

-- 12.查询课程信息、报名人数与限选人数之比。要求查询结果按照报名人数升序排序。
select *,willnum/limitnum 比值
from Course
order by WillNum asc;

-- 13.查询课程表的教师名、课程编号、课程名、
-- 要求查询结果首先按照教师名降序排序，
-- 教师名相同时，则按照课程编号升序排序。
select 教师名=teacher  ,课程编号=couno, 课程号=couname
from course
order by teacher desc,couno asc; 
select * from Course;
-- 14.在课程表中查看周二有哪些选修课
-- ，要求按上课时间排序查询结果。
select * 
from Course
where schooltime like '%周二%'
order by SchoolTime asc;

-- 15.统计课程表中共有多少门选修课。
select 选修课门数=COUNT(*) 
from Course

-- 16.查看课程表中能提供多少人选修课程。
select sum(limitnum)
from Course; 

-- 17.按课程类别分组统计各类课程的门数
select kind,各类课程的门数=COUNT(*)
from Course
group by (kind);

-- 18.查看报名人数大于15的
-- 各类课程的最少报名人数和最多报名人数。
select kind,最少报名人数=MAX(willnum),最多报名人数=MIN(willnum)
from Course
where WillNum>15
group by(kind);





