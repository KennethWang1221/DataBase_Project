--�½���ͼstudent_MA(��ѧϵѧ����ͼ)������Ϊstudent���У�רҵΪMA��ѧ����¼��
create view student_MA
as
select *
from student
where sdept='ma'

--��ѯ��ͼstudent_MA������
select *
from student_ma

--��ѯ��ͼstudent_MA������,�����ձ���������������
select *
from student_ma
order by sage

--����ͼstudent_MA�в�������3��Ԫ��
--����200215128��,�����ᡯ,��Ů��,20,��MA����
--����200215129��,�����ȡ�,��Ů��,21,��MA����
--����200215130��,���ų���,���С�,��CS����
insert
into student_MA
values --('200215128','����','Ů',20,'MA')
      -- ('200215129','����','Ů',21,'MA')
       ('200215130','�ų�','��','22','CS')
       
select *
from student

--���һ����ͼstudent_CS�������ϵѧ����ͼ������ֹ��������ķ���
create view student_cs 
as
select *
from student
where sdept='cs'
with check option

select *
from student

--����ͼstudent_CS������ѧ����Ϣ����200215131��,�����,��Ů��,22,��MA����
insert
into student_cs
values 
       ('200215131','�','Ů','22','ma')
       
--��student_MA��ͼ�и����������20���Ϊ21��
update student_ma
set sage='21'
where sname='����'

select *
from student_ma

--��student��ss�����ȵ�������21��Ϊ25��
update 