-- show tables;
-- 1.�ӿγ̱��в�ѯ���пγ̵���Ϣ
select * from Course;
-- 2.��ѯ�γ̱�(Course)�еĿγ̱�š�
-- ��ʦ���Ͽ�ʱ�䡢����ѡ�������ͱ�������
-- ��Ҫ����ʾ���ֱ��⡣

select �γ̱��=couno,��ʦ=teacher,�Ͽ�ʱ��=schooltime,
����ѡ������=limitnum,��������=willnum
from Course;

-- 3.�ӿγ̱�Course���в�ѯ�γ�������Ϣ
select distinct �γ����=kind
from Course;

-- 4.��ѧ����Student���в�ѯ���е���Ϣ
-- ��Ҫ��ֻ��ʾ��ѯ�����ǰ6�����ݡ�
select   top 6 *
from Student;

-- 5.��ѯ�γ̱����Ϣ��Ҫ�������ѯ���Ϊ��
-- �γ�����		�γ̱��
-- SQL Serverʵ�ü���    �γ̱��Ϊ��001
select �γ�����=couname,�γ̱��=couno
from course;
select * from Student;
-- 6.��ѯѧ��Ϊ��00000001��ͬѧ�������Ͱ༶���
select StuName,ClassNo 
from Student
where stuno='00000001';
select * from Course;
-- 7.��ѯ�����������ڵ���25���Ҷ��ڵ���15�˵Ŀγ���Ϣ��
select * 
from Course
where WillNum between 15 and 25;

--8.��ѯ������������25�˻�������15�˵Ŀγ���Ϣ
select * 
from Course
where WillNum>25 or WillNum<15;

-- 9.��ѯ�γ̱��Ϊ��004������007������013���Ŀγ���Ϣ��
select * 
from Course
where CouNo in(004,007,013);

-- 10.��ѯ�γ̱�Ų�Ϊ��004������007������013���Ŀγ���Ϣ��
select *
from Course
where CouNo not in (004,007,013);

-- 11.��ѯ�γ̱�Ŀγ���Ϣ��������������ѡ����֮�ȡ�
select *,willnum/limitnum ��ֵ
from Course;

-- 12.��ѯ�γ���Ϣ��������������ѡ����֮�ȡ�Ҫ���ѯ������ձ���������������
select *,willnum/limitnum ��ֵ
from Course
order by WillNum asc;

-- 13.��ѯ�γ̱�Ľ�ʦ�����γ̱�š��γ�����
-- Ҫ���ѯ������Ȱ��ս�ʦ����������
-- ��ʦ����ͬʱ�����տγ̱����������
select ��ʦ��=teacher  ,�γ̱��=couno, �γ̺�=couname
from course
order by teacher desc,couno asc; 
select * from Course;
-- 14.�ڿγ̱��в鿴�ܶ�����Щѡ�޿�
-- ��Ҫ���Ͽ�ʱ�������ѯ�����
select * 
from Course
where schooltime like '%�ܶ�%'
order by SchoolTime asc;

-- 15.ͳ�ƿγ̱��й��ж�����ѡ�޿Ρ�
select ѡ�޿�����=COUNT(*) 
from Course

-- 16.�鿴�γ̱������ṩ������ѡ�޿γ̡�
select sum(limitnum)
from Course; 

-- 17.���γ�������ͳ�Ƹ���γ̵�����
select kind,����γ̵�����=COUNT(*)
from Course
group by (kind);

-- 18.�鿴������������15��
-- ����γ̵����ٱ�����������౨��������
select kind,���ٱ�������=MAX(willnum),��౨������=MIN(willnum)
from Course
where WillNum>15
group by(kind);





