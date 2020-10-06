create table CARD(CNO varchar(40),
				  NAME varchar(40),
				  CLASS varchar(40)
				  primary key(CNO));

				  
create table BOOKS (BNO varchar(40),
					BNAME varchar(40),
					AUTHER varchar(40),
					PRICE varchar(40),
					QUANTITY varchar(40)
					primary key(BNO)
					);


create table BORROW(CNO varchar(40),
					BNO varchar(40),
					RDATE varchar(40),
					primary key(CNO,BNO),
					foreign key(CNO) references CARD(CNO),
					foreign key(BNO) references Books(BNO)
					);
					
 insert into  CARD values('1','zhang','�����һ��');
  insert into  CARD values('2','wang','��ѧһ��');
   insert into  CARD values('3','chen','Ӣ��һ��');
    insert into  CARD values('4','xu','����һ��');
    
insert into  BOOKS  values('1','��ѧӢ��','Ӣ���ʦ','12.34','23');
insert into  BOOKS  values('2','����','�½�ʦ','12.67','21');
insert into  BOOKS  values('3','C����','����ʦ','32.34','13'); 
insert into  BOOKS  values('4','���������','����ʦ','42.34','33');
insert into  BOOKS  values('5','��ѧ','����ʦ','32.34','67');
insert into  BOOKS  values('6','����','֣��ʦ','15.34','456');
insert into  BOOKS  values('7','ˮ�','ˮʦ','72.87','29');
  
select * from BORROW;
select * from BOOKS;
select * from CARD;

 -- 3�� ��ѯ������"ˮ�"һ��Ķ��ߣ�����������༶��
select  ѧ��=CARD.CNO,����=CARD.NAME
from CARD 
where CNO in
              (select CNO
              from BORROW
              where BNO in
                          (select BNO
                          from BOOKS
                          where BNAME='ˮ�')
                          );
					
-- 4�� ��ѯ��������"����"�ؼ��ʵ�ͼ�飬�����š����������ߡ�
select ���=BNAME, ����=BNAME, ����=AUTHER
from BOOKS
where BNAME like '%����%';

--5 ��ѯ����ͼ���м۸���ߵ�ͼ�飬������������ߡ�

select �۸���ߵ�ͼ��=BNAME,����=AUTHER
from BOOKS
where PRICE=(select MAX(PRICE) from BOOKS  );

-- select �۸���ߵ�ͼ��=MAX(PRICE),����=BNAME,����=AUTHER
-- from BOOKS



--   6������һ����ͼ����ʾ"�����һ��"��ѧ���Ľ�����Ϣ��ֻҪ����ʾ��������������
create view  borrowinfo (NAME,BNAME)
as
select NAME ,BNAME
from CARD,BOOKS,BORROW
where CLASS='�����һ��'
			


--7. ��BOOKS����ɾ����ǰ���˽��ĵ�ͼ���¼
delete 
from BOOKS
where BNO not in (
					select BNO
					from BORROW);
					
-- 10					
alter table CARD add YXMC varchar(20);