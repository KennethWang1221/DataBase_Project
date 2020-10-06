
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
					
					
insert into  CARD values('1','zhang','计算机一班','计算机 ');
insert into  CARD values('2','wang','数学一班','数学系');
insert into  CARD values('3','chen','英语一班','英语系');
insert into  CARD values('4','xu','政治一班','政治系');
    
insert into  BOOKS  values('1','大学英语','英语教师','12.34','23');
insert into  BOOKS  values('2','高数','陈教师','12.67','21');
insert into  BOOKS  values('3','C语言','王老师','32.34','13'); 
insert into  BOOKS  values('4','计算机网络','高老师','42.34','33');
insert into  BOOKS  values('5','化学','华老师','32.34','67');
insert into  BOOKS  values('6','政治','郑老师','15.34','456');
insert into  BOOKS  values('7','水浒','水师','72.87','29');
					
select * from CARD;
select * from BOOKS;
select * from BORROW;
				
select cno,'所借图书册数'=COUNT(*)
from BORROW
group by CNO
having COUNT(*)>5
-- 3． 查询借阅了"水浒"一书的读者，输出姓名及班级。
select 姓名=NAME,class 
from card,books,BORROW
where BNAME='水浒' and BORROW.CNO=card.CNO and
					 BORROW.bno=books.bno
					 
-- 4． 查询书名包括"网络"关键词的图书，输出书号、书名、作者。
select 书号=BNAME, 书名=BNAME, 作者=AUTHER
from BOOKS
where BNAME like '%网络%';


--5 查询现有图书中价格最高的图书，输出书名及作者。
select BNAME,AUTHER
from BOOKS
where PRICE=(
            select MAX(price)
            from BOOKS)
            
            
-- 6．建立一个视图，显示"计算机一班"班学生的借书信息
-- （只要求显示姓名和书名）。  

create view class1 
as
select NAME,BNAME 
	  from CARD,BOOKS,BORROW
	  where card.CNO=BORROW.CNO and
			books.bno=borrow.bno
			and class='计算机一班'
			
--7.从BOOKS表中删除当前无人借阅的图书记录
delete from BOOKS
where BNO not in
               (select BNO 
               from BORROW)
               
               
  -- 8. 将"C01"班同学所借图书的还期都延长一周
update BORROW 
set RDATE=dateadd(DAY,7,RDATE)
from CARD,BORROW
where CARD.CNO=BORROW.CNO and CARD.CLASS='c01'

-- 9. 如果经常按书名查询图书信息，请建立合适的索引（索引名称叫：shuming）
create unique index  shuming on books(bname)    
	    
-- 10.为crad表增加1列YXMC（院系名称），可变长，最大20个字符
alter table card add YXMC varchar(20)         



