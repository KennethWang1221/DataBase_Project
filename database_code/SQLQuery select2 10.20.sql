select * from class
select * from course
select * from department
select * from stucou
select * from student

--19.按课程类别分组统计各类课程的门数
select 课程类别=kind,各类课程的门数=count(kind)
from course
group by kind;

--20查看课程类别为‘信息技术’、‘管理’的平均报名人数
select 课程类别=kind , 平均报名人数= avg(willnum)
from course
where kind in ('信息技术','管理')
group by kind
--先where 先分组pass掉其他系 得到要的课程类别 在求AVG
--此方法在having里边查写条件不通用having kind in('信息技术','管理'); 直接找到目标组 再求AVG 第一步不在是先排除其他系了

--21查询建筑工程系所开设的课程
select 建筑工程系开设的课程=couname
from course
where departno='02';

select 建筑工程系开设的课程=couname,course.departno
from course, department
where course.departno=department.departno
	  and department.departname='建筑工程系'

select 建筑工程系开设的课程=couname
from course
where departno in
				(select departno
				 from department 
				 where departno=02)

--22查询彭少帆所选的课程名称
select 彭少帆所选的课程=student.stuno,课程名称=couname
from student,stucou,course
where student.stuname='彭少帆'
and student.stuno=stucou.stuno
and stucou.couno=course.couno

--23 查询选择了建筑工程系开设课程的学生的信息
select *
from student,stucou,course,department
where student.stuno=stucou.stuno
and course.couno=stucou.couno
and course.departno=department.departno
and department.departname='建筑工程系'


--24查询选择了建筑工程系开设课程
--的20000002班、20000003班的学生的信息
select distinct (student.stuname)
from student,stucou,course,department
where student.classno in('20000002','20000003')
and student.stuno=stucou.stuno
and course.couno=stucou.couno
and course.departno=department.departno
and department.departname='建筑工程系'

--25.查询 彭少帆 的同班同学的名字
select  学生班级= student.classno,  学生姓名=  stuname
from student,class
where  student.classno =
				(select distinct classno
				from student
				where stuname='彭少帆')

select stuname
from student
where classno=
			 (select classno
			 from student
			 where stuname='彭少帆')
			
			
--26.查询报名人数大于平均报名人数的课程信息
select *
from course
where willnum>
			(select avg(willnum)
			from course)
			
--27.查询学分>=2.5的课程 与 课程名中含有S的课程的并集
select *
from course
where course.credit>=2.5
union 
select *
from course
where course.couname like '%s%'

--查询学分>=2.5的课程 与 课程名中含有S的课程的并集，重复的行也保留
select *
from course
where course.credit >=2.5
union all
select *
from course
where course.couname like '%s%'

--29.查询学分>=2.5的课程 与 课程名中含有S的课程的交集
select *
from course
where course.credit>=2.5
intersect
select *
from course
where course.couname like '%s%'
