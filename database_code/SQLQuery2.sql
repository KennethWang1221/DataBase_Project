--select * from course 

--select couno �γ̱��,teacher ��ʦ,schooltime �Ͽ�ʱ��,limitnum ����ѡ������,willnum ��������
--from course;

--select  distinct kind from course

--select *from student

--select * 
--from Student
--where stuno<=6;
--���ϱ߽����ͬ ��2 select top 6 * from student

--select couname �γ�����, couno �γ̱��
--from course
--where couno='001'

select stuname ѧ������,classno �༶���
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

select *,willnum/limitnum ��ֵ
from course

select *,willnum/limitnum ��ֵ
from course 
order by willnum asc

select teacher ��ʦ��, couno �γ̱��, couname �γ���
from course
order by teacher desc ,couno asc

select *
from course
where schooltime like '%�ܶ�%'
order by schooltime desc

select   count(couname)
from course

select sum(limitnum) �γ̱������ṩ������ѡ�޿γ�
from course

select kind,count(couname) 
from course
group by kind

select kind �γ����,count(couname) ����γ̵���Ŀ 
from course
group by kind
having count(couname)>3

--�鿴������������15�ĸ���γ̵����ٱ�����������౨������
select  kind �γ����,count(couname) ����γ̵���Ŀ ,max(willnum) �������,min(willnum) ��С������
from course
where willnum>15
group by kind
