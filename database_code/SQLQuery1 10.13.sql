--19.���γ�������ͳ�Ƹ���γ̵�����
select �γ����=kind,����γ̵�����=count(kind)
from course
group by kind;

--20�鿴�γ����Ϊ����Ϣ����������������ƽ����������
select �γ����=kind , ƽ����������= avg(willnum)
from course
where kind in ('��Ϣ����','����')
group by kind
--��where �ȷ���pass������ϵ �õ�Ҫ�Ŀγ���� ����AVG
--�˷�����having��߲�д������ͨ��having kind in('��Ϣ����','����'); ֱ���ҵ�Ŀ���� ����AVG ��һ�����������ų�����ϵ��

--21��ѯ��������ϵ������Ŀγ�
select ��������ϵ����Ŀγ�=couname
from course
where departno='02';

select ��������ϵ����Ŀγ�=couname,course.departno
from course, department
where course.departno=department.departno
	  and department.departname='��������ϵ'

select ��������ϵ����Ŀγ�=couname
from course
where departno in
				(select departno
				 from department 
				 where departno=02)

--22��ѯ���ٷ���ѡ�Ŀγ�����
select ���ٷ���ѡ�Ŀγ�=student.stuno,�γ�����=couname
from student,stucou,course
where student.stuname='���ٷ�'
and student.stuno=stucou.stuno
and stucou.couno=course.couno

--23 ��ѯѡ���˽�������ϵ����γ̵�ѧ������Ϣ
select *
from student,stucou,course,department
where student.stuno=stucou.stuno
and course.couno=stucou.couno
and course.departno=department.departno
and department.departname='��������ϵ'


--24��ѯѡ���˽�������ϵ����γ�
--��20000002�ࡢ20000003���ѧ������Ϣ
select distinct (student.stuname)
from student,stucou,course,department
where student.classno in('20000002','20000003')
and student.stuno=stucou.stuno
and course.couno=stucou.couno
and course.departno=department.departno
and department.departname='��������ϵ'
