
create database mydb;
use mydb;
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
					RDATE datetime,
					
					primary key(CNO,BNO),
					foreign key(CNO) references CARD(CNO),
					foreign key(BNO) references Books(BNO)
					);
					
					
insert into  CARD values('1','zhang','�����һ��','����� ');
insert into  CARD values('2','wang','��ѧһ��','��ѧϵ');
insert into  CARD values('3','chen','Ӣ��һ��','Ӣ��ϵ');
insert into  CARD values('4','xu','����һ��','����ϵ');
    
insert into  BOOKS  values('1','��ѧӢ��','Ӣ���ʦ','12.34','23');
insert into  BOOKS  values('2','����','�½�ʦ','12.67','21');
insert into  BOOKS  values('3','C����','����ʦ','32.34','13'); 
insert into  BOOKS  values('4','���������','����ʦ','42.34','33');
insert into  BOOKS  values('5','��ѧ','����ʦ','32.34','67');
insert into  BOOKS  values('6','����','֣��ʦ','15.34','456');
insert into  BOOKS  values('7','ˮ�','ˮʦ','72.87','29');
					
select * from CARD;
select * from BOOKS;
select * from BORROW;
				
select cno,'����ͼ�����'=COUNT(*)
from BORROW
group by CNO
having COUNT(*)>5
-- 3�� ��ѯ������"ˮ�"һ��Ķ��ߣ�����������༶��
select ����=NAME,class 
from card,books,BORROW
where BNAME='ˮ�' and BORROW.CNO=card.CNO and
					 BORROW.bno=books.bno
					 
-- 4�� ��ѯ��������"����"�ؼ��ʵ�ͼ�飬�����š����������ߡ�
select ���=BNAME, ����=BNAME, ����=AUTHER
from BOOKS
where BNAME like '%����%';


--5 ��ѯ����ͼ���м۸���ߵ�ͼ�飬������������ߡ�
select BNAME,AUTHER
from BOOKS
where PRICE=(
            select MAX(price)
            from BOOKS)
            
            
-- 6������һ����ͼ����ʾ"�����һ��"��ѧ���Ľ�����Ϣ
-- ��ֻҪ����ʾ��������������  

create view class1 
as
select NAME,BNAME 
	  from CARD,BOOKS,BORROW
	  where card.CNO=BORROW.CNO and
			books.bno=borrow.bno
			and class='�����һ��'
			
--7.��BOOKS����ɾ����ǰ���˽��ĵ�ͼ���¼
delete from BOOKS
where BNO not in
               (select BNO 
               from BORROW)
               
               
  -- 8. ��"C01"��ͬѧ����ͼ��Ļ��ڶ��ӳ�һ��
update BORROW 
set RDATE=dateadd(DAY,7,RDATE)
from CARD,BORROW
where CARD.CNO=BORROW.CNO and CARD.CLASS='c01'

-- 9. ���������������ѯͼ����Ϣ���뽨�����ʵ��������������ƽУ�shuming��
create unique index  shuming on books(bname)    
	    
-- 10.Ϊcrad������1��YXMC��Ժϵ���ƣ����ɱ䳤�����20���ַ�
alter table card add YXMC varchar(20)         



